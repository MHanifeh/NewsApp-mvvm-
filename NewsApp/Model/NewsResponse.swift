//
//  NewsResponse.swift
//  NewsApp
//
//  Created by MahdiHanifeh on 2/17/1401 AP.
//

import Foundation

struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}
extension Article{
    
    static var dummyData : Article{
        .init(author: "Rachel Pannett, Bryan Pietsch",
              url: "https://www.washingtonpost.com/world/2022/05/08/russia-ukraine-war-news-putin-live-updates/",
              source: "The Washington Post",
              title: "Russia-Ukraine war news: Live updates - The Washington Post",
              articleDescription: "A Ukrainian commander trapped at the Mariupol steel plant under Russian fire described life there as “some hellish reality show.”",
              image: "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://d1i4t8bqe7zgj6.cloudfront.net/05-07-2022/t_b074d17a2244406da8172a449950d272_name_thumb.jpg&w=1440",
              date: Date())
    }
}
