//
//  AchievementsPresenter.swift
//  Stash
//
//  Created by Daniel Romero on 12/25/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import Foundation

/// Protocol that defines View ---> Presenter commands.
protocol AchievementsModuleInterface {
    func updateView()
}

/// Protocol that defines Interactor ---> Presenter commands.
protocol AchievementsInteractorOutput {
    func achievementsFetched(achievements: [Int])
}

class AchievementsPresenter {
    
    weak var view: AchievementsViewInterface!
    
    
}

extension AchievementsPresenter: AchievementsModuleInterface {
    
    func updateView() {
        
    }
    
}

extension AchievementsPresenter: AchievementsInteractorOutput {
    
    func achievementsFetched(achievements: [Int]) {
        
    }
    
}
