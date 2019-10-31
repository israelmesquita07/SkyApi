//
//  DetailsMovieCollectionViewCell.swift
//  skyAPI
//
//  Created by Israel on 31/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsMovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(imagesUrl:String) {
        
        movieImageView.image = UIImage(named: "sky")
//        if let url = URL(string: imagesUrl) {
//            movieImageView.kf.indicatorType = .activity
//            movieImageView.kf.setImage(with: url)
//        }
    }
}
