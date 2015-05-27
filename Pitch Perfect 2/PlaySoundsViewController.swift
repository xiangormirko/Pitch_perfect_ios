//
//  PlaySoundsViewController.swift
//  Pitch Perfect 2
//
//  Created by MIRKO on 5/26/15.
//  Copyright (c) 2015 XZM. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
            var filePathUrl = NSURL.fileURLWithPath(filePath)
            audioPlayer = AVAudioPlayer(contentsOfURL: filePathUrl , error: nil)
            audioPlayer.enableRate = true
        } else {
            println("the filePath is empty")
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playTime(playingRate: Float) {
        audioPlayer.stop()
        audioPlayer.rate = playingRate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()

    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        playTime(2.0)
    }

    @IBAction func playSlowAudio(sender: UIButton) {
        playTime(0.5)
    }
    
    
    @IBAction func stopButton3(sender: UIButton) {
        audioPlayer.stop()
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
