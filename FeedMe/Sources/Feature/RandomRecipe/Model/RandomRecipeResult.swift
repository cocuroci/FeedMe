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
        case meal = "strMeal"
        case category = "strCategory"
        case area = "strArea"
        case thumb = "strMealThumb"
        case instructions = "strInstructions"
        case youtube = "strYoutube"
    }

    let id: String
    let meal: String
    let category: String
    let area: String
    let thumb: String
    let instructions: String
    let youtube: String?

    var youtubeUrl: URL? {
        guard let youtube else {
            return nil
        }

        return URL(string: youtube)
    }
}

extension Meal {
    static let mock = Meal(
        id: "1",
        meal: "Lazanha",
        category: "Category",
        area: "Area",
        thumb: "",
        instructions: "Instructions",
        youtube: nil
    )
}
