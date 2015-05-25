//
//  ViewController.swift
//  Pitch Perfect 2
//
//  Created by MIRKO on 5/25/15.
//  Copyright (c) 2015 XZM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordButton(sender: UIButton) {
        recordingLabel.hidden = false
        stopButton.hidden = false
    }
    

    @IBAction func stopB(sender: UIButton) {
        recordingLabel.hidden = true
    }
}

