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
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
//            var filePathUrl = NSURL.fileURLWithPath(filePath)
//            
//            
//        } else {
//            println("the filePath is empty")
//        }
        
        audioPlayer  = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl , error: nil)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)

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
    
    func playAudioWithVariablePitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        playTime(2.0)
    }

    @IBAction func playSlowAudio(sender: UIButton) {
        playTime(0.5)
    }
    
    @IBAction func chipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func vaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
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
