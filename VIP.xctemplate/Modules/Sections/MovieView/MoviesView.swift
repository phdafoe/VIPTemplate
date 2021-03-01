//  MoviesView.swift
//  Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var viewModel = MoviesPresenter()
    
    var body: some View {
        Text("\(self.viewModel.arrayMovies.count)")
            .onAppear(perform: {
                self.viewModel.fetchData()
            })
        
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
