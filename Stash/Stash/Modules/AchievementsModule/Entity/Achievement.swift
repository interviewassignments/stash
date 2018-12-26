//
//  Achievement.swift
//  Stash
//
//  Created by Daniel Romero on 12/25/18.
//  Copyright © 2018 Daniel Romero. All rights reserved.
//

import Foundation

/// Struct representing individual achievements
struct Achievement: Codable {
    
    let id: String
    let level: String
    let progress: Int
    let total: Int
    let backgroundImageUrl: URL
    let accessible: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case level
        case progress
        case total
        case backgroundImageUrl = "bg_image_url"
        case accessible
    }
    
}
