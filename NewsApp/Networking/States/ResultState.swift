//
//  ResultState.swift
//  NewsApp
//
//  Created by MahdiHanifeh on 2/17/1401 AP.
//

import Foundation

enum ResultState{
    case loading
    case success(content : [Article])
    case failed (error : Error)
}
