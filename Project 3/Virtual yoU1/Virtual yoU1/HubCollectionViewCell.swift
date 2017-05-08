//
//  HubCollectionViewCell.swift
//  Virtual yoU1
//
//  Created by Andrew Taylor-Shaut on 5/7/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class HubCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    //http://zappdesigntemplates.com/create-3-column-grid-view-with-uicollectionview/
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
}
