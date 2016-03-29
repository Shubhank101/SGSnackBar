//
//  ViewController.swift
//  SGSnackBar
//
//  Created by Shubhank Gupta on 01/17/2016.
//  Copyright (c) 2016 Shubhank Gupta. All rights reserved.
//

import UIKit
import SGSnackBar

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "SGSnackBar"
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    }

    @IBAction func showBasic(sender: AnyObject) {

        SGSnackBarView.appearance().actionButtonBackgroundColor = UIColor(red: 96/255.0, green: 125/255.0, blue: 139/255.0, alpha: 1.0)
        SGSnackBarView.appearance().snackBarBgColor = UIColor(red: 233/255.0, green: 30/255.0, blue: 99/255.0, alpha: 1.0)
        self.view.showSnackMessage("My Snackbar message", duration: SnackbarDuration.SHORT, actionButtonText: "OK") { () -> () in
            print("Ok tapped")
        }
    }
    
    
    @IBAction func showThemed(sender: AnyObject) {
        SGSnackBarView.appearance().actionButtonBackgroundColor = UIColor.orangeColor()
        SGSnackBarView.appearance().descLabelTextColor = UIColor.whiteColor()
        SGSnackBarView.appearance().snackBarBgColor = UIColor(red: 255/255.0, green: 87/255.0, blue: 34/255.0, alpha: 1.0)
        self.view.showSnackMessage("ORANGE\nMultiline", duration: SnackbarDuration.SHORT, actionButtonText: nil, actionButtonClickHandler: nil)
    }
    
    @IBAction func showThemed2(sender: AnyObject) {
        SGSnackBarView.appearance().actionButtonBackgroundColor = UIColor.darkGrayColor()
        SGSnackBarView.appearance().descLabelTextColor = UIColor.blackColor()
        SGSnackBarView.appearance().snackBarBgColor = UIColor.whiteColor()
        self.view.showSnackMessage("Your conversation has been deleted", duration: SnackbarDuration.SHORT, actionButtonText: "UNDO") { () -> () in
            self.undoAlert()
        }
    }

    
    func undoAlert() {
        let alertController = UIAlertController(title: "Confirm?", message: "Are you sure you want to undo?", preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (action) -> Void in
            self.showDeleteSnackBar()
        }))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func showDeleteSnackBar() {
        SGSnackBarView.appearance().descLabelTextColor = UIColor.whiteColor()
        SGSnackBarView.appearance().snackBarBgColor = UIColor(red: 76/255.0, green: 175/255.0, blue: 80/255.0, alpha: 1.0)
        self.view.showSnackMessage("Your conversation has been restored :)", duration: SnackbarDuration.SHORT, actionButtonText: nil, actionButtonClickHandler: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

