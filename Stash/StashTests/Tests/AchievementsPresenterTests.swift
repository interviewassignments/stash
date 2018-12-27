//
//  AchievementsPresenterTests.swift
//  StashTests
//
//  Created by Daniel Romero on 12/27/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import XCTest
@testable import Stash

class AchievementsPresenterTests: XCTestCase {

    var presenter: AchievementsPresenter!
    var view: TestAchievementsViewInterface!
    var interactor: TestAchievementsInteractorInput!
    
    override func setUp() {
        super.setUp()
        presenter = AchievementsPresenter()
        view = TestAchievementsViewInterface()
        interactor = TestAchievementsInteractorInput()
        
        presenter.view = view
        presenter.interactor = interactor
    }
    
    
    func testUpdateViewCallsFetchAchievements() {
        presenter.updateView()
        
        XCTAssertTrue(interactor.didCallFetchAchievements)
    }
    
    
    func testUpdateViewCallsShowAlertForError() {
        interactor.shouldThrow = true
        presenter.updateView()
        
        XCTAssert(view.actualError is InteractorDataError)
    }
    
    
    func testAchievementsFetchedCallsShowAchievements() {
        let achievement = Achievement(id: 1, level: "1", progress: 10, total: 50, backgroundImageUrl: "test", accessible: true)
        let expectedAchievements: [Achievement] = [achievement]
        let expectedTitle = "test"
        
        presenter.achievementsFetched(achievements: expectedAchievements, title: "test")
    
        XCTAssertEqual(presenter.achievements, expectedAchievements)
        XCTAssertEqual(view.actualAchievements, expectedAchievements)
        XCTAssertEqual(view.actualTitle, expectedTitle)
    }
    
    
    func testAchievementsFetchedDoesntCallShowAchievements() {
        let expectedAchievements: [Achievement] = []
        let expectedTitle = "test"
        
        presenter.achievementsFetched(achievements: expectedAchievements, title: "test")
        
        XCTAssertNil(presenter.achievements)
        XCTAssertNil(view.actualAchievements)
        XCTAssertNil(view.actualTitle, expectedTitle)
        XCTAssertFalse(view.didCallShowAchievements)
    }

}
