//
//  NotepadViewController.swift
//  Profile
//
//  Created by Andrew Taylor-Shaut on 2/28/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

/*import UIKit

class NewNotepadViewController: UIViewController, UITextViewDelegate {

}*/

//
//  DetailListTableViewController.swift
//  Profile
//
//  Created by Andrew Taylor-Shaut on 3/13/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class DetailNotepadTableViewController: UITableViewController {
    var notepadItems = [String]()
    var selectedNotepadName = 0
    var notepadNameNotepadDetail = NotepadNames()
    
    @IBOutlet weak var notepadTextView: UITextView!
    
    var detailItem = [String]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = notepadTextView.text
        //notepadTextView.text = note.content
    }
    /*override func viewWillAppear(_ animated: Bool) {
     notepadNameListDetail.notepadName = Array(notepadNameListDetail.notepadNameData.keys)
     let chosenNotepadName = notepadNameListDetail.notepadName[selectedNotepadName]
     notepadItems = notepadNameListDetail.notepadNameData[chosenNotepadName]! as [String]
     }*/
    
    func textViewDidChange(_ textView: UITextView) {
        let title = self.notepadTextView.text.components(separatedBy: "\n")
        var count = 0
        var stuffA = [String]()
        for x in title{
            stuffA[count] = x
            count+=1
            print(count)
            
            //let firstLine = (notepadTextView.text as NSString).substring(to: 0)
            //navigationItem.title = firstLine
        }
        print(stuffA[0])
        navigationItem.title = stuffA[0]
    }
    
    //http://stackoverflow.com/questions/31844784/creating-title-from-first-line-of-uitextview-think-apple-notes-app-swift
    /*override func viewWillDisappear(_ animated: Bool) {
     super.viewWillDisappear(animated)
     
     //note.content = notepadTextView.text
     
     navigationItem.title = self.notepadTextView.text
     
     if !self.notepadTextView.text.isEmpty {
     var notepadTextViewString:String = self.notepadTextView.text
     
     if let range = self.notepadTextView.text.rangeOfString("\n") {
     let rangeOfString = self.notepadTextView.text.startIndex ..< range.endIndex
     let firstLine = self.notepadTextView.text.substringWithRange(rangeOfString)
     
     navigationItem.title = firstLine
     } else {
     // take up to the first 30 characters as the title
     let length = count(self.notepadTextView.text)
     if length > 0 {
     let firstLine = (notepadTextView.text as NSString).substring(to: 0)
     navigationItem.title = firstLine
     } else {
     let firstLine = (notepadTextView.text as NSString).substring(to: length)
     navigationItem.title = firstLine
     }
     }
     }
     }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return notepadItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = notepadItems[indexPath.row]
        return cell
    }
    
   /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            notepadItems.remove(at: indexPath.row)
            let chosenListName = notepadNameListDetail.notepadName[selectedNotepadName]
            //Delete from the data model
            notepadNameListDetail.notepadNameData[chosenNotepadName]?.remove(at: indexPath.row)
            // Delete the row from the table
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }*/
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
 
}

