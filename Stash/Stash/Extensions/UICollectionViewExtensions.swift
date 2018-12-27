//
//  UICollectionViewExtensions.swift
//  Stash
//
//  Created by Daniel Romero on 12/26/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import UIKit

@objc protocol UICollectionViewProtocol: class {
    var dataSource: UICollectionViewDataSource? { get set }
    var delegate: UICollectionViewDelegate? { get set }
    
    func reloadData()
}

extension UICollectionView: UICollectionViewProtocol {}
