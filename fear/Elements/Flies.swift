//
//  Fly.swift
//  fear
//
//  Created by Faridho Luedfi on 21/05/19.
//  Copyright © 2019 ridolud. All rights reserved.
//

import UIKit

class Flies: UIView {
    
    let numberOfFlies: Int = 5
    
    var flies: [UIView] = []
    
    override func didMoveToSuperview() {
        clipsToBounds = true
        
        backgroundColor = .clear //.init(white: 1, alpha: 0.2)

        self.setAnchor(top: nil, leading: nil, bottom: superview?.bottomAnchor, trailing: nil,padding: .init(top: 20, left: 0, bottom: 200, right: 0), size: .init(width: 100, height: 220))
        self.setCenterX(toView: superview!)
        
        initFlies()
        
    }
    
    func initFlies() {
        for _ in 1...numberOfFlies {
            let fly = UIView()
            addSubview(fly)
            fly.setAnchor(top: nil, leading: nil, bottom: nil, trailing: nil, size: .init(width: 3, height: 3))
            fly.setCenter(toView: self)
            fly.backgroundColor = .black
            fly.layer.cornerRadius = 1.5
            fly.layer.masksToBounds = true
            flies.append(fly)
        }
    }
    
    @objc func startAnimation() {
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDelay(0)
        UIView.setAnimationCurve(.easeInOut)
        UIView.setAnimationDuration(0.15)
        
        for n in 0...(numberOfFlies - 1) {
            flies[n].layoutIfNeeded()
            let randomPoint = grabRandomPoint(from: self, offsetX: 0)
            flies[n].center = randomPoint
        }

        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStop(#selector(self.startAnimation))
        UIView.commitAnimations()

    }

}
