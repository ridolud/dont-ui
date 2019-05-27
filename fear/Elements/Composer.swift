//
//  Composer.swift
//  fear
//
//  Created by Faridho Luedfi on 24/05/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import Foundation
import AVFoundation

class Composer {
    
    var fliesSound = AVAudioPlayer()
    
    var horor1 = AVAudioPlayer()
    
    var horor2 = AVAudioPlayer()
    
    var horor3 = AVAudioPlayer()
    
    var scream = AVAudioPlayer()
    
    init() {
        do {
            fliesSound = try AVAudioPlayer(contentsOf: .init(fileURLWithPath: Bundle.main.path(forResource: "flies-sound", ofType: "mp3")!))
            fliesSound.prepareToPlay()
            
            horor1 = try AVAudioPlayer(contentsOf: .init(fileURLWithPath: Bundle.main.path(forResource: "horor-1", ofType: "mp3")!))
            horor1.prepareToPlay()
            
            horor2 = try AVAudioPlayer(contentsOf: .init(fileURLWithPath: Bundle.main.path(forResource: "horor-2", ofType: "mp3")!))
            horor2.prepareToPlay()
            
            horor3 = try AVAudioPlayer(contentsOf: .init(fileURLWithPath: Bundle.main.path(forResource: "horor-3", ofType: "mp3")!))
            horor3.prepareToPlay()
            
            scream = try AVAudioPlayer(contentsOf: .init(fileURLWithPath: Bundle.main.path(forResource: "scream2", ofType: "mp3")!))
            scream.prepareToPlay()
        }
        catch {
            print(error)
        }
    }
    
    func playFliesSound() {
        fliesSound.volume = 0.3
        fliesSound.numberOfLoops = -1
        fliesSound.play()
    }
    
    func playhoror1() {
        horor1.volume = 0.4
        horor1.numberOfLoops = -1
        horor1.play()
    }
    
    func playhoror2() {
        horor2.volume = 1
//        horor2.numberOfLoops = -1
        horor2.play()
    }
    
    func playhoror3() {
        horor3.volume = 0.9
        horor3.numberOfLoops = -1
        horor3.play()
    }
    
    func since1Play() {
        playhoror1()
        playFliesSound()
        
    }
    
    func since2Play() {
        horor1.stop()
        playhoror2()
        playhoror3()
    }
    
    func allStop() {
        if fliesSound.isPlaying { fliesSound.stop() }
        if horor1.isPlaying { horor1.stop() }
        if horor2.isPlaying { horor2.stop() }
        if horor3.isPlaying { horor3.stop() }
    }
    
    func since3Play()  {
        allStop()
        scream.play()
    }
    
    
    
}
