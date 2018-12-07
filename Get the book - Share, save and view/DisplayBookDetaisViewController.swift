//
//  DisplayBookDetaisViewController.swift
//  Get the book - Share, save and view
//
//  Created by Anil Varma Keerthipati on 2018-11-27.
//  Copyright © 2018 Hemanth Kasoju. All rights reserved.
//

import UIKit

class DisplayBookDetaisViewController: UIViewController {
    var n: String!

    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var publisherName: UILabel!
    @IBOutlet weak var languageName: UILabel!
    @IBOutlet weak var url: UILabel!
    
    
    
    @IBAction func shareTapped(_ sender: Any) {
        
        let activityController = UIActivityViewController(activityItems: [titleName.text!,"Author : ", authorName.text!, "Publisher : ", publisherName.text!, "language :", languageName.text!, "URL for online access : ", url.text!, "Location : Archer Library, University of Regina" ], applicationActivities: nil)
        present(activityController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//            self.titleName.text = "Five"
//            self.authorName.text = "John Grogan"
//            self.languageName.text = "English"
//            self.publisherName.text = "Harper Collins"
//            self.url.text = "wwww.harpercollins.ca/marley"
        
//        else if (n == "2"){
          self.titleName.text = "Five Point Someone"
        self.authorName.text = "Chetan Bhagat"
            self.languageName.text = "English"
          self.publisherName.text = "Rupa Publications"
           self.url.text = "wwww.chetanbhagat.ca/five"
        
    }

    }


