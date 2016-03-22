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
    }

    @IBAction func showBasic(sender: AnyObject) {

        SGSnackBarView.appearance().descLabelTextColor = UIColor.whiteColor()
        self.view.window!.showSnackMessage("My Snackbar message", duration: SnackbarDuration.SHORT, actionButtonText: "OK") { () -> () in
        }
    }
    
    
    @IBAction func showThemed(sender: AnyObject) {
        SGSnackBarView.appearance().actionButtonBackgroundColor = UIColor.orangeColor()
        SGSnackBarView.appearance().descLabelTextColor = UIColor.whiteColor()
        SGSnackBarView.appearance().snackBarBgColor = UIColor.redColor()
        self.view.window!.showSnackMessage("ORANGE\nMultiline", duration: SnackbarDuration.SHORT, actionButtonText: nil, actionButtonClickHandler: nil)
    }
    
    @IBAction func showThemed2(sender: AnyObject) {
        SGSnackBarView.appearance().actionButtonBackgroundColor = UIColor.darkGrayColor()
        SGSnackBarView.appearance().descLabelTextColor = UIColor.blackColor()
        SGSnackBarView.appearance().snackBarBgColor = UIColor.whiteColor()
        self.view.window!.showSnackMessage("Your conversation has been deleted", duration: SnackbarDuration.SHORT, actionButtonText: "UNDO") { () -> () in
            print("should undo")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

