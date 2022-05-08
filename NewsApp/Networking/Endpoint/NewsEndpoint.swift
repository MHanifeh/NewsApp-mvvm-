//
//  NewsEndpoint.swift
//  NewsApp
//
//  Created by MahdiHanifeh on 2/17/1401 AP.
//

import Foundation

protocol APIBuilder{
    
    var urlREquest : URLRequest{get}
    var baseUrl : URL {get}
    var path : String {get}
}
enum NewsAPI {
    
    case getNews

}

extension NewsAPI : APIBuilder{
    var urlREquest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
    }

    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!

        }
    }

    var path: String {
        return "/news"
    }



}






//protocol APIBuilder{
//
//    var urlREquest : URLRequest{get}
//    var baseUrl : URL {get}
//    var path : Path {get}
//}
//enum NewsAPI {
//
//    case getNews
//    case getHotNews
//}
//enum Path: String ,CaseIterable{
//
//    case news = "news"
//    case hotNews = "hotNews"
//}

//
//extension NewsAPI:APIBuilder{
//    var urlREquest: URLRequest {
//        return URLRequest(url: self.baseUrl.appendingPathComponent(self.path.rawValue))
//    }
//
//    var baseUrl: URL {
//        switch self {
//               case .getNews:
//                   return URL(string: "https://api.lil.software")!
//
//        case .getHotNews:
//            return URL(string: "https://api.lil.software")!
//        }
//    }
//
//    var path: Path {
//        switch self {
//        case .getNews:
//            return Path.news
//        case .getHotNews:
//            return Path.hotNews
//        }
//    }
//
//
//}

