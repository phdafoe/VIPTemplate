//
//  Created on ___DATE___.
// subfolder/Filename.swift - Very brief description
//
// This source file is part of the everis open source project in iOS Desktop
//
// Copyright (c) 2020 EVERIS Sl. and the Swift project authors iOS Desktop
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://steps.everis.com/git/MOVILIDAD/architecture-swiftui-ios/-/blob/master/README.md for text information
//
// -----------------------------------------------------------------------------
///
/// This file contains stuff that I am describing here in the header and will
/// be sure to keep up to date.
///
// -----------------------------------------------------------------------------

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


