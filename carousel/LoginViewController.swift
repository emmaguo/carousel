//
//  LoginViewController.swift
//  carousel
//
//  Created by Emma Guo on 2/14/16.
//  Copyright © 2016 emmaguo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signinIndicator: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -140
        
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "keyboardWillShow:",
            name: UIKeyboardWillShowNotification,
            object: nil)
        NSNotificationCenter.defaultCenter().addObserver(
            self,
            selector: "keyboardWillHide:",
            name: UIKeyboardWillHideNotification,
            object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        buttonParentView.frame.origin.y = buttonInitialY
        scrollView.contentOffset.y = 0
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
    }
    
    func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
        }
        alertController.addAction(OKAction)
        presentViewController(alertController, animated: true) {}
    }
    
    @IBAction func didPressSignin(sender: UIButton) {
        if emailField.text!.isEmpty {
            presentAlert(
                "Email Required",
                message: "Please enter your email address")
        } else if passwordField.text!.isEmpty{
            presentAlert(
                "Password Required",
                message: "Please enter your password")
        } else {
            signinIndicator.startAnimating()
            delay(2, closure: { () -> () in
                self.signinIndicator.stopAnimating()
                if self.emailField.text == "emma" && self.passwordField.text == "123" {
                    self.performSegueWithIdentifier("tutorialSegue", sender: nil)
                } else {
                    self.presentAlert(
                        "Sign In Failed",
                        message: "Incorret email or password.")
                }
            })
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
