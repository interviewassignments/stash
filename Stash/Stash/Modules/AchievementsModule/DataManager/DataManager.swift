//
//  DataManager.swift
//  Stash
//
//  Created by Daniel Romero on 12/26/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import Foundation

class DataManager: DataManagerProtocol {
    var bundle: Bundle
    var session: URLSession
    
    init(bundle: Bundle = Bundle.main, session: URLSession = URLSession(configuration: URLSessionConfiguration.default)) {
        self.bundle = bundle
        self.session = session
    }
    
    func getAchievements() -> Data {
        return Data()
    }
}
