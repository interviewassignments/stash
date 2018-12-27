//
//  TestAchievementsInteractorInput.swift
//  StashTests
//
//  Created by Daniel Romero on 12/27/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import Foundation
@testable import Stash

class TestAchievementsInteractorInput: AchievementsInteractorInput {
    
    private(set) var didCallFetchAchievements = false
    var shouldThrow = false
    var output: AchievementsInteractorOutput?
    
    func fetchAchievements() throws {
        if !shouldThrow {
            didCallFetchAchievements = true
            return
        }
        throw InteractorDataError.parsingFailed
    }
    
    
}
