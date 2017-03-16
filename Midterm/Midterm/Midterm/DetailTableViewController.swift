//
//  DetailTableViewController.swift
//  Midterm
//
//  Created by Andrew Taylor-Shaut on 3/16/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var searchController: UISearchController!
    var resorts = [String]()
    var selectedResortType = 0
    var resortTypeListDetail = Resorts()
    
    override func viewWillAppear(_ animated: Bool) {
        resortTypeListDetail.resortType = Array(resortTypeListDetail.resortTypeData.keys)
        print(selectedResortType)
        let chosenResortType = resortTypeListDetail.resortType[selectedResortType]
        resorts = resortTypeListDetail.resortTypeData[chosenResortType]! as [String]
        //search results
        let resultsController = SearchResultsController() //create an instance of our SearchResultsController class
        print(resorts)
        resultsController.allWords = resorts //set the allWords property to our words array
        searchController = UISearchController(searchResultsController: resultsController) // initialize our search controller with the resultsController when it has search results to display
        
        //search bar configuration
        searchController.searchBar.placeholder = "Enter a search term" //place holder text
        searchController.searchBar.sizeToFit() // sets appropriate size size for the search bar
        tableView.tableHeaderView=searchController.searchBar // install the search bar as the table header
        searchController.searchResultsUpdater = resultsController //sets the instance to update search results
    }
    
    func getDataFile() -> String? {
        //use a Bundle object of the directory for our application to retrieve the pathname of qwordsnou.plist
        guard let pathString = Bundle.main.path(forResource: "resorts", ofType: "plist") else {
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
        return resorts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = resorts[indexPath.row]
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
            resorts.remove(at: indexPath.row)
            let chosenResortType = resortTypeListDetail.resortType[selectedResortType]
            //Delete from the data model
            resortTypeListDetail.resortTypeData[chosenResortType]?.remove(at: indexPath.row)
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
        let moveFood = resorts[fromRow] //country being moved
        //move in array
        resorts.remove(at: fromRow)
        resorts.insert(moveFood, at: toRow)
        //move in data model
        let chosenResortType = resortTypeListDetail.resortType[selectedResortType]
        resortTypeListDetail.resortTypeData[chosenResortType]?.remove(at: fromRow)
        resortTypeListDetail.resortTypeData[chosenResortType]?.insert(moveFood, at: toRow)
    }
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        if segue.identifier=="DoneSegue"{
            let source = segue.source as! AddRunViewController
            //only add a country if there is text in the textfield
            if ((source.addedRuns.isEmpty) == false){
                resorts.append(source.addedRuns)
                tableView.reloadData()
                let chosenResortType = resortTypeListDetail.resortType[selectedResortType]
                resortTypeListDetail.resortTypeData[chosenResortType]?.append(source.addedRuns)
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
