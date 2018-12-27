//
//  AchievementViewControllerTests.swift
//  StashTests
//
//  Created by Daniel Romero on 12/26/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import XCTest
@testable import Stash

class AchievementViewControllerTests: XCTestCase {
    
    //MARK: - Properties
    var controller: AchievementsViewController!
    var collectionView: TestCollectionView!
    var presenter: TestPresenter!
    
    
    override func setUp() {
        super.setUp()
        controller = AchievementsViewController()
        collectionView = TestCollectionView()
        presenter = TestPresenter()
        
        controller.collectionView = collectionView
        controller.presenter = presenter
    }

    
    func testViewDidLoadSetsDataSourceAndDelegate() {
        controller.viewDidLoad()
        
        XCTAssert(collectionView.delegate === controller)
        XCTAssert(collectionView.dataSource === controller)
    }
    
    
    func testViewDidLoadCallsUpdateView() {
        controller.viewDidLoad()
        
        XCTAssertTrue(presenter.didCallUpdateView)
    }
    
    
    func testShowAchievementsSetsAchievementsAndCallsReloadData() {
        let achievements: [Achievement] = []
        let title = "test"
        
        controller.showAchievements(achievements, title: title)
        
        XCTAssertTrue(collectionView.didCallReloadData)
        XCTAssertEqual(controller.title, title)
        XCTAssertEqual(controller.achievements, achievements)
    }

}
