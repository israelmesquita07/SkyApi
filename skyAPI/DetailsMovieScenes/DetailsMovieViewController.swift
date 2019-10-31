//
//  DetailsMovieViewController.swift
//  skyAPI
//
//  Created by Israel on 31/10/19.
//  Copyright © 2019 israel3D. All rights reserved.
//

import UIKit

class DetailsMovieViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!

    private let cellIdentifier:String = "detailsImageMoviesCell"
    private var imagesArray:[String] = []
    var movie:Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        setupCollectionView()
        setupDetails()
    }
    
    private func setupCollectionView() {
        let cellNib = UINib(nibName: "DetailsMovieCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func setupDetails() {
        movieTitleLabel.text = movie?.title
        durationLabel.text = movie?.duration
        releaseYearLabel.text = movie?.releaseYear
        overviewLabel.text = movie?.overview
        if let backdropsUrl = movie?.backdropsUrl {
            imagesArray = backdropsUrl
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.pageControl.numberOfPages = self.imagesArray.count == 0 ? 1 : self.imagesArray.count
                self.collectionView.reloadData()
            }
        }
    }

}

//MARK: - UICollectionViewDataSource
extension DetailsMovieViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! DetailsMovieCollectionViewCell
        cell.setupCell(imagesUrl: imagesArray[indexPath.row])
        return cell
    }
    
}

//MARK: - UICollectionViewDelegate
extension DetailsMovieViewController: UICollectionViewDelegateFlowLayout {
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == collectionView {
            pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        }
    }
}
