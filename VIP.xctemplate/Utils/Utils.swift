//  Utils.swift.swift
//  Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

// MARK: - ApiError
enum APIError: Error, CustomNSError {
    
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fecth data"
        case .invalidEndpoint: return "Invalid enpoint"
        case .invalidResponse: return "Invalild response"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}

// MARK: - AcceptResponseType
public enum AcceptResponseType {
    case json
    case pdf
    case xml
    case text
}

// MARK: - HTTPMethod
public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

// MARK: - RequestData
struct RequestData {
    var params: [String: Any]?
    var arrayParams: [[String: Any]]?
    var method: HTTPMethod
    var urlContext: URLEndpoint.BaseURLContext
    var endpoint: String
    var acceptType = AcceptResponseType.json

    init(params: [String: Any]?,
         method: HTTPMethod,
         urlContext: URLEndpoint.BaseURLContext,
         endpoint: String,
         acceptType: AcceptResponseType = .json) {

        self.params = params
        self.method = method
        self.urlContext = urlContext
        self.endpoint = endpoint
        self.acceptType = acceptType
    }

    init(arrayParams: [[String: Any]]?,
         method: HTTPMethod,
         endpoint: String,
         urlContext: URLEndpoint.BaseURLContext,
         acceptType: AcceptResponseType = .json) {

        self.arrayParams = arrayParams
        self.method = method
        self.urlContext = urlContext
        self.endpoint = endpoint
        self.acceptType = acceptType
    }
}

//MARK: - URLEndpoint
struct URLEndpoint {
    
    public enum BaseURLContext {
        case backend
        case webService
    }

    //ENDPOINTS
    static var moviesApple = "podcasts/top-podcasts/all/10/explicit.json"
    
}

//MARK: - extension - URLEndpoint
extension URLEndpoint {
    static func getBaseUrl(urlContext: BaseURLContext) -> String {
        
        switch urlContext {
        case .backend:
            return "my backend service"
        case .webService:
            return "https://rss.itunes.apple.com/api/v1/es/"
        }
    }
}

class Utils{
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
}
