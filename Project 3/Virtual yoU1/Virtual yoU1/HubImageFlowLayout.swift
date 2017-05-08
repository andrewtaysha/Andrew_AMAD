//
//  HubImageFlowLayout.swift
//  Virtual yoU1
//
//  Created by Andrew Taylor-Shaut on 5/7/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

//http://zappdesigntemplates.com/create-3-column-grid-view-with-uicollectionview/
class HubImageFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLayout()
    }
    
    override var itemSize: CGSize {
        set {
        }
        get {
            let numberOfColumns: CGFloat = 3
            let itemWidth = (self.collectionView!.frame.width - (numberOfColumns - 1)) / numberOfColumns
            return CGSize(width: itemWidth, height: itemWidth)
        }
    }
    
    func setupLayout() {
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
        scrollDirection = .vertical
    }

}
