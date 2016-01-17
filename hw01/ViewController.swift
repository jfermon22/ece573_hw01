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
    var delay = 0
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

    @IBAction func tapDetected(sender: UITapGestureRecognizer) {
        assignmentText.hidden = !assignmentText.hidden;
        print("got tap")
        resetLabelTimer()
    }

    @IBAction func pinchDetected(sender: UIPinchGestureRecognizer) {
        print("got pinch");
        image.transform = CGAffineTransformScale(image.transform, sender.scale, sender.scale)
        sender.scale = 1
        resetLabelTimer()
    }
    
    func hideLabel() {
        if !assignmentText.hidden
        {
            assignmentText.hidden = true
        }

        print("hide label")
    }
    
    func resetLabelTimer()
    {
        labelHideTimer?.invalidate()
         labelHideTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector:"hideLabel", userInfo: nil, repeats: false)
    }
}

