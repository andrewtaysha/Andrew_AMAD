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
    
    init(snapshot: FIRDataSnapshot) {
        let snapshotValue = snapshot.value as! [String : String]
        listNameData = [snapshotValue["listNameData"]!]
        listName = [snapshotValue["listName"]!]
    }
}

