//
//  AchievementsInteractor.swift
//  Stash
//
//  Created by Daniel Romero on 12/25/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import Foundation

/// Protocol that defines the use cases for the Achievement Interactor.
protocol AchievementsInteractorInput: class {
    func fetchAchievements()
}

class AchievementsInteractor {
    
}

extension AchievementsInteractor: AchievementsInteractorInput {
    
    func fetchAchievements() {
        
    }
    
}
