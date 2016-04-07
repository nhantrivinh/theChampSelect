//
//  Champion+CoreDataProperties.swift
//  theChampSelect
//
//  Created by AndAnotherOne on 4/7/16.
//  Copyright © 2016 AndAnotherOne. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Champion {

    @NSManaged var name: String?
    @NSManaged var howToWin: String?
    @NSManaged var image: NSData?

}
