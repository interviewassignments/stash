//
//  AchievementsPresenter.swift
//  Stash
//
//  Created by Daniel Romero on 12/25/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import Foundation

class AchievementsPresenter: AchievementsModuleInterface {
    
    var view: AchievementsViewInterface?
    var interactor: AchievementsInteractorInput?
    var router: AchievementsWireFrame?
    var achievements: [Achievement]?
    
    func updateView() {
        interactor?.fetchAchievements()
    }
    
}

extension AchievementsPresenter: AchievementsInteractorOutput {
    
    func achievementsFetched(achievements: [Achievement]) {
        if achievements.count > 0 {
            self.achievements = achievements
            view?.showAchievements(achievements)
        }
    }
    
}
