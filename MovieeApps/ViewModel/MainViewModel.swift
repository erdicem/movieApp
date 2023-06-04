//
//  MainViewModel.swift
//  MovieeApps
//
//  Created by erdicem on 26.05.2023.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(nil)
    var dataSource: TrendingMoviesModel?
    
    func numberOfSection() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results?.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true // loading process start
        APICaller.getTrendingMovies { [unowned self] result in
            self.isLoading.value = false // loading process stop
            
            switch result {
            case .success(let data):
                print("Top Trending Counts: \(String(describing: data.results?.count))")
                self.dataSource = data
                self.mapCellData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results?.compactMap({MovieTableCellViewModel(movie: $0)})
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
    
    func retriveMovie(with id: Int) -> Movie? {
        guard let movie = dataSource?.results?.first(where: {$0.id == id}) else { return nil }
        return movie
    }
    
}
