//
//  AchievementsViewController.swift
//  Stash
//
//  Created by Daniel Romero on 12/25/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import UIKit


protocol AchievementsViewInterface: class {
    func showAchievements(_ achievements: [Int])
}


class AchievementsViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

//MARK: - AchievementsViewInterface
extension AchievementsViewController: AchievementsViewInterface {
    func showAchievements(_ achievements: [Int]) {
        
    }
}
