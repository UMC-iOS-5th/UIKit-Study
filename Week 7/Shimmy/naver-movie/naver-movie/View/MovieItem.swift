//
//  MovieItem.swift
//  naver-movie
//
//  Created by Seungbo Shim on 2023/11/21.
//

import SwiftUI

struct MovieItem: View {
    var movieInfo: MovieBox.MovieInfo
    var body: some View {
        VStack(alignment: .center) {
            Group {
                AsyncImage(url: URL(string: movieInfo.image)) { image in
                    image
                        .ImageModifier()
                } placeholder: {
                    Image(systemName: "movieclapper")
                        .IconModifier()
                }
                .padding(20)
                Text(movieInfo.attributedTitle!)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 50, trailing: 10))
            }
        }
    }
}

struct MovieItem_Previews: PreviewProvider {
    static var movieInfo = MovieBox.MovieInfo(MovieFinder.Response.MovieInfo(
        title: "그대들은 어떻게 살 것인가", link: "https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&pkid=68&os=32034616&qvt=0&query=%EA%B7%B8%EB%8C%80%EB%93%A4%EC%9D%80%20%EC%96%B4%EB%96%BB%EA%B2%8C%20%EC%82%B4%20%EA%B2%83%EC%9D%B8%EA%B0%80", image: "https://search.pstatic.net/common?type=o&size=176x264&quality=85&direct=true&src=https%3A%2F%2Fs.pstatic.net%2Fmovie.phinf%2F20231026_9%2F16983044100188P1Ff_JPEG%2Fmovie_image.jpg%3Ftype%3Dw640_2", subtitle: "The Boy and the Heron", director: "미야자키 하야오", actor: "아이묭", userRating: 6.91
    ), id: 1)
    
    static var previews: some View {
        MovieItem(movieInfo: movieInfo)
    }
}
