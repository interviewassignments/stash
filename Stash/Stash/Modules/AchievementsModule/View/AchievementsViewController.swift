//
//  AchievementsViewController.swift
//  Stash
//
//  Created by Daniel Romero on 12/25/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import UIKit
import SDWebImage

class AchievementsViewController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet weak var collectionView: UICollectionViewProtocol!
    private let sectionInsets = UIEdgeInsets(top: 30.0, left: 20.0, bottom: 10.0, right: 20.0)
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
    
    func showAchievements(_ achievements: [Achievement], title: String) {
        self.title = title
        self.achievements = achievements
        collectionView.reloadData()
    }
    
    
    func showAlertForError(_ error: InteractorDataError) {
        self.title = ""
        let alert = UIAlertController(title: "No Achievements", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK: - UICollectionViewDataSource

extension AchievementsViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AchievementCell.reuseIdentifier, for: indexPath) as! AchievementCell
        let achievement = achievements[indexPath.row]
        cell.set(forAchievement: achievement)
        cell.imageView.sd_setImage(with: URL(string: achievement.backgroundImageUrl), completed: nil)
        return cell
    }
}

//MARK: - UICollectionViewDelegateLayout

extension AchievementsViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
}

