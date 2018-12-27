//
//  AchievementCell.swift
//  Stash
//
//  Created by Daniel Romero on 12/25/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import UIKit
import LinearProgressBar

@IBDesignable
class AchievementCell: UICollectionViewCell {
    
    static let reuseIdentifier = "achievement"
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var achievementLevelView: AchievementLevelView!
    @IBOutlet weak var progressBarView: LinearProgressBar!
    @IBOutlet weak var progressPointsLabel: UILabel!
    @IBOutlet weak var totalPointsLabel: UILabel!
    @IBOutlet weak var disabledView: UIView!
    
    
    func set(forAchievement achievement: Achievement) {
        disabledView.isHidden = achievement.accessible
        achievementLevelView.levelCountLabel.text = achievement.level
        progressBarView.progressValue = CGFloat(achievement.progressPercentage)
        self.progressPointsLabel.text = "\(achievement.progress)pts"
        self.totalPointsLabel.text = "\(achievement.total)pts"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        achievementLevelView.cornerRadius = achievementLevelView.frame.size.width / 2
    }
    
}
