//
//  AddListViewController.swift
//  Profile
//
//  Created by Andrew Taylor-Shaut on 3/12/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

//did not get working

import UIKit

class AddListViewController: UIViewController {

    @IBOutlet weak var newListTextfield: UITextField!

    var addedList = String()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { if segue.identifier == "DoneNewListSegue"{
        if ((newListTextfield.text?.isEmpty) == false){
            addedList=newListTextfield.text!
        }
    }
}
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
