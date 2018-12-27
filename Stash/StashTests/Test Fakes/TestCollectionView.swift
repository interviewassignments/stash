//
//  TestCollectionView.swift
//  StashTests
//
//  Created by Daniel Romero on 12/26/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import UIKit
@testable import Stash

class TestCollectionView: UICollectionViewProtocol {
    
    private(set) var didCallReloadData = false
    
    weak open var dataSource: UICollectionViewDataSource?
    weak open var delegate: UICollectionViewDelegate?
    
    func reloadData() {
        didCallReloadData = true
    }
}
