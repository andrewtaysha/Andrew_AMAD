//
//  ThirdViewController.swift
//  Desserts
//
//  Created by Andrew Taylor-Shaut on 2/9/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var chooseDessert: UIPickerView!
    @IBOutlet weak var dessertLabel: UILabel!
    
    
    let dessertChoice = 0
    let dessertTypeChoice = 1
    
    var dessertType = [String: [String]]()
    var dessert = [String]()
    var dessertKind = [String]()
    
    func getDataFile() -> String? {
        guard let pathString = Bundle.main.path(forResource: "dessertList", ofType: "plist") else {
            return nil
        }
        return pathString
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == dessertChoice {
            return dessert.count
        } else {
            return dessertKind.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component==dessertChoice {
            return dessert[row]
        }
        else {
            return dessertKind[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == dessertChoice {
            let selectedDessert = dessert[row]
            dessertKind = dessertType[selectedDessert]!
            chooseDessert.reloadComponent(dessertTypeChoice)
            chooseDessert.selectRow(0, inComponent: dessertTypeChoice, animated: true)
        }
        let dessertrow = pickerView.selectedRow(inComponent: dessertChoice)
        let dessertKindrow = pickerView.selectedRow(inComponent: dessertTypeChoice)
        dessertLabel.text = "You like \(dessertKind[dessertKindrow]) \(dessert[dessertrow])"
    }
    
    @IBAction func findDessert(_ sender: UIButton) {
        if(UIApplication.shared.canOpenURL(URL(string: "yelp://")!)){
            UIApplication.shared.open(URL(string: "yelp://")!, options: [:], completionHandler: nil)
        }else {
            if(UIApplication.shared.canOpenURL(URL(string: "maps://")!)){
                UIApplication.shared.open(URL(string: "maps://")!, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.open(URL(string: "http://www.google.com/dessert_near_me")!, options: [:], completionHandler: nil)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let path = getDataFile() else{
            print("Error loading file")
            return
        }
        dessertType = NSDictionary(contentsOfFile: path) as! [String: [String]]
        dessert = Array(dessertType.keys)
        dessertKind = dessertType[dessert[0]]! as [String]
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
