//
//  AchievementsRouter.swift
//  Stash
//
//  Created by Daniel Romero on 12/26/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import UIKit

class AchievementsRouter: AchievementsWireFrame {
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "AchievementsNavigationController")
        if let view = navController.children.first as? AchievementsViewController {
            
            var presenter: AchievementsModuleInterface & AchievementsInteractorOutput = AchievementsPresenter()
            let interactor: AchievementsInteractorInput = AchievementsInteractor()
            let router: AchievementsWireFrame = AchievementsRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.output = presenter
            router.viewController = view
            
            return navController
        }
        return UIViewController()
    }
}
