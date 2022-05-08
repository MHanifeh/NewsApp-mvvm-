//
//  APIError.swift
//  NewsApp
//
//  Created by MahdiHanifeh on 2/17/1401 AP.
//

import Foundation


enum APIError : Error{
    
    case decodingError
    case errorCode(Int)
    case unknown
}


extension APIError : LocalizedError{
    
    var errorDescription: String?{
        switch self {
        case .decodingError:
            return "Failed to decode object from server"
        case .errorCode(let code):
            return "\(code) - Somthing went wrong"
        case .unknown:
            return "The error is unknown"
        }
    }
}
