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
    @IBOutlet weak var achievementLevelView: AchievementLevelView!
    @IBOutlet weak var progressPointsLabel: UILabel!
    @IBOutlet weak var totalPointsLabel: UILabel!
    
    func set(forAchievement achievement: Achievement) {
        achievementLevelView.levelCountLabel.text = achievement.level
        self.progressPointsLabel.text = "\(achievement.progress)pts"
        self.totalPointsLabel.text = "\(achievement.total)pts"
        // Set image view using image url???
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        achievementLevelView.cornerRadius = achievementLevelView.frame.size.width / 2
    }
    
}
