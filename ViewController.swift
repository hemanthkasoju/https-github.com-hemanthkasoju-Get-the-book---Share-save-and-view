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
    
    @IBAction func loginButton(_ sender: Any) {
        let userEmail = usernameTextField.text;
        let password = passwordTextField.text;
        //Check for empty fields
        if((userEmail?.isEmpty)! || (password?.isEmpty)!)
        {
            displayAlertMessage("All feilds are required.");
            return;
        }
        // Store data
        
        //Dispaly alert message with confirmation
        
        
    }
    
    func displayAlertMessage(_ userMessage: String){
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert);
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
