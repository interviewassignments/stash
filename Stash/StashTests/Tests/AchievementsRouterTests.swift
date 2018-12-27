//
//  AchievementsRouterTests.swift
//  StashTests
//
//  Created by Daniel Romero on 12/27/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import XCTest
@testable import Stash

class AchievementsRouterTests: XCTestCase {
    

    func testAssembleModuleSetsVIPERModules() {
        let actualController = AchievementsRouter.assembleModule()
        let actualChild = actualController.children.first as? AchievementsViewController
        let actualPresenter = actualChild?.presenter as? AchievementsPresenter
        let actualInteractor = actualPresenter?.interactor as? AchievementsInteractorInput
        let actualRouter = actualPresenter?.router as? AchievementsRouter
        
        XCTAssert(actualController is UINavigationController)
        XCTAssert(actualChild is AchievementsViewController)
        XCTAssert(actualPresenter is AchievementsPresenter)
        XCTAssert(actualPresenter is AchievementsInteractorOutput)
        XCTAssert(actualInteractor is AchievementsInteractorInput)
        XCTAssertTrue(actualRouter is AchievementsRouter)
    }
    
}
