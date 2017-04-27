//
//  DetailListTableViewController.swift
//  Profile
//
//  Created by Andrew Taylor-Shaut on 3/13/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class DetailListTableViewController: UITableViewController {
    var listItems = [String]()
    var selectedListName = 0
    var listNameListDetail = ListNames()
    
    override func viewWillAppear(_ animated: Bool) {
        listNameListDetail.listName = Array(listNameListDetail.listNameData.keys)
        let chosenListName = listNameListDetail.listName[selectedListName]
        listItems = listNameListDetail.listNameData[chosenListName]! as [String]
    }
    
    //@IBAction func unwindNewListItemSegue (_ segue:UIStoryboardSegue){}
    @IBAction func unwindNewListItemSegue (_ segue:UIStoryboardSegue){
    if segue.identifier=="doneNewListItemSegue"{
    let source = segue.source as! AddListItemViewController //only add a list item if there is text in the textfield
    if ((source.addedListItem.isEmpty) == false){
        listItems.append(source.addedListItem)
        tableView.reloadData()
        let chosenListName = listNameListDetail.listName[selectedListName]
        listNameListDetail.listNameData[chosenListName]?.append(source.addedListItem)
        }
    }
}
    //couldn't get the edit a tableviewcell text function to work
    @IBAction func saveToDetailListTableViewController (segue:UIStoryboardSegue) {
        let detailViewController = segue.source as! EditListItemTableViewController
        
        let index = detailViewController.index
        
        let modelString = detailViewController.editedModel
        
        listItems[index!] = modelString!
        
        tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listItems[indexPath.row]
        return cell
    }


    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            listItems.remove(at: indexPath.row)
            let chosenListName = listNameListDetail.listName[selectedListName]
            //Delete from the data model
            listNameListDetail.listNameData[chosenListName]?.remove(at: indexPath.row)
            // Delete the row from the table
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        // Return false if you do not want the specified item to be editable.
        let fromRow = fromIndexPath.row //row being moved from
        let toRow = toIndexPath.row //row being moved to
        let moveListItems = listItems[fromRow] //country being moved //move in array
        listItems.remove(at: fromRow)
        listItems.insert(moveListItems, at: toRow)
        //move in data model
        let chosenListName = listNameListDetail.listName[selectedListName]
            listNameListDetail.listNameData[chosenListName]?.remove(at:
                fromRow)
        listNameListDetail.listNameData[chosenListName]?.insert(moveListItems, at: toRow)
    }*/

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    //couldn't get the edit a tableviewcell text function to work so I commented out this
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     if segue.identifier == "EditListItemSegue" {
     
     var path = tableView.indexPathForSelectedRow
     
     let detailViewController = segue.destination as! EditListItemTableViewController
     
     detailViewController.index = path?.row
     detailViewController.listNameData = listItems
     
     }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
