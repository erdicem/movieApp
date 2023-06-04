//
//  NetworkConstant.swift
//  MovieeApps
//
//  Created by erdicem on 26.05.2023.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    
    private init() {
        //Singletone
    }
    
    public var apiKey: String {
        get {
            // API key from // https://api.themoviedb.org/
            return "dfa733f7867c6e58d951454c05918b36"
        }
    }
    
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500"
        }
    }
}




























