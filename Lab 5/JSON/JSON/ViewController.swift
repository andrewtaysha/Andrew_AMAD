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
    
    var objects = [[String:String]]()
    
    func loadjson(){ let urlPath =
        "http://api.population.io/1.0/population/World/today-and-tomorrow/?format=json"
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
        session.resume() }
    
    func parsejson(_ data: Data){ do {
        // get json data
        let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
        //get all results
        let allresults = json["results"] as! [[String:Any]]
        //add results to objects
        for result in allresults {
            //check that data exists
            guard let dateLabel = result["date"]! as? NSNumber, let populationLabel = result["populationCount"] as? NSNumber/*, let itemurl = result["url"]!as? String*/
                else {
                    continue
            }
            //create new object
            let obj = ["date": dateLabel.stringValue, "population": populationLabel.stringValue/*, "url": itemurl*/] as [String : Any]
            //add object to array
            self.objects.append(obj as! [String : String]) }
        //handle thrown error
    } catch {
        print("Error with JSON: \(error)")
        return
        }
        //reload the table data after the json data has been downloaded
        //reloadData()
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

