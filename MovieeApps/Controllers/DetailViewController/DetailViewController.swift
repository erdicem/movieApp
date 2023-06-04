//
//  DetailViewController.swift
//  MovieeApps
//
//  Created by erdicem on 26.05.2023.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    //ViewModel:
    var viewModel: DetailMovieViewModel
    
    
    init(viewModel: DetailMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
    }
    
    func configureView() {
        self.imageView.sd_setImage(with: viewModel.movieImage)
        self.titleLabel.text = viewModel.movieTitle?.description
        self.descriptionLabel.text = viewModel.movieDescription?.description
    }

}
