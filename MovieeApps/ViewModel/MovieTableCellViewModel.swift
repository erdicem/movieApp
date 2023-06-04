//
//  MovieTableViewCellViewModel.swift
//  MovieeApps
//
//  Created by erdicem on 26.05.2023.
//

import Foundation


class MovieTableCellViewModel {
    var id: Int?
    var title: String?
    var date: String?
    var rating: String?
    var imageUrl: URL?
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title ?? movie.name ?? ""
        self.date = movie.releaseDate ?? movie.firstAirDate ?? ""
        self.rating = String(format: "%.1f", movie.voteAverage!) + "/10"
        self.imageUrl = makeImageUrl(movie.posterPath ?? "")
    }
    
    private func makeImageUrl(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
    
}
