//
//  Achievement.swift
//  Stash
//
//  Created by Daniel Romero on 12/25/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import Foundation


/// Struct representing the entire response format for the achievements module.
struct AchievementResponse: Codable {
    
    let overview: Overview
    let achievements: [Achievement]
    let success: Bool = true
    let status: Int = 200
    
    enum CodingKeys: String, CodingKey {
        case overview
        case achievements
    }
}


struct Overview: Codable {
    let title: String
}


/// Struct representing individual achievements
struct Achievement: Codable {
    
    let id: Int
    let level: String
    let progress: Int
    let total: Int
    let backgroundImageUrl: String
    let accessible: Bool
    
    var progressPercentage: Double {
        return (Double(progress) / Double(total)) * 100
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case level
        case progress
        case total
        case backgroundImageUrl = "bg_image_url"
        case accessible
    }
    
}

extension Achievement: Equatable {
    
    public static func == (lhs: Achievement, rhs: Achievement) -> Bool {
        return lhs.id == rhs.id &&
            lhs.level == rhs.level &&
            lhs.progress == rhs.progress &&
            lhs.total == rhs.total &&
            lhs.backgroundImageUrl == rhs.backgroundImageUrl &&
            lhs.accessible == rhs.accessible
    }

}

