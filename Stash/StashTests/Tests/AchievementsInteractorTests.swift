//
//  AchievementsInteractorTests.swift
//  StashTests
//
//  Created by Daniel Romero on 12/26/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import XCTest
@testable import Stash

class AchievementsInteractorTests: XCTestCase {

    var interactor: AchievementsInteractor!
    var output: TestInteractorOutput!
    
    override func setUp() {
        super.setUp()
        interactor = AchievementsInteractor()
        output = TestInteractorOutput()
        
        interactor.output = output
    }
    
    
    func testFetchAchievementsThrowsInvalidPathError() {
        let badResourcePath = "file"
        let newInteractor = AchievementsInteractor(resourcePath: badResourcePath)
        
        XCTAssertThrowsError(try newInteractor.fetchAchievements(), "Throws invalid path error") { (error) in
            XCTAssertEqual(error as! InteractorDataError, InteractorDataError.invalidPath)
        }
    }
    
    
    func testFetchAchievementsThrowsParsingFailedError() {
        let testBundle = Bundle(for: type(of: self))
        let testResourcePath = "test"
        let newInteractor = AchievementsInteractor(bundle: testBundle, resourcePath: testResourcePath)
        
        XCTAssertThrowsError(try newInteractor.fetchAchievements(), "Throws parsing error") { (error) in
            XCTAssertEqual(error as! InteractorDataError, InteractorDataError.parsingFailed)
        }
    }
    
    
    func testFetchAchievementsCallsAchieveMentsFetched() {
        XCTAssertNoThrow(try interactor.fetchAchievements())
        XCTAssertEqual(output.actualAchievements?.count, 3)
        XCTAssertEqual(output.actualTitle, "Smart Investing")
    }

}
