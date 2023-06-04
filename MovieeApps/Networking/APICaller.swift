//
//  APICaller.swift
//  MovieeApps
//
//  Created by erdicem on 26.05.2023.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrendingMovies(
        completionHandler: @escaping (_ result: Result<TrendingMoviesModel, Error>) -> Void ) {
        
            let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
            
            guard let url = URL(string: urlString) else {
                completionHandler(.failure(NetworkError.urlError))
                return
            }
            
            URLSession.shared.dataTask(with: url) { dataResponse, URLResponse, error in
                if error == nil{
                    let data = dataResponse
                    let resultData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data!)
                    completionHandler(.success(resultData!))
                }
                 else {
                    completionHandler(.failure(NetworkError.canNotParseData))
                }
            }.resume()
    }
}
