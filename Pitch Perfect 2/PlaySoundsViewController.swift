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
    
    func resetPlayer() {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
    }
    
    func playTime(playingRate: Float) {
        audioPlayer.stop()
        audioPlayer.rate = playingRate
        audioPlayer.currentTime = 0.0
        audioPlayer.play()

    }
    
    func playAudioWithVariablePitch(pitch: Float){
        resetPlayer()
        
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
        resetPlayer()
        playTime(2.0)
    }

    @IBAction func playSlowAudio(sender: UIButton) {
        resetPlayer()
        playTime(0.5)
    }
    
    @IBAction func chipmunkAudio(sender: UIButton) {
        resetPlayer()
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func vaderAudio(sender: UIButton) {
        resetPlayer()
        playAudioWithVariablePitch(-1000)
    }
    
    
    @IBAction func stopButton3(sender: UIButton) {
        resetPlayer()
    }

}
