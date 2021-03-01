//  RequestManager.swift.swift
//  Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

class RequestManager {
    
    var requestHttpHeaders = RestEntity()
    var urlQueryParameters = RestEntity()
    var httpBodyParameters = RestEntity()
    private let jsonDecoder = Utils.jsonDecoder
    
    var httpBody: Data?
    
    func request<T: Decodable>(request: RequestData,
                               timeout: TimeInterval,
                               printLog: Bool,
                               encrypted: Bool,
                               additionalHeader: [String: String],
                               entityClass : T.Type,
                               completionHandler: @escaping (Result<T, APIError>) -> Void) {
        
        let baseURL = URLEndpoint.getBaseUrl(urlContext: request.urlContext)
        let endpoint = "\(baseURL)\(request.endpoint)"
        
        for currentHeader in additionalHeader {
            requestHttpHeaders.add(value: currentHeader.value, forKey: currentHeader.key)
        }
        
        if let params = request.params {
            for param in params {
                var value = param.value as? String
                if value == nil {
                    value = "\(param.value)"
                }
                if let value = value {
                    if request.method == .get {
                        urlQueryParameters.add(value: value, forKey: param.key)
                    } else {
                        httpBodyParameters.add(value: value, forKey: param.key)
                    }
                }
            }
        }
        
        let targetURL = self.addURLQueryParameters(toURL: URL(string: endpoint)!)
        let httpBody = self.getHttpBody()
        guard let request = self.prepareRequest(withURL: targetURL, httpBody: httpBody, httpMethod: request.method) else {
            preconditionFailure()
        }
        
        let session = URLSession(configuration: .default)
        session.dataTask(with: request) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if error != nil{
                self.executeCompletionHandlerInMainThread(whit: .failure(.apiError), completion: completionHandler)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                self.executeCompletionHandlerInMainThread(whit: .failure(.invalidResponse), completion: completionHandler)
                return
            }
            
            guard let dataDes = data else {
                self.executeCompletionHandlerInMainThread(whit: .failure(.noData), completion: completionHandler)
                return
            }
            
            do {
                let decodeResponse = try self.jsonDecoder.decode(T.self, from: dataDes)
                self.executeCompletionHandlerInMainThread(whit: .success(decodeResponse), completion: completionHandler)
            } catch {
                self.executeCompletionHandlerInMainThread(whit: .failure(.serializationError), completion: completionHandler)
            }
        }.resume()

    }
    
    private func executeCompletionHandlerInMainThread<D: Decodable>(whit result: Result<D, APIError>,
                                                                    completion: @escaping (Result<D, APIError>) -> Void) {
        DispatchQueue.main.async {
            completion(result)
        }
    }
    
    private func addURLQueryParameters(toURL url: URL) -> URL {
        if urlQueryParameters.totalItems() > 0 {
            guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return url }
            var queryItems = [URLQueryItem]()
            
            for (key, value) in urlQueryParameters.allValues() {
                let item = URLQueryItem(name: key, value: value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
                
                queryItems.append(item)
                urlComponents.queryItems?.append(item)
            }
            for query in queryItems {
                urlComponents.queryItems?.append(query)
            }
            
            guard let updatedURL = urlComponents.url else { return url }
            return updatedURL
        }
        
        return url
    }
    
    private func getHttpBody() -> Data? {
        guard let contentType = requestHttpHeaders.value(forKey: "Content-Type") else { return nil }
        
        if contentType.contains("application/json") {
            return try? JSONSerialization.data(withJSONObject: httpBodyParameters.allValues(), options: [.prettyPrinted, .sortedKeys])
        } else if contentType.contains("application/x-www-form-urlencoded") {
            let bodyString = httpBodyParameters.allValues().map { "\($0)=\(String(describing: $1.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!))" }.joined(separator: "&")
            return bodyString.data(using: .utf8)
        } else {
            return httpBody
        }
    }
    
    private func prepareRequest(withURL url: URL?, httpBody: Data?, httpMethod: HTTPMethod) -> URLRequest? {
        guard let url = url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        for (header, value) in requestHttpHeaders.allValues() {
            request.setValue(value, forHTTPHeaderField: header)
        }
        
        request.httpBody = httpBody
        return request
    }
    
}

struct RestEntity {
    private var values: [String: String] = [:]
    
    mutating func add(value: String, forKey key: String) {
        values[key] = value
    }
    
    func value(forKey key: String) -> String? {
        return values[key]
    }
    
    func allValues() -> [String: String] {
        return values
    }
    
    func totalItems() -> Int {
        return values.count
    }
}
