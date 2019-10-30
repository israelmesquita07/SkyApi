//
//  MoviesViewController.swift
//  skyAPI
//
//  Created by Israel on 29/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let cellIdentifier:String = "movieCell"
    private var moviesArray:[Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        let cellNib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 100, height: 100)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension MoviesViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 300//moviesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! MovieCollectionViewCell
        
        let screenWidth = self.collectionView.frame.width
        cell.setupCell(screenWidth: screenWidth)
        
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate
extension MoviesViewController: UICollectionViewDelegate {
 
}
