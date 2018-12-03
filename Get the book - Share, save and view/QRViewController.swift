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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Creating session
        let session = AVCaptureSession()
        
        //Define capture devcie
        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do
        {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            session.addInput(input)
        }
        catch
        {
            print ("ERROR")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        
        output.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        
        self.view.bringSubview(toFront: square)
        
        session.startRunning()
    }
    
    func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [Any]!, from connection: AVCaptureConnection!) {
        
        if metadataObjects != nil && metadataObjects.count != 0
        {
            if let object = metadataObjects[0] as? AVMetadataMachineReadableCodeObject
            {
                if object.type == AVMetadataObjectTypeQRCode
                {
                    
                   if object.stringValue == "0001"
                   {
                       performSegue(withIdentifier: "showDetails",sender: self);
                   }
                    else
                   {
                       performSegue(withIdentifier: "existingDetails", sender: self)
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
