//
//  LightEyes.swift
//  fear
//
//  Created by Faridho Luedfi on 23/05/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit
import AVFoundation

class LightEyes: UIView {
    
    let leftEye = UIView()
    let rightEye = UIView()
    
    var audioPlayer = AVAudioPlayer()

    override func didMoveToSuperview() {
        backgroundColor = .clear
        
        setAnchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        addSubview(leftEye)
        
        leftEye.setAnchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil, size: .init(width: 4, height: 4))
        leftEye.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -5).isActive = true
        
        leftEye.backgroundColor = .white
        leftEye.alpha = 0
        
        addSubview(rightEye)
        
        rightEye.setAnchor(top: topAnchor, leading: nil, bottom: nil, trailing: nil, size: .init(width: 4, height: 4)) 
        rightEye.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 5).isActive = true
        
        rightEye.backgroundColor = .white
        
        leftEye.layer.cornerRadius = 2.5
        leftEye.layer.masksToBounds = true
        
        rightEye.layer.cornerRadius = 2.5
        rightEye.layer.masksToBounds = true
        rightEye.alpha = 0
    }

}
