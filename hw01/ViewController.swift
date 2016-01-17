//
//  ViewController.swift
//  hw01
//
//  Created by Jeff Fermon on 1/14/16.
//  Copyright © 2016 Jeff Fermon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: properties
    @IBOutlet var image: UIImageView!
    @IBOutlet var assignmentText: UIStackView!
    var labelHideTimer: NSTimer? = nil
    
    
    //MARK: methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //method to handle actions when tap is detected
    @IBAction func tapDetected(sender: UITapGestureRecognizer) {
        print("got tap")
        
        //toggle text display
        assignmentText.hidden = !assignmentText.hidden;
        
        //reset timer to 3 seconds
        resetLabelTimer()
    }

    //method tohandle actions when pinch detected
    @IBAction func pinchDetected(sender: UIPinchGestureRecognizer) {
        print("got pinch");
        
        //change scale of image
        image.transform = CGAffineTransformScale(image.transform, sender.scale, sender.scale)
        sender.scale = 1
        
        //reset timer to 3 seconds
        resetLabelTimer()
    }
    
    //method to hide label if it is not already hidden
    func hideLabel() {
        print("hide label")
        if !assignmentText.hidden
        {
            assignmentText.hidden = true
        }
    }
    
    //helper method to reset timer
    func resetLabelTimer()
    {
        //check if timer already set
        if let _ = labelHideTimer {
            print("reset timer")
            //turn timer off
            labelHideTimer?.invalidate()
        }
        
        //if text visible, set timer to hide it in 3 seconds
        if !assignmentText.hidden {
            labelHideTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector:"hideLabel", userInfo: nil, repeats: false)
        }
    }
}

