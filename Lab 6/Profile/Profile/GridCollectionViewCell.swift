//
//  GridCollectionViewCell.swift
//  Profile
//
//  Created by Andrew Taylor-Shaut on 3/12/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class GridCollectionViewCell: UICollectionViewCell, UIImagePickerControllerDelegate, UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var imageView: UIImageView!
}
