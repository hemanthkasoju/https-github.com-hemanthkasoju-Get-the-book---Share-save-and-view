//
//  ViewController.swift
//  Get the book - Share, save and view
//
//  Created by Pratheeksha Ravindra Naik on 2018-12-03.
//  Copyright © 2018 Hemanth Kasoju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var usernameTextField: UITextField!
    
   @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginButton(_ sender: AnyObject) {
        
        let userEmail = usernameTextField.text;
        let password = passwordTextField.text;
        
        //Check for empty fields
        if((userEmail?.isEmpty)! || (password?.isEmpty)!)
        {
            displayAlertMessage("All feilds are required.");
            return;
        }
        
        
        
        // Storing the data
    let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
    let passwordStored = UserDefaults.standard.string(forKey: "password")
        
    if(userEmail == "admin")
    {
        if(password == "admin")
        {
            //Login successful
            UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
            UserDefaults.standard.synchronize();
            performSegue(withIdentifier: "scanBook", sender: self)
        }
    }
        else
    { displayAlertMessage("Enter correct credentials.");
        return;
        }
        
}
    
    func displayAlertMessage(_ userMessage: String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "userView"
            {
                let viewController = segue.destination as! QRViewController
            }
        }
       // performSegue(withIdentifier: "userView", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Dismiss the keyboard when the user taps anywhere on the screen
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
