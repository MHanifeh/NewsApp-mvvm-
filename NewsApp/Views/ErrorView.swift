//
//  ErrorView.swift
//  NewsApp
//
//  Created by MahdiHanifeh on 2/18/1401 AP.
//

import SwiftUI

struct ErrorView: View {
  
    
    
    typealias ErrorViewActionHandler = () -> Void
    let error : Error
    let handler : ErrorViewActionHandler
    
    internal init(error: Error,
                  handler: @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    
    var body: some View {
        VStack{

       
                    Image(systemName: "exclamationmark.icloud.fill")
                        .font(.system(size: 50, weight: .heavy))
                        .padding(.bottom,4)
                    Text("Ooooopss")
                        .font(.system(size: 25, weight: .heavy))
                    Text(error.localizedDescription)
                        .font(.system(size: 15))
                        .multilineTextAlignment(.center)
                        .padding(.vertical,4)
            
            Button(action: {
handler()
            }, label: {Text("Retry")
                 
                
            })
            .padding(.horizontal,30)
            .padding(.vertical,12)
           .background(  LinearGradient(colors:[
                Color(#colorLiteral(red: 0.5996136665, green: 0.6586354375, blue: 1, alpha: 1)),
                Color(#colorLiteral(red: 0.3655320406, green: 0.4819711447, blue: 1, alpha: 1)),
            ]
                                         , startPoint: .leading
                                         , endPoint: .trailing))
            .foregroundColor(.black)
            .font(.system(size: 15, weight: .heavy))
            .clipShape(Capsule())

        
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError){}
            .previewDevice("iPhone 13")
    }
}
