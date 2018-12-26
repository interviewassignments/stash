//
//  AchievementsViewController.swift
//  Stash
//
//  Created by Daniel Romero on 12/25/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    private let sectionInsets = UIEdgeInsets(top: 20.0, left: 20.0, bottom: 60.0, right: 20.0)
    var presenter: AchievementsModuleInterface!
    var achievements: [Achievement] = []

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        presenter.updateView()
    }
    
}

//MARK: - AchievementsViewInterface
extension AchievementsViewController: AchievementsViewInterface {
    
    func showAchievements(_ achievements: [Achievement]) {
        self.achievements = achievements
        collectionView.reloadData()
    }
}

extension AchievementsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return achievements.count > 0 ? achievements.count : 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AchievementCell.reuseIdentifier, for: indexPath) as! AchievementCell
        return cell
    }
}

extension AchievementsViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthPerItem = collectionView.frame.width - (sectionInsets.left + sectionInsets.right)
        return CGSize(width: widthPerItem, height: collectionView.frame.height * 0.25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
}

