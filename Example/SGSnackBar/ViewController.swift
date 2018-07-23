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
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }

    @IBAction func showBasic(sender: AnyObject) {

        SGSnackBarView.appearance().actionButtonBackgroundColor = UIColor(red: 96/255.0, green: 125/255.0, blue: 139/255.0, alpha: 1.0)
        SGSnackBarView.appearance().snackBarBgColor = UIColor(red: 233/255.0, green: 30/255.0, blue: 99/255.0, alpha: 1.0)
        self.view.showSnackbar(message: "My Snackbar message", duration: SnackbarDuration.SHORT, actionButtonText: "OK", actionButtonClickHandler: { () -> () in
            print("Ok tapped")
        })
        
    }
    
    
    @IBAction func showThemed(sender: AnyObject) {
        SGSnackBarView.appearance().actionButtonBackgroundColor = UIColor.orange
        SGSnackBarView.appearance().descLabelTextColor = UIColor.white
        SGSnackBarView.appearance().snackBarBgColor = UIColor(red: 255/255.0, green: 87/255.0, blue: 34/255.0, alpha: 1.0)
        self.view.showSnackbar(message: "ORANGE\nMultiline", duration: SnackbarDuration.SHORT, actionButtonText: nil, actionButtonClickHandler: nil)
    }
    
    @IBAction func showThemed2(sender: AnyObject) {
        SGSnackBarView.appearance().actionButtonBackgroundColor = UIColor.darkGray
        SGSnackBarView.appearance().descLabelTextColor = UIColor.black
        SGSnackBarView.appearance().snackBarBgColor = UIColor.white
        self.view.showSnackbar(message: "Your conversation has been deleted", duration: SnackbarDuration.SHORT, actionButtonText: "UNDO") { () -> () in
            self.undoAlert()
        }
    }

    
    func undoAlert() {
        let alertController = UIAlertController(title: "Confirm?", message: "Are you sure you want to undo?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) -> Void in
            self.showDeleteSnackBar()
        }))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showDeleteSnackBar() {
        SGSnackBarView.appearance().descLabelTextColor = UIColor.white
        SGSnackBarView.appearance().snackBarBgColor = UIColor(red: 76/255.0, green: 175/255.0, blue: 80/255.0, alpha: 1.0)
        self.view.showSnackbar(message: "Your conversation has been restored :)", duration: SnackbarDuration.SHORT, actionButtonText: nil, actionButtonClickHandler: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

