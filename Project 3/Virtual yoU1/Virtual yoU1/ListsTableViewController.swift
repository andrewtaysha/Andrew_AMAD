//
//  ListTableViewController.swift
//  Profile
//
//  Created by Andrew Taylor-Shaut on 2/28/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit
import Firebase

class ListsTableViewController: UITableViewController {
    var listNameList = ListNames()
    let lfilename = "data2.plist"
    var ref: FIRDatabaseReference!
    
    func getDataFile() -> String? {
        //use a Bundle object of the directory for our application to retrieve the pathname of Lists.plist
        guard let pathString = Bundle.main.path(forResource: "Lists", ofType: "plist") else {
            return nil
        }
        return pathString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path:String?
        let filePath = docFilePath(lfilename) // pat to data file
        
        //if the data file exists, use it
        if FileManager.default.fileExists(atPath: filePath!){
            path = filePath
            //print(path)
        }
        else {
            path = getDataFile()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        //load the data of the plist file into the dictionary
        listNameList.listNameData = NSDictionary(contentsOfFile: path!) as! [String : [String]]
        //puts all the continents in an array
        listNameList.listName = Array(listNameList.listNameData.keys)
        
        //application instance
        let app = UIApplication.shared
        //subscribe to the UIApplicationWillResignActiveNotification notification
        NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: app)
        
        ref = FIRDatabase.database().reference()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ListDetailSegue" {
            let detailVC = segue.destination as! DetailListTableViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            //sets the data for the destination controller
            detailVC.title = listNameList.listName[indexPath.row]
            detailVC.listNameListDetail=listNameList
            detailVC.selectedListName = indexPath.row
        }
    }
    @IBAction func unwindNewListSegue (_ segue:UIStoryboardSegue){
        if segue.identifier=="DoneNewListSegue"{
            let source = segue.source as! AddListViewController //only add a list item if there is text in the textfield
            if ((source.addedList.isEmpty) == false){
                listNameList.listName.append(source.addedList)
                tableView.reloadData()
//                let chosenListName = listNameListDetail.listName[selectedListName]
//                listNameListDetail.listNameData[chosenListName]?.append(source.addedListItem)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listNameList.listNameData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listNameList.listName[indexPath.row]
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
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
}

     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func docFilePath(_ filename: String) -> String?{
        //locate the documents directory
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = path[0] as NSString //document directory
        //print(dir)
        //creates the full path to our data file
        return dir.appendingPathComponent(filename)
    }
    
    //called when the UIApplicationWillResignActiveNotification notification is posted
    //all notification methods take a single NSNotification instance as their argument
    func applicationWillResignActive(_ notification: Notification){
        let filePath = docFilePath(lfilename)
        let data = NSMutableDictionary()
        //adds our whole dictionary to the data dictionary
        data.addEntries(from: listNameList.listNameData)
        //print(data)
        //write the contents of the array to our plist file
        data.write(toFile: filePath!, atomically: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
