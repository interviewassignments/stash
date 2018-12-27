//
//  TestAchievementsViewInterface.swift
//  StashTests
//
//  Created by Daniel Romero on 12/27/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import Foundation
@testable import Stash

class TestAchievementsViewInterface: AchievementsViewInterface {
    
    private(set) var actualAchievements: [Achievement]?
    private(set) var actualTitle: String?
    private(set) var actualError: InteractorDataError?
    private(set) var didCallShowAchievements = false
    
    
    func showAchievements(_ achievements: [Achievement], title: String) {
        didCallShowAchievements = true
        actualAchievements = achievements
        actualTitle = title
    }
    
    
    func showAlertForError(_ error: InteractorDataError) {
        actualError = error
    }
    
}
