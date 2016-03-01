//
//  AAALevelMO+CoreDataProperties.swift
//  questions
//
//  Created by José María Delgado  on 29/2/16.
//  Copyright © 2016 José María Delgado . All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension AAALevelMO {

    @NSManaged var currentLevel: String?
    @NSManaged var identifier: String?

}
