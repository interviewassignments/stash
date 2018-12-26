//
//  AchievementsContract.swift
//  Stash
//
//  Created by Daniel Romero on 12/26/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import UIKit


/// Protocol that defines the responsibilites of the view.
protocol AchievementsViewInterface: class {
    func showAchievements(_ achievements: [Achievement])
}


/// Protocol that defines View ---> Presenter commands.
protocol AchievementsModuleInterface {
    var view: AchievementsViewInterface? { get set }
    var interactor: AchievementsInteractorInput? { get set }
    var router: AchievementsWireFrame? { get set }
    var achievements: [Achievement]? { get set }
    
    func updateView()
}


/// Protocol that defines Interactor ---> Presenter commands.
protocol AchievementsInteractorOutput: class {
    func achievementsFetched(achievements: [Achievement])
}


/// Protocol that defines the use cases for the Achievement Interactor.
protocol AchievementsInteractorInput: class {
    var output: AchievementsInteractorOutput? { get set }
    var session: URLSession { get set }
    func fetchAchievements()
}


/// Protocol that defines the responsibilities of the router
protocol AchievementsWireFrame: class {
    var viewController: UIViewController? { get set }
    
    static func assembleModule() -> UIViewController
}


//
protocol DataManagerProtocol: class {
    var bundle: Bundle { get set }
    var session: URLSession { get set }
    
    func getAchievements() -> Data
}
