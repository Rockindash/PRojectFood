//
//  RecipesViewController.swift
//  ProjectFood
//
//  Created by Vedaant Agnihotri on 2020-02-01.
//  Copyright © 2020 Amol Kumar. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController {

    @IBOutlet private var tableView: UITableView!
    private var recipes: [Recipe]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "RecipieCell", bundle: Bundle.main), forCellReuseIdentifier: "RecipieCell")
        
        networkManager().fetchRecipes { (recipes) in
        self.recipes = recipes
        DispatchQueue.main.async{
          self.tableView.reloadData()
        }
        print("Recipes: ", recipes)
        // Do any additional setup after loading the view.
    }
}
}

extension RecipesViewController: UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return 7
}


 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Recipe", for: indexPath) as? RecipeCell else {
      fatalError("Issue dequeuing Recipe")
    }
    cell.configure(with: recipes?[indexPath.row] ?? Recipe(label: "hi", image: "nkjwd", source: "ff",url: "sf",dietLabels: ["sfs","sdsd"], healthLabels: ["sds"], ingredientLines: [":dssd", "sdsd"], calories: 2333.223))
    return cell
  }
}

extension RecipesViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
