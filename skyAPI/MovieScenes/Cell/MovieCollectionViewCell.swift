//
//  MovieCollectionViewCell.swift
//  skyAPI
//
//  Created by Israel on 29/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var viewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(_ movie:Movie, screenWidth: CGFloat) {
        
        viewWidthConstraint.constant = (screenWidth / 2 ) - 8
        movieLabel.text = movie.title
        guard let coverUrl = movie.coverUrl, let url = URL(string: coverUrl) else {
            movieImageView.image = UIImage(named: "sky")
            return
        }
        movieImageView.kf.indicatorType = .activity
        movieImageView.kf.setImage(with: url)
    }

}
