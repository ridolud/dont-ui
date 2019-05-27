//
//  ViewController.swift
//  fear
//
//  Created by Faridho Luedfi on 20/05/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let composer = Composer()
    

    @IBOutlet weak var layer0: UIImageView!
    @IBOutlet weak var layer1: UIImageView!
    @IBOutlet weak var layer2: UIImageView!
    @IBOutlet weak var layer3: UIImageView!
    @IBOutlet weak var layer4: UIImageView!
    @IBOutlet weak var layer5: UIImageView!
    @IBOutlet weak var layer6: UIImageView!
    @IBOutlet weak var layer7: UIImageView!
    @IBOutlet weak var layer8: UIImageView!
    
    @IBOutlet weak var monster: UIImageView!
    
    let overlay = UIView()
    
    let flies = Flies()
    let lightEyes = LightEyes()
    
    var isTapGostFirst:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
        overlay.fillSuperview()
        overlay.backgroundColor = .black
        
        layer7.applyMotionEffect(2)
        layer6.applyMotionEffect(4)
        layer5.applyMotionEffect(6)
        layer4.applyMotionEffect(10)
        layer3.applyMotionEffect(20)
        layer2.applyMotionEffect(30)
        layer1.applyMotionEffect(40)
        
        composer.since1Play()
        
        view.addSubview(flies)
        flies.addSubview(lightEyes)
        
        view.addSubview(overlay)
        overlay.fillSuperview()
        overlay.backgroundColor = .black
        
        animateOverlay()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tappingAction(_:)))
        flies.addGestureRecognizer(tap)
        
    }
    
    @IBAction func cutingRope(_ sender:
        UISwipeGestureRecognizer) {
        if isTapGostFirst == true {
            jumpScare()
            composer.since3Play()
        }
    }
    
    @objc func tappingAction(_ sender: UITapGestureRecognizer) {
        
        if isTapGostFirst == false {
        lightEyes.rightEye.alpha = 1
        lightEyes.leftEye.alpha = 1
        composer.since2Play()
        isTapGostFirst = true
        }else{
            //let originalTransform = layer0.transform
//            print("okokok")
//            UIView.animate(withDuration: 0.2, delay: 2.7, options: [.repeat, .curveEaseInOut], animations: {
//                self.layer0.transform.translatedBy(x: 0, y: 300)
//            }, completion: nil)
        }
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
    }
    
    override func viewDidLayoutSubviews() {
        flies.startAnimation()
    }
    
    func jumpScare() {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseIn], animations: {
            self.flies.isHidden = true
            self.monster.alpha = 1
            self.monster.frame.size = self.view.bounds.size
            self.monster.frame.origin.y = self.view.frame.origin.y
            self.monster.frame.origin.x = self.view.frame.origin.x
        }, completion: {(_) -> Void in
            self.restartAll()
        })
    }
    
    func restartAll() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.overlay.alpha = 1
            self.monster.alpha = 0
            self.lightEyes.rightEye.alpha = 0
            self.lightEyes.leftEye.alpha = 0
            self.isTapGostFirst = false
            self.flies.isHidden = false
            self.composer.allStop()
            self.composer.since1Play()
            self.animateOverlay()
        }
    }
    
    func animateOverlay() {
        UIView.animate(withDuration: 3, animations: {
            self.overlay.alpha = 0
        })
    
    }
    
    override var shouldAutorotate: Bool {
        return false
    }

}

