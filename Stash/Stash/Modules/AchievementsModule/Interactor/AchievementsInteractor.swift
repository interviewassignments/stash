//
//  AchievementsInteractor.swift
//  Stash
//
//  Created by Daniel Romero on 12/25/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import Foundation

enum DataError: Error {
    case invalidPath
    case invalidData
    case parsingFailed
}

class AchievementsInteractor: AchievementsInteractorInput, AchievementsInteractorDataManagerProtocol {
    
    //MARK: - Properties
    var output: AchievementsInteractorOutput?
    var bundle: Bundle
    var session: URLSession
    var decoder: JSONDecoder
    
    //MARK: - Initialization
    init(bundle: Bundle = Bundle.main, session: URLSession = URLSession(configuration: URLSessionConfiguration.default), decoder: JSONDecoder = JSONDecoder()) {
        self.bundle = bundle
        self.session = session
        self.decoder = decoder
    }
    
    //MARK: - AchievementsInteractorInput
    func fetchAchievements() throws {
        
        guard let path = bundle.path(forResource: "achievements", ofType: "json") else {
            throw DataError.invalidPath
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            throw DataError.invalidData
        }
        
        guard let achievement = try? decoder.decode(AchievementResponse.self, from: data) else {
            throw DataError.parsingFailed
        }
        
        output?.achievementsFetched(achievements: achievement.achievements, title: achievement.overview.title)
    }
    
}
