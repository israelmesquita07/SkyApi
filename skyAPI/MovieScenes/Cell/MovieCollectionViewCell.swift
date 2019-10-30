//
//  MovieCollectionViewCell.swift
//  skyAPI
//
//  Created by Israel on 29/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var viewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(screenWidth: CGFloat) {
        viewWidthConstraint.constant = (screenWidth / 2 ) - 8
    }

}
