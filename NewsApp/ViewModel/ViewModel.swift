//
//  ViewModel.swift
//  NewsApp
//
//  Created by MahdiHanifeh on 2/17/1401 AP.
//

import Foundation
import Combine


protocol NewViewModel{
    
    func getArticle ()
}


class NewViewModelImpl : ObservableObject , NewViewModel{
    
    
    private let service : NewsService
    
    private(set) var articles = [Article]()
    private var cancelables = Set<AnyCancellable>()
    
  @Published private(set) var state : ResultState = .loading
    
    init(service:NewsService){
        self.service = service
    }
    
    func getArticle() {
        
        self.state = .loading
        let cancelable = service.request(from: .getNews)
        
            .sink { res in
                switch res{
                    
                case .finished:
                    self.state = .success(content: self.articles)
// article ro befrest
             
                case .failure(let error):
                    
                    self.state = .failed(error: error)
//                    error ro befrest
                }
            } receiveValue: { response in
                self.articles = response.articles
            }
        
        
        self.cancelables.insert(cancelable)

    }
    
    
    
}
