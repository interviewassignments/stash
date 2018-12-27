//
//  AchievementsInteractor.swift
//  Stash
//
//  Created by Daniel Romero on 12/25/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import Foundation

enum InteractorDataError: Error {
    case invalidPath
    case invalidData
    case parsingFailed
}

class AchievementsInteractor: AchievementsInteractorInput, AchievementsInteractorDataManagerProtocol {
    
    //MARK: - Properties
    
    var output: AchievementsInteractorOutput?
    var bundle: Bundle
    var decoder: JSONDecoder
    var resourcePath: String
    var resourceType: String
    
    //MARK: - Initialization
    
    init(bundle: Bundle = Bundle.main, decoder: JSONDecoder = JSONDecoder(), resourcePath: String = "achievements", resourceType: String = "json") {
        self.bundle = bundle
        self.decoder = decoder
        self.resourcePath = resourcePath
        self.resourceType = resourceType
    }
    
    //MARK: - AchievementsInteractorInput
    
    func fetchAchievements() throws {
        
        guard let path = bundle.path(forResource: resourcePath, ofType: resourceType) else {
            throw InteractorDataError.invalidPath
        }
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            throw InteractorDataError.invalidData
        }
        
        guard let achievement = try? decoder.decode(AchievementResponse.self, from: data) else {
            throw InteractorDataError.parsingFailed
        }
        
        output?.achievementsFetched(achievements: achievement.achievements, title: achievement.overview.title)
    }
    
}
