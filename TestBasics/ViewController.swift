//
//  ViewController.swift
//  TestBasics
//
//  Created by Kun on 10/10/15.
//  Copyright © 2015 Kun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        study()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //: Interface actions
    @IBAction func showMessage(sender: AnyObject) {
        let alertController = UIAlertController(title: "Haha world", message: "I'm your assistant", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    func study() {
        let firstString = "Swift is awesome"
        let secondMessage = " What do you think?"
        let message = firstString + secondMessage
        print(message)
    }
    

}

