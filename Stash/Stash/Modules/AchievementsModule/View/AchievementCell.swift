//
//  AchievementCell.swift
//  Stash
//
//  Created by Daniel Romero on 12/25/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import UIKit

@IBDesignable
class AchievementCell: UICollectionViewCell {
    
    static let reuseIdentifier = "achievement"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var levelCountLabel: UILabel!
    @IBOutlet weak var progressPointsLabel: UILabel!
    @IBOutlet weak var totalPointsLabel: UILabel!
    
    func set(forAchievement achievement: Achievement) {
        self.levelCountLabel.text = achievement.level
        self.progressPointsLabel.text = "\(achievement.progress)"
        self.totalPointsLabel.text = "\(achievement.total)"
        // Set image view using image url???
    }
    
}
