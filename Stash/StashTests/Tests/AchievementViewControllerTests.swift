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
    
    
    func testShowAlertForErrorPresentsAlertController() {
        makeViewControllerVisible()
        
        let expectedError = InteractorDataError.invalidData
        controller.showAlertForError(InteractorDataError.invalidData)
        
        let actualAlertController = controller.presentedViewController as? UIAlertController
        let actualAction = actualAlertController?.actions.first
        
        XCTAssertNotNil(actualAlertController)
        XCTAssertNotNil(actualAction)
        XCTAssertEqual(actualAlertController?.title, "No Achievements")
        XCTAssertEqual(actualAlertController?.message, expectedError.localizedDescription)
        XCTAssertEqual(actualAlertController?.preferredStyle, .alert)
        XCTAssertEqual(actualAction?.title, "OK")
        XCTAssertEqual(actualAction?.style, .default)
        XCTAssertEqual(controller.title, "")
    }
    
    
    //MARK: - Helper Methdos
    func makeViewControllerVisible() {
        let rootWindow = UIWindow(frame: UIScreen.main.bounds)
        rootWindow.isHidden = false
        rootWindow.rootViewController = controller
        controller.viewDidLoad()
    }

}
