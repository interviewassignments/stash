//
//  TestPresenter.swift
//  StashTests
//
//  Created by Daniel Romero on 12/26/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import Foundation
@testable import Stash

class TestPresenter: AchievementsModuleInterface {
    private(set) var didCallUpdateView = false
    
    var view: AchievementsViewInterface?
    var interactor: AchievementsInteractorInput?
    var router: AchievementsWireFrame?
    var achievements: [Achievement]?
    
    func updateView() {
        didCallUpdateView = true
    }
    
    
}
