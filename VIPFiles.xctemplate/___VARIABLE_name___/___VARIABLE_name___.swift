// ___VARIABLE_name___View.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import SwiftUI



struct ___VARIABLE_name___View: View {
    
    // MARK: ObservedObject -> MVVM Dependencies
    @ObservedObject var viewModel = ___VARIABLE_name___Presenter()
    
    var body: some View {
        VStack{
            Text("hello world!")
                .fontWeight(.bold)
        }
        .onAppear{
            
        }
    }
}

struct ___VARIABLE_name____Previews: PreviewProvider {
    static var previews: some View {
        ___VARIABLE_name___View()
    }
}


