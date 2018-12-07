//
//  ViewController.swift
//  QRReader
//
//  Created by Pratheeksha Ravindra Naik on 11.11.2018.
//  Copyright © 2018. All rights reserved.
//

import UIKit
import os.log
import AVFoundation

class QRViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    @IBOutlet weak var square: UIImageView!
    
    var video = AVCaptureVideoPreviewLayer()
    
    var storedN : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Creating session
        let session = AVCaptureSession()
        
        //Define capture devcie - old original code
//        let captureDevice = AVCaptureDevice.default(for: .video)
//
//        do
//        {
//            //The fault with the code..
//            let input = try AVCaptureDeviceInput(device: captureDevice!)
//            session.addInput(input)
//        }
//        catch
//        {
//            print ("ERROR")
//        }
        
      // let captureDevice = AVCaptureDevice.default(for: .video)
        var captureDevice: AVCaptureDevice!
        let captureDeviceInput: AVCaptureDeviceInput?
        do {
        captureDeviceInput = try AVCaptureDeviceInput(device: captureDevice)
      
        if let captureDeviceInput = captureDeviceInput
        {
            if session.canAddInput(captureDeviceInput) {
                session.addInput(captureDeviceInput)
            }
        }
        }
        catch
        {
            // Do something for a nil result (or nothing, if reasonable)
            print("Error")
        }
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        
        self.view.bringSubviewToFront(square)
        
        session.startRunning()
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        if metadataObjects != nil && metadataObjects.count != 0
        {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObject.ObjectType.qr
                {
                    
                   if object.stringValue == "0001"
                   {
                    
                    let alert = UIAlertController(title: "QR Code", message: "Marlery & Me", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert:UIAlertAction) -> Void in
                        self.performSegue(withIdentifier: "showDetails", sender: self)
//                        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//                                        if segue.identifier == "existingDetails"
//                                        {
//                                            self.storedN = "1"
//                                          let viewController = segue.destination as! DisplayBookDetaisViewController
//                                            viewController.n = self.storedN
//                                        }
//                                    }
                        
                    }))
                    
                    present(alert, animated: true, completion: nil)
                   }
                    else if object.stringValue == "0002"
                   {
                    let alert = UIAlertController(title: "QR Code", message: "Five point someone", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert:UIAlertAction) -> Void in
                        self.performSegue(withIdentifier: "existingDetails", sender: self)
//                        func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
//                            if segue!.identifier == "existingDetails" {
//                                let viewController:DisplayBookDetaisViewController = segue!.destination as! DisplayBookDetaisViewController
//                                viewController.n = "2"
//
//                            }
//
//                        }
////                        func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
////                            if segue.identifier == "existingDetails"
////                            {
////                                self.storedN = "2"
////                                let viewController = segue.destination as! DisplayBookDetaisViewController
////                                viewController.n = self.storedN
////                            }
////                        }
                    }))
                    
                    present(alert, animated: true, completion: nil)
                    
                   }
                    else
                   {
                    let alert = UIAlertController(title: "QR Code", message: "Book not found", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Retake", style: .default, handler: nil))
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (alert:UIAlertAction) -> Void in
                        self.performSegue(withIdentifier: "addDetails", sender: self)
                    }))
                    
                    present(alert, animated: true, completion: nil)
                    }
                    
                }
                }
            }
        }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


