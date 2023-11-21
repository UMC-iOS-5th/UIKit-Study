//
//  MovieBox.swift
//  naver-movie
//
//  Created by Seungbo Shim on 2023/11/21.
//

import Foundation

struct MovieBox {
    var searchKeyword = ""
    var movies: [MovieInfo] = []
}

extension MovieBox {
    struct MovieInfo: Codable, Identifiable {
        let attributedTitle: String?
        let link: String
        let image: String
        let subtitle: String
        //let pubDate: Date
        let director: String
        let actor: String
        let userRating: Double
        let id: Int
        
        init(_ movieInfo: MovieFinder.Response.MovieInfo, id: Int) {
            attributedTitle = movieInfo.title
            link = movieInfo.link
            image = movieInfo.image
            subtitle = movieInfo.subtitle
            //pubDate = movieInfo.pubDate
            director = movieInfo.director
            actor = movieInfo.actor
            userRating = movieInfo.userRating
            self.id = id
            print(self)
        }
    }
}

extension AttributedString {
    init?(htmlString: String) {
        let option: [NSAttributedString.DocumentReadingOptionKey: NSAttributedString.DocumentType] = [.documentType: .html]
        guard let htmlData = htmlString.data(using: .utf16),
              let nsStr = try? NSAttributedString(data: htmlData, options: option, documentAttributes: nil)
        else { return nil }
        self.init(nsStr.string)
    }
}
