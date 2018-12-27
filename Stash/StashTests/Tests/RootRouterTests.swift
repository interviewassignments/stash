//
//  RootRouterTests.swift
//  StashTests
//
//  Created by Daniel Romero on 12/27/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import XCTest
@testable import Stash

class RootRouterTests: XCTestCase {

    var router: RootRouter!
    var window: TestWindow!
    
    override func setUp() {
        super.setUp()
        router = RootRouter()
        window = TestWindow()
    }
    
    
    func testPresentAchievementsScreenCallsMakeKeyAndVisible() {
        router.presentAchievementsScreen(in: window)
        
        XCTAssertTrue(window.didCallMakeKeyAndVisible)
    }
    
    
    func testPresentAchievementsScreenSetsRootViewController() {
        router.presentAchievementsScreen(in: window)
        
        let actualController = window.rootViewController as? UINavigationController
        
        XCTAssertNotNil(actualController)
    }
    

}
