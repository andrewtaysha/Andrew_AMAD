//
//  EditListItemViewController.swift
//  Virtual yoU1
//
//  Created by Andrew Taylor-Shaut on 5/8/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class EditListItemViewController: UIViewController {

    @IBOutlet weak var editListItemTextField: UITextField!
    
    var index:Int?
    
    var listNameListDetail = ListNames()
    var listNameData:[String]!
    var editedListItem:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editListItemTextField.text = listNameData[index!]
        
//        self.clearsSelectionOnViewWillAppear = false
//        
//        self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            editListItemTextField.becomeFirstResponder()
        }
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SaveEditListItemSegue" {
            editedListItem = editListItemTextField.text
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
