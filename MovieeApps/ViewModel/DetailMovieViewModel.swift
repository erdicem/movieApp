//
//  DetailMovieViewModel.swift
//  MovieeApps
//
//  Created by erdicem on 26.05.2023.
//

import Foundation

class DetailMovieViewModel {
 
    
    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String?
    var movieDescription: String?
    var movieID: Int?
    
    
    init(movie: Movie) {
        self.movie = movie
        
        self.movieTitle = movie.name ?? movie.title ?? ""
        self.movieID = movie.id
        self.movieImage = makeImageUrl(movie.backdropPath ?? "")
        self.movieDescription = movie.overview ?? ""
    }
    
    private func makeImageUrl(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
    
}
