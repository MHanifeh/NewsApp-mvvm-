//
//  HomeView.swift
//  NewsApp
//
//  Created by MahdiHanifeh on 2/17/1401 AP.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = NewViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        Group{
            switch viewModel.state{
            case .loading:
                ProgressView()
                
            case .failed(error: let error):
                ErrorView(error: error, handler: viewModel.getArticle)
                
            case .success(content: let content):
                NavigationView{
                    List(content){item in
                        ArticleView(article: item)
                            .onTapGesture {
                                load(url: item.url)
                            }
                            .listRowBackground(
                                LinearGradient(colors:[
                                    Color(#colorLiteral(red: 0.5996136665, green: 0.6586354375, blue: 1, alpha: 1)),
                                    Color(#colorLiteral(red: 0.3655320406, green: 0.4819711447, blue: 1, alpha: 1)),
                                ]
                                               , startPoint: .leading
                                               , endPoint: .trailing)
                            )
                    }
                    .navigationTitle("News")
                    .listStyle(PlainListStyle())
                    .background(  LinearGradient(colors:[
                        Color(#colorLiteral(red: 0.5996136665, green: 0.6586354375, blue: 1, alpha: 1)),
                        Color(#colorLiteral(red: 0.3655320406, green: 0.4819711447, blue: 1, alpha: 1)),
                    ]
                                                 , startPoint: .leading
                                                 , endPoint: .trailing)) 
                }
            
            }
        }
        .onAppear(perform: viewModel.getArticle)
    }
    func load(url : String?){
        guard let link = url,
              let url = URL(string: link)else{return}
        openUrl(url)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 13")
    }
}
