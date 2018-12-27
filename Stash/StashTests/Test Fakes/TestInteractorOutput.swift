//
//  TestInteractorOutput.swift
//  StashTests
//
//  Created by Daniel Romero on 12/26/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import Foundation
@testable import Stash

class TestInteractorOutput: AchievementsInteractorOutput {
    
    private(set) var actualAchievements: [Achievement]?
    private(set) var actualTitle: String?
    
    func achievementsFetched(achievements: [Achievement], title: String) {
        actualAchievements = achievements
        actualTitle = title
    }
    
    
}
