//
//  AddRunViewController.swift
//  Midterm
//
//  Created by Andrew Taylor-Shaut on 3/16/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class AddRunViewController: UIViewController {
    
    @IBOutlet weak var runsTextField: UITextField!
    
    var addedRuns = String()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DoneSegue"{
            //only add a country if there is text in the textfield
            if ((runsTextField.text?.isEmpty) == false){
                addedRuns=runsTextField.text!
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
