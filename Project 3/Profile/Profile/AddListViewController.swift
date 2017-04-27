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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { if segue.identifier == "doneNewListSegue"{
        //only add a country if there is text in the textfield
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
