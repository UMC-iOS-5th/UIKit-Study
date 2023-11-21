//
//  Image+Extension.swift
//  naver-movie
//
//  Created by Seungbo Shim on 2023/11/21.
//

import SwiftUI

extension Image {
    func ImageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func IconModifier() -> some View {
        self
            .ImageModifier()
            .frame(maxWidth: 200)
            .foregroundColor(.blue.opacity(0.5))
    }
}
