//
//  DetailViewController.swift
//  Food
//
//  Created by Andrew Taylor-Shaut on 2/23/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    
    var searchController: UISearchController!
    var foods = [String]()
    var selectedFoodType = 0
    var foodTypeListDetail = Foods()
    
    override func viewWillAppear(_ animated: Bool) {
        foodTypeListDetail.foodType = Array(foodTypeListDetail.foodTypeData.keys)
        print(selectedFoodType)
        let chosenFoodType = foodTypeListDetail.foodType[selectedFoodType]
        foods = foodTypeListDetail.foodTypeData[chosenFoodType]! as [String]
        //search results
        let resultsController = SearchResultsController() //create an instance of our SearchResultsController class
        print(foods)
        resultsController.allWords = foods //set the allWords property to our words array
        searchController = UISearchController(searchResultsController: resultsController) // initialize our search controller with the resultsController when it has search results to display
        
        //search bar configuration
        searchController.searchBar.placeholder = "Enter a search term" //place holder text
        searchController.searchBar.sizeToFit() // sets appropriate size size for the search bar
        tableView.tableHeaderView=searchController.searchBar // install the search bar as the table header
        searchController.searchResultsUpdater = resultsController //sets the instance to update search results
    }
    
    func getDataFile() -> String? {
        //use a Bundle object of the directory for our application to retrieve the pathname of qwordsnou.plist
        guard let pathString = Bundle.main.path(forResource: "foods", ofType: "plist") else {
            return nil
        }
        return pathString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("view will disappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        cell.textLabel?.text = foods[indexPath.row]
        return cell
    }
    
    //Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    //Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Delete the country from the array
            foods.remove(at: indexPath.row)
            let chosenFoodType = foodTypeListDetail.foodType[selectedFoodType]
            //Delete from the data model
            foodTypeListDetail.foodTypeData[chosenFoodType]?.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let fromRow = fromIndexPath.row //row being moved from
        let toRow = to.row //row being moved to
        let moveFood = foods[fromRow] //country being moved
        //move in array
        foods.remove(at: fromRow)
        foods.insert(moveFood, at: toRow)
        //move in data model
        let chosenFoodType = foodTypeListDetail.foodType[selectedFoodType]
        foodTypeListDetail.foodTypeData[chosenFoodType]?.remove(at: fromRow)
        foodTypeListDetail.foodTypeData[chosenFoodType]?.insert(moveFood, at: toRow)
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        if segue.identifier=="doneSegue"{
            let source = segue.source as! AddFoodViewController
            //only add a country if there is text in the textfield
            if ((source.addedFoods.isEmpty) == false){
                foods.append(source.addedFoods)
                tableView.reloadData()
                let chosenFoodType = foodTypeListDetail.foodType[selectedFoodType]
                foodTypeListDetail.foodTypeData[chosenFoodType]?.append(source.addedFoods)
            }
        }
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}
