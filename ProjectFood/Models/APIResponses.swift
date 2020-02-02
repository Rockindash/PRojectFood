//
//  APIResponses.swift
//  ProjectFood
//
//  Created by Vedaant Agnihotri on 2020-02-01.
//  Copyright © 2020 Amol Kumar. All rights reserved.
//

import Foundation

struct RecipeSummary: Codable {
    let q: String?
    let count: Int?
    let hits: [Recipe]?
}

struct Recipe: Codable {
    
    var label: String // Recipe name
    var image: String // Image url
    var source: String // Name of recipe source
    var url: String // Source Url
    var dietLabels: [String] //Diet labels: “balanced”, “high-protein”, “high-fiber”, “low-fat”, “low-carb”, “low-sodium” (labels are per serving)
    var healthLabels: [String]  //“vegan”, “vegetarian”, “paleo”, “dairy-free”, “gluten-free”, “wheat-free”, “fat-free”, “low-sugar”, “egg-free”, “peanut-free”, “tree-nut-free”, “soy-free”, “fish-free”, “shellfish-free” (labels are per serving)
    var ingredientLines: [String] // Actual recipie
    var calories: Double
    
    
    init(label: String, image: String, source: String,url: String,dietLabels: [String], healthLabels: [String], ingredientLines: [String], calories: Double) {
        self.label = label
        self.image = image
        self.source = source
        self.url = url
        self.dietLabels = dietLabels
        self.healthLabels = healthLabels
        self.ingredientLines = ingredientLines
        self.calories = calories
    }
  }

