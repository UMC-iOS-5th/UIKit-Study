//
//  naver_movieApp.swift
//  naver-movie
//
//  Created by Seungbo Shim on 2023/11/21.
//

import SwiftUI

@main
struct naver_movieApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: MovieFinder())
        }
    }
}
