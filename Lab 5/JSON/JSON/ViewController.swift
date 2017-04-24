//
//  ViewController.swift
//  JSON
//
//  Created by Andrew Taylor-Shaut on 4/6/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var dict = NSDictionary()
    var objects = [[String:String]]()
    
    func loadjson(){
        let urlPath = "http://api.population.io/1.0/population/World/today-and-tomorrow/?format=json"
        guard let url = URL(string: urlPath) else {
            print("url error")
            return
        }
        let session = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            guard statusCode == 200
            else {
                print("file download error")
                return
            }
            //download successful
            print("download complete")
            DispatchQueue.main.async {self.parsejson(data!)}
        })
        //must call resume to run session
        session.resume()
    }
    
    func parsejson(_ data: Data){
        do {
            // get json data
            let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
            //get all results
            let allresults = json["results"] as! [[String:Any]]
            
            //add results to objects
            for result in allresults {
                //check that data exists
                guard let date = result["date"]! as? NSNumber,
                    let population = result["population"] as? NSNumber
                    else {
                        continue
                }
                //create new object
                let obj = ["date": date.stringValue, "population": population.stringValue]
                //add object to array
                self.objects.append(obj) }
            //handle thrown error
        } catch {
            print("Error with JSON: \(error)")
            return
        }
        dateLabel.text = objects["date"]
        if objects["population"] != nil {
            populationLabel!.text = objects["population"]! + "people"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadjson()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

