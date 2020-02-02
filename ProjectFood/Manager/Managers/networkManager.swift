//
//  networkManager.swift
//  ProjectFood
//
//  Created by Vedaant Agnihotri on 2020-02-01.
//  Copyright © 2020 Amol Kumar. All rights reserved.
//

import Foundation

final class networkManager{
    var recipes : [Recipe] = []
    var inventory: [String] = []
    var ingredients : [String] = []
    var shoppingList: [String] = []

    private let i_baseUrlString = "https://api.edamam.com/search?"
    private let i_APP_ID = "9cf1bed2"
    private let i_APP_KEY = "85b5830c0cbe019760654b438c084968";
   // https://api.edamam.com/search?q=chicken&app_id=9cf1bed2&app_key=85b5830c0cbe019760654b438c084968%20
   
    func generateurl(query: String, _ extra: [String: String]...) -> String{
        let link = i_baseUrlString + "q=" + query + "&app_id=" + i_APP_ID + "&app_key=" + i_APP_KEY;
        let exlength = extra.count;

        if (exlength != 0){
            // has diet/health
            
        }

        return link;
    }
    
    func fetchRecipes(completionHandler: @escaping ([Recipe]) -> Void){
        let url = URL(string: generateurl(query: i_baseUrlString))!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
             if let error = error {
               print("Error returning receip: \(error)")
               return
             }
             
             guard let httpResponse = response as? HTTPURLResponse,
               (200...299).contains(httpResponse.statusCode) else {
               print("Unexpected response status code: \(response)")
               return
             }
            
        if let data = data,
          let recipeSummary = try? JSONDecoder().decode(RecipeSummary.self, from: data) {
          completionHandler(recipeSummary.hits ?? [])
        }
    }
    task.resume()
    }
}
