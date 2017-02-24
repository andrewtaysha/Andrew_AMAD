//
//  AddFoodViewController.swift
//  Food
//
//  Created by Andrew Taylor-Shaut on 2/23/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class AddFoodViewController: UIViewController {
    
    @IBOutlet weak var foodsTextField: UITextField!
    
    var addedFoods = String()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue"{
            //only add a country if there is text in the textfield
            if ((foodsTextField.text?.isEmpty) == false){
                addedFoods=foodsTextField.text!
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
