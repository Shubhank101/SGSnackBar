//  SGSnackBar
//
//  Created by Shubhank Gupta on 01/17/2016.
//  Copyright (c) 2016 Shubhank Gupta. All rights reserved.
//

import Foundation
import UIKit

public enum SnackbarDuration : Int {
    case SHORT = 4
    case LONG = 7
}

private func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

public extension UIView {
    func showSnackMessage(descriptionText: String, duration:SnackbarDuration, actionButtonText:String?, actionButtonClickHandler : (() -> ())?) {
        SGSnackBarView.showSnackMessage(descriptionText, duration: duration, actionButtonText: actionButtonText, superView: self, buttonClicked: actionButtonClickHandler)
    }
}

public class SGSnackBarView: UIView {
    
    public dynamic var snackBarBgColor: UIColor?
    
    public dynamic var descLabelTextColor: UIColor?
    public dynamic var actionButtonBackgroundColor: UIColor?
    
    private var actionButton:UIButton!
    private var descriptionLabel:UILabel!
    
    var bottomConstraint:NSLayoutConstraint!
    var buttonClickedClosure:(()->())?
    var actionButtonText:String?
    var descriptionText:String!
    
    public class func showSnackMessage(descriptionText: String, duration:SnackbarDuration, actionButtonText:String?, superView:UIView!, buttonClicked : (() -> ())?) {
        
        let snackBar = SGSnackBarView()
        snackBar.buttonClickedClosure = buttonClicked
        snackBar.actionButtonText = actionButtonText
        snackBar.descriptionText = descriptionText
        
        
        snackBar.translatesAutoresizingMaskIntoConstraints = false
        superView.addSubview(snackBar)
        
        snackBar.bottomConstraint = NSLayoutConstraint(item: snackBar, attribute: .Bottom, relatedBy: .Equal, toItem: superView, attribute: .Bottom, multiplier: 1.0, constant: 90)
        superView.addConstraint(snackBar.bottomConstraint)
        superView.addConstraint(NSLayoutConstraint(item: snackBar, attribute: .Left, relatedBy: .Equal, toItem: superView, attribute: .Left, multiplier: 1.0, constant: 0))
        superView.addConstraint(NSLayoutConstraint(item: snackBar, attribute: .Right, relatedBy: .Equal, toItem: superView, attribute: .Right, multiplier: 1.0, constant: 0))
        superView.addConstraint(NSLayoutConstraint(item: snackBar, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 60))
        
        snackBar.addDescriptionLabel()
        snackBar.addActionButton()
        
        snackBar.setupDefaultUI()
        snackBar.setupAppearanceDefaults()
        
        snackBar.animateIn()
        
        snackBar.automaticDismissSetup(duration)
    }
    
    func addDescriptionLabel() {
        descriptionLabel = UILabel()
        descriptionLabel.backgroundColor = UIColor.clearColor()
        descriptionLabel.textColor = UIColor.whiteColor()
        descriptionLabel.text = descriptionText
        descriptionLabel.numberOfLines = 2
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(descriptionLabel)
        
        self.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 14))
        self.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: descriptionLabel, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1.0, constant: -100))
    }
    
    func addActionButton() {
        actionButton = UIButton(type: UIButtonType.Custom)
        actionButton.setTitleColor( UIColor.whiteColor(), forState: UIControlState.Normal)
        actionButton.hidden = true
        if self.actionButtonText != nil {
            actionButton.hidden = false
            actionButton.setTitle(actionButtonText?.uppercaseString, forState: UIControlState.Normal)
            actionButton.addTarget(self, action: "doneTapped", forControlEvents: UIControlEvents.TouchUpInside)
        }
        
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(actionButton)
        
        self.addConstraint(NSLayoutConstraint(item: actionButton, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 15))
        self.addConstraint(NSLayoutConstraint(item: actionButton, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: -15))
        self.addConstraint(NSLayoutConstraint(item: actionButton, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1.0, constant: -10))
        self.addConstraint(NSLayoutConstraint(item: actionButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: (self.superview?.frame.size.width)! * 0.22))
    }
    
    func setupDefaultUI() {
        self.backgroundColor = UIColor.blackColor()
        self.descriptionLabel.textColor = UIColor.whiteColor()
        self.actionButton.backgroundColor = UIColor.redColor()
    }
    
    func setupAppearanceDefaults() {
        if self.snackBarBgColor != nil {
            self.backgroundColor = self.snackBarBgColor
        }
        
        if self.descLabelTextColor != nil {
            self.descriptionLabel.textColor = descLabelTextColor
        }
        
        if self.actionButtonBackgroundColor != nil {
            self.actionButton.backgroundColor = actionButtonBackgroundColor
        }
    }
    
    func animateIn() {
        self.layoutIfNeeded()
        
        self.bottomConstraint.constant = 0
        UIView.animateWithDuration(1.2, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseOut,  animations: { () -> Void in
            self.layoutIfNeeded()
            },
            completion: { (completed) -> Void in
            }
        )
    }
    
    func automaticDismissSetup(duration: SnackbarDuration) {
        delay(Double(duration.rawValue)) { () -> () in
            self.bottomConstraint.constant = 90
            UIView.animateWithDuration(1.2, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.7, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
                self.layoutIfNeeded()
                }, completion: { (completed) -> Void in
                    self.removeFromSuperview()
                }
            )
        }
        
    }
    
    func doneTapped() {
        if self.buttonClickedClosure != nil {
            self.buttonClickedClosure!()
        }
    }
}

