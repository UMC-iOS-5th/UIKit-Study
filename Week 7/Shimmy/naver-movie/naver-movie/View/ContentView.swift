//
//  ContentView.swift
//  naver-movie
//
//  Created by Seungbo Shim on 2023/11/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MovieFinder
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    SearchView(viewModel: viewModel)
                    MovieList(viewModel: viewModel)
                }
                .foregroundColor(.black)
                .navigationTitle("네이버 영화 검색")
                if viewModel.fetchingStatus == .fetching {
                    ProgressView()
                        .scaleEffect(1.5)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MovieFinder())
    }
}
