//
//  SecondViewController.swift
//  Desserts
//
//  Created by Andrew Taylor-Shaut on 2/9/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var chooseDessert: UIPickerView!
    @IBOutlet weak var dessertLabel: UILabel!
    
    let dessert = ["cake", "pie", "ice cream", "cookies", "drinks"]
    let time = ["morning", "afternoon", "evening", "night", "late night"]
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component==0 {
            return dessert.count
        }
        else {
            return time.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component==0 {
            return dessert[row]
        }
        else {
            return time[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let dessertrow = pickerView.selectedRow(inComponent: 0)
        let timerow = pickerView.selectedRow(inComponent: 1)
        dessertLabel.text="You like \(dessert[dessertrow]) in the \(time[timerow])"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

