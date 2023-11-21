//
//  MovieFinder.swift
//  naver-movie
//
//  Created by Seungbo Shim on 2023/11/21.
//

import SwiftUI

fileprivate enum NaverOpenAPI {
    static let clientID = "VqtHIaKV56Yq0bbtzKXe"
    static let clientSecret = "3CDDCRzxdH"
    
    static let scheme = "https"
    static let host = "openapi.naver.com"
    
    enum Path: String {
        case movie = "/v1/search/movie.json"
    }
}

class MovieFinder: ObservableObject {
    @Published var model = MovieBox()
    @Published var fetchingStatus = FetchStatus.idle
    
    func fetchMovieList() {
        fetchingStatus = .fetching
        
        // urlComponents
        var urlComponents = URLComponents()
        urlComponents.scheme = NaverOpenAPI.scheme
        urlComponents.host = NaverOpenAPI.host
        urlComponents.path = NaverOpenAPI.Path.movie.rawValue
        urlComponents.queryItems = [URLQueryItem(name: "query", value: model.searchKeyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))]
        
        // 검색 쿼리를 UTF-8로 인코딩하여 설정
//        if let encodedQuery = model.searchKeyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
//            urlComponents.queryItems = [URLQueryItem(name: "query", value: encodedQuery)]
//        }
        
        // urlComponents -> url
        guard let url = urlComponents.url else { return }
        
        // request (header)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET" // method
        urlRequest.addValue(NaverOpenAPI.clientID, forHTTPHeaderField: "X-Naver-Client-Id") // value, key
        urlRequest.addValue(NaverOpenAPI.clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        // 비동기로 수행할 작업: task
        let task = URLSession.shared.dataTask(with: urlRequest) {data, response, error in
            // data, response, error 받아와서 처리할 부분
            guard error == nil,
                  let httpURLResponse = response as?HTTPURLResponse,
                  (200 ... 299).contains(httpURLResponse.statusCode),
                  let data = data,
                  let parsedData = try? JSONDecoder().decode(Response.self, from: data)
                    // 받아온 data(101011.....)를 우리가 볼수있게 parsing
            else { return }
            
            // 비동기 함수를 main thread 에서 실행
            // mainthread에서 값이 바뀌어야 multithread 에서 갱신가능
            DispatchQueue.main.async { [weak self] in
                // 서로 참조할 때, 다른 한 쪽에서 참조를 끊으면 자동으로 할당 해제
                // weak self 에서는 self? 사용
                // 받아온 JSON을 image로 parsing하고 ImageBox.ImageInfo에 넣어줌
                self?.model.movies = parsedData.items.indices.map {
                    MovieBox.MovieInfo(parsedData.items[$0], id: parsedData.start + $0)
                }
                // fetchingStatus를 idle로
                self?.fetchingStatus = .idle
            }
        }
        task.resume() // mainthread로 넘길래
    }
}

extension MovieFinder {
    struct Response: Codable {
        let lastBuildDate: String
        let total: Int
        let start: Int
        let display: Int
        let items: [MovieInfo]
        
        struct MovieInfo: Codable {
            let title: String
            let link: String
            let image: String
            let subtitle: String
            //let pubDate: Date
            let director: String
            let actor: String
            let userRating: Double
        }
    }
    
    enum FetchStatus {
        case idle
        case fetching
    }
}
