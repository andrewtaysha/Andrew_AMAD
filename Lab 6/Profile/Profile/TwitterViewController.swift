//
//  TwitterViewController.swift
//  Profile
//
//  Created by Andrew Taylor-Shaut on 2/28/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import UIKit
import Social
import Accounts

class TwitterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tweetTableView: UITableView!
    
    var dataSource = [AnyObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        getTimeLine()
        tweetTableView.estimatedRowHeight = 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func getTimeLine() {

        let account = ACAccountStore()
        let accountType = account.accountType(
            withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
        
        account.requestAccessToAccounts(with: accountType, options: nil, completion: {(success, error) in
            
            if success {
                let arrayOfAccounts =
                    account.accounts(with: accountType)
                
                if (arrayOfAccounts?.count)! > 0 {
                    let twitterAccount = arrayOfAccounts?.last as! ACAccount
                    
                    let requestURL = URL(string:
                        "https://api.twitter.com/1.1/statuses/user_timeline.json")
                    
                    let parameters = ["screen_name" : "@andrewtaysha",
                                      "include_rts" : "0",
                                      "trim_user" : "1",
                                      "count" : "20"]
                    
                    let postRequest = SLRequest(forServiceType: SLServiceTypeTwitter, requestMethod: SLRequestMethod.GET, url: requestURL, parameters: parameters)
                    
                    postRequest?.account = twitterAccount
                    
                    postRequest?.perform(handler: {(responseData, urlResponse, error) in
                        
                        do {
                            try self.dataSource = JSONSerialization.jsonObject(with: responseData!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! [AnyObject]
                            
                            if self.dataSource.count != 0 {
                                DispatchQueue.main.async() {
                                    self.tweetTableView.reloadData()
                                }
                            }
                        } catch let error as NSError {
                            print("Data serialization error: \(error.localizedDescription)")
                        }
                    })
                }
            } else {
                print("Failed to access account")
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "Cell")
        let row = indexPath.row
        let tweet = self.dataSource[row]
        cell!.textLabel!.text = tweet.object(forKey: "text") as? String
        cell!.textLabel!.numberOfLines = 0
        return cell!
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
/*import TwitterKit

class TwitterViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add a button to the center of the view to show the timeline
        let button = UIButton(type: .system)
        button.setTitle("Show Timeline", for: [])
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(showTimeline), for: [.touchUpInside])
        view.addSubview(button)
    }
    func showTimeline() {
        // Create an API client and data source to fetch Tweets for the timeline
        let client = TWTRAPIClient()
        //TODO: Replace with your collection id or a different data source
        let dataSource = TWTRCollectionTimelineDataSource(collectionID: "539487832448843776", apiClient: client)
        // Create the timeline view controller
        let timelineViewControlller = TWTRTimelineViewController(dataSource: dataSource)
        // Create done button to dismiss the view controller
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissTimeline))
        timelineViewControlller.navigationItem.leftBarButtonItem = button
        // Create a navigation controller to hold the
        let navigationController = UINavigationController(rootViewController: timelineViewControlller)
        showDetailViewController(navigationController, sender: self)
    }
    func dismissTimeline() {
        dismiss(animated: true, completion: nil)
    }
}*/
