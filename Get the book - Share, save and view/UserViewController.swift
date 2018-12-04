//
//  UserViewController.swift
//  Get the book - Share, save and view
//
//  Created by Pratheeksha Ravindra Naik on 2018-12-03.
//  Copyright © 2018 Hemanth Kasoju. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBAction func savedBooksButton(_ sender: Any) {
        performSegue(withIdentifier: "savedBooks", sender: self)
    }
    
    
    @IBAction func scanBookButton(_ sender: Any) {
        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "savedBooks"
            {
                let viewController = segue.destination as! QRViewController
            }
        }
        //performSegue(withIdentifier: "scanBook", sender: self)
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
