//
//  DetailListViewController.swift
//  Virtual yoU1
//
//  Created by Andrew Taylor-Shaut on 5/8/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class DetailListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableViewCell!
    
    var text:String = ""
    var masterView:ListsViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.textLabel?.text = text
        tableView.becomeFirstResponder()
    }
    
    func setText(t:String){
        text = t
        if isViewLoaded{
            tableView.textLabel?.text = t
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        masterView.newRowText = (tableView.textLabel?.text)!
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
