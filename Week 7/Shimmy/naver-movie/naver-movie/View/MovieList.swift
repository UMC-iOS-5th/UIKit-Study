//
//  MovieList.swift
//  naver-movie
//
//  Created by Seungbo Shim on 2023/11/21.
//

import SwiftUI

struct MovieList: View {
    @ObservedObject var viewModel: MovieFinder
    var colums: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        LazyVGrid(columns: colums) {
            ForEach(viewModel.model.movies) {
                movieInfo in
                NavigationLink {
                    MovieItem(movieInfo: movieInfo)
                } label: {
                    MovieItem(movieInfo: movieInfo)
                }
            }
        }
    }
}
