//
//  RootRouter.swift
//  Stash
//
//  Created by Daniel Romero on 12/26/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import UIKit

class RootRouter: RootWireFrame {
    
    func presentAchievementsScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = AchievementsRouter.assembleModule()
    }
    
}
