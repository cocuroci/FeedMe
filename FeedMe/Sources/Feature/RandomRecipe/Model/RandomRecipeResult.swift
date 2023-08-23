//
//  RandomRecipeResult.swift
//  FeedMe
//
//  Created by Andre on 22/08/23.
//  Copyright © 2023 Cocuroci. All rights reserved.
//

import Foundation

struct RandomRecipeResult: Equatable, Codable {
    let meals: [Meal]
}

struct Meal: Equatable, Codable {
    private enum CodingKeys: String, CodingKey {
        case id = "idMeal"
    }

    let id: String
}
