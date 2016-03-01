//
//  ViewController.swift
//  questions
//
//  Created by José María Delgado  on 27/2/16.
//  Copyright © 2016 José María Delgado . All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var currentLevelLabel: UILabel!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let firstLaunch = NSUserDefaults.standardUserDefaults().boolForKey("FirstLaunch")
        if firstLaunch  {
            print("Not first launch")
        }
        else {
            print("First launch")
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "FirstLaunch")
            let level = NSEntityDescription.insertNewObjectForEntityForName("Level", inManagedObjectContext: self.managedObjectContext) as! AAALevelMO
            level.identifier = "identifier"
            level.currentLevel = "1"
            
            do {
                try self.managedObjectContext.save()
                print("item saved, \(level)")
            } catch {
                fatalError("Failure to save context: \(error)")
            }
        }
        let moc = self.managedObjectContext
        let levelFetch = NSFetchRequest(entityName: "Level")
        
        do {
            let fetchedLevel = try moc.executeFetchRequest(levelFetch) as! [AAALevelMO]
            var level = fetchedLevel[0] as NSManagedObject
            var currentLevel = level.valueForKey("currentLevel")
            print(currentLevel)
            switch currentLevel {
            case "1" as String:
                currentLevelLabel.text = ("Nivel 1 de 150")
                break
                case "2" as String:
                currentLevelLabel.text = ("Nivel 2 de 150")
                break
            default:
                break
            }
        } catch {
            fatalError("Failed to fetch level: \(error)")
        }
    }
}

