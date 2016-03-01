//
//  LevelViewController.swift
//  questions
//
//  Created by José María Delgado  on 27/2/16.
//  Copyright © 2016 José María Delgado . All rights reserved.
//

import UIKit
import CoreData

class LevelViewController: UIViewController {
    var currentLevel: AnyObject!
    var answer: String!
    @IBOutlet weak var textFieldBackground: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var tryButton: UIButton!
    @IBOutlet weak var tryButtonBackground: UILabel!
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let moc = self.managedObjectContext
        let levelFetch = NSFetchRequest(entityName: "Level")
        
        do {
            let fetchedLevel = try moc.executeFetchRequest(levelFetch) as! [AAALevelMO]
            var level = fetchedLevel[0] as NSManagedObject
            self.currentLevel = level.valueForKey("currentLevel")
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
        
        let identifier = "identifier"
        levelFetch.predicate = NSPredicate(format: "identifier == %@", identifier)
        
        textFieldBackground.layer.borderWidth = 100
        textFieldBackground.layer.cornerRadius = 5
        textFieldBackground.layer.borderColor = UIColor.whiteColor().CGColor
        tryButtonBackground.layer.borderWidth = 100
        tryButtonBackground.layer.cornerRadius = 5
        tryButtonBackground.layer.borderColor = UIColor(netHex: 0x129EFF).CGColor
        textField.becomeFirstResponder()
        
        switch currentLevel {
        case "1" as String:
            questionLabel.text = "País más pequeño del mundo" //ciudad del vaticano
            break
        case "2" as String:
            questionLabel.text = "Distancia de la Tierra al Sol" //149.600.000 km
            break
        case "3" as String:
            questionLabel.text = "Me ponen sobre la mesa, me cortan pero no me comen, ¿quién soy?" //la servilleta
            break
        case "4" as NSObject:
            questionLabel.text = "Si un hombre tiene 100 años y sólo ha cumplido 25, ¿cuándo ha nacido?" //29 de febrero
            break
        case "5" as NSObject:
            questionLabel.text = "¿Cúal es el malestar de 2+1?" //estrés, el estrés
            break
        case "6" as NSObject:
            questionLabel.text = "¿Qué es esa cosa que mientras más grande sea menos se ve?" //la oscuridad
            break
        case "7" as NSObject:
            questionLabel.text = "Si en una casa viven doce hermanos y cada uno tiene una hermana, ¿cuántos son en total?" //doce, 12
            break
        default:
            break
        }
    }
    
    @IBAction func tryAnswer() {
        let moc = self.managedObjectContext
        let levelFetch = NSFetchRequest(entityName: "Level")
        
        do {
            let fetchedLevel = try moc.executeFetchRequest(levelFetch) as! [AAALevelMO]
            var level = fetchedLevel[0] as NSManagedObject
            
            switch currentLevel {
            case "1" as String:
                if (textField.text == "ciudad del vaticano" || textField.text == "Ciudad del Vaticano") {
                    level.setValue("2", forKey: "currentLevel")
                    print("----Next level!\(level.valueForKey("currentLevel"))")
                    performSegueWithIdentifier("rightAnswer", sender: self)
                } else {
                    print("----Wrong answer")
                }
                break
            case "2" as String:
                if (textField.text == "149.600.000 km" || textField.text == "149600000 km") {
                    level.setValue("3", forKey: "currentLevel")
                    print("----Next level!\(level.valueForKey("currentLevel"))")
                    performSegueWithIdentifier("rightAnswer", sender: self)
                } else {
                    print("----Wrong answer")
                }
                break
            case "3" as String:
                if (textField.text == "ciudad del vaticano" || textField.text == "Ciudad del Vaticano") {
                    level.setValue("2", forKey: "currentLevel")
                    print("----Next level!\(level.valueForKey("currentLevel"))")
                    performSegueWithIdentifier("rightAnswer", sender: self)
                } else {
                    print("----Wrong answer")
                }
                break
            default:
                break
            }
            
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0,
            alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
