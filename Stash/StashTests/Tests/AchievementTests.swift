//
//  AchievementTests.swift
//  StashTests
//
//  Created by Daniel Romero on 12/27/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import XCTest
@testable import Stash

class AchievementTests: XCTestCase {

    func testAchievementInitialization() {
        let achievement = Achievement(id: 1, level: "1", progress: 50, total: 50, backgroundImageUrl: "https://hooli.com", accessible: true)
        let expectedOverview = Overview(title: "Aviato")
        let expectedAchievements = [achievement]
        let expectedSuccess = true
        let expectedStatus = 200
        
        let achievementResponse = AchievementResponse(overview: expectedOverview, achievements: expectedAchievements, success: expectedSuccess, status: expectedStatus)
        
        XCTAssertEqual(achievementResponse.overview, expectedOverview)
        XCTAssertEqual(achievementResponse.achievements, expectedAchievements)
        XCTAssertEqual(achievementResponse.success, expectedSuccess)
        XCTAssertEqual(achievementResponse.status, expectedStatus)
    }
 
}
