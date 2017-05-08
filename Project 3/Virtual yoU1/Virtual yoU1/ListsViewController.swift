//
//  ListsViewController.swift
//  Virtual yoU1
//
//  Created by Andrew Taylor-Shaut on 5/8/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class ListsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    @IBOutlet weak var table: UITableView!
    
    var data:[String] = ["New List"]
    var file:String!
    var selectedRow:Int = -1
    var newRowText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Lists"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addList))
        self.navigationItem.rightBarButtonItem = addButton
        
        let docsDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .allDomainsMask, true)
        file = docsDir[0].appending("list.txt")
        
        load()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if selectedRow == -1 {
            return
        }
        data[selectedRow] = newRowText
        if newRowText == "" {
            data.remove(at: selectedRow)
        }
        table.reloadData()
        save()
    }
    
    func addList() {
        if (table.isEditing) {
            return
        }
        let name:String = "new list title"
        data.insert(name, at: 0)
        let indexPath:IndexPath = IndexPath(row: 0, section: 0)
        table.insertRows(at: [indexPath], with: .automatic)
        table.selectRow(at: indexPath, animated: true, scrollPosition: .none)
        self.performSegue(withIdentifier: "ListDetailSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        data.remove(at: indexPath.row)
        table.deleteRows(at: [indexPath], with: .fade)
        save()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ListDetailSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailView:DetailListViewController = segue.destination as! DetailListViewController
        selectedRow = table.indexPathForSelectedRow!.row
        detailView.masterView = self
        detailView.setText(t: data[selectedRow])
    }
    
    //    func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    //    }
    //
    //    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
    //        return true
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func save(){
        //        UserDefaults.standard.set(data, forKey: "List")
        //        UserDefaults.standard.synchronize()
        let newData:NSArray = NSArray(array: data)
        newData.write(toFile: file, atomically: true)
    }
    
    func load(){
        if let loadedData = NSArray(contentsOfFile:file) as? [String] {
            data = loadedData
            table.reloadData()
        }
    }
}
