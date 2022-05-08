//
//  ArticleView.swift
//  NewsApp
//
//  Created by MahdiHanifeh on 2/18/1401 AP.
//

import SwiftUI
import URLImage
import URLImageStore

struct ArticleView: View {
    
    
    var article : Article
    
    var body: some View {
        
        //                image Store
        
        let urlImageService = URLImageService(fileStore: URLImageFileStore(),
                                              inMemoryStore: URLImageInMemoryStore())
        HStack{
            if let imgUrl = article.image,
               let url = URL(string: imgUrl){
                
                URLImage(url,
                         identifier: article.id.uuidString,
                         failure: { error, retry in
                    
                    PlaceHolderImageView()
                    
                }) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                
                //                image Store
                
                .environment(\.urlImageService, urlImageService)
            }else{
                PlaceHolderImageView()
            }
            
            VStack(alignment:.leading,spacing: 4){
                Text(article.title )
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source )
                    .foregroundColor(.green)
                    .font(.footnote)
            }.padding(.horizontal)
            
        }
    }
}
struct PlaceHolderImageView: View{
    var body: some View{
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.red)
            .frame(width:100,height:100)
    }
}
struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewDevice("iPhone 13")
            .previewLayout(.sizeThatFits)
    }
}



