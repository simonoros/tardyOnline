//
//  ViewController.swift
//  tardyOnline
//
//  Created by Charlie Donnelly on 3/10/18.
//  Copyright © 2018 Charlie Donnelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var explanation: UITextField!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    var strDate = "";
    var explanationStr = "";
    
    
   
    @IBAction func finishedEditing(_ sender: Any) {
       
        //print(theTardies[0])
        
    }
    
    @IBAction func finishedExplanation(_ sender: Any) {
        //explanationStr = explanation.text!
    }
    
    @IBAction func submitPressed(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        explanationStr = dateFormatter.string(from: myDatePicker.date)
        
        let editedInformationObject = UserDefaults.standard.object(forKey: "theTardies");
        
        var theTardies = [String]()
        
        
        if let addedObject = editedInformationObject as? [String]
        {
            theTardies = addedObject;
            theTardies.append(explanationStr + ", " + explanation.text!)
        }
        else{
            theTardies = [explanationStr + ", " + explanation.text!]
        }
        //theTardies.removeAll()
        UserDefaults.standard.set(theTardies, forKey: "theTardies");
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let secondViewController = storyboard.instantiateViewController(withIdentifier: "allTardies") as? SecondViewController{
            
            secondViewController.theTardies = theTardies
            secondViewController.tardyInfoString = explanation.text!;
            self.present(secondViewController, animated: true)
        }
        
    
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

