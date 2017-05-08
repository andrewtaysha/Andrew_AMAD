//
//  ListItems.swift
//  Profile
//
//  Created by Andrew Taylor-Shaut on 3/13/17.
//  Copyright © 2017 Andrew Taylor-Shaut. All rights reserved.
//

import Foundation
import Firebase

class ListNames {
    var listNameData = [String : [String]]()
    var listName = [String]()
    
    init(listNameData: [String : [String]], listName: String){
        }
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value as? NSArray
        listNameData = [snapshotValue!["listNameData"] as! Array]
        listName = [snapshotValue!["listName"]! as! String]
    }
}

