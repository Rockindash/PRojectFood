//
//  ItemViewController.swift
//  ProjectFood
//
//  Created by Vedaant Agnihotri on 2020-02-01.
//  Copyright © 2020 Amol Kumar. All rights reserved.
//

import UIKit

let RecognizedItems = ["milk", "bread", "Tomoatos"]
// Have to discuss with Amol id we can use segment instead of Global variables:
var SelectedItems = Set<String>()
class ItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(RecognizedItems.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "RecognizedItem")
        cell.textLabel?.text = RecognizedItems[indexPath.row]

        return(cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ItemIndex = indexPath.row
        if tableView.cellForRow(at: indexPath)?.accessoryType != UITableViewCell.AccessoryType.checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            SelectedItems.insert(RecognizedItems[ItemIndex])
        }
        else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            SelectedItems.remove(RecognizedItems[ItemIndex])
        }
        // This is only for testing and should be removed
        print(ItemIndex , SelectedItems)
    }
    
    @IBAction func findRecipes(_ sender: UIButton) {
        performSegue(withIdentifier : "SelectedItemSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }
    
    
   
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
