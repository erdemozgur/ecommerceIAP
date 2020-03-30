//
//  MCPopup.swift
//  ecommerceIAP
//
//  Created by Erdem Özgür on 30.03.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import UIKit


class MCPopup: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        animateIn()
        addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(animateOut)))

        
    }
    //IUVisualEffect
    fileprivate var effect: UIVisualEffect = UIBlurEffect(style: .prominent)
    fileprivate lazy var blurView: UIVisualEffectView = UIVisualEffectView(effect: effect)
    
    
    fileprivate func setupViews() {
        
        let screenFrame = UIScreen.main.bounds
        self.frame = screenFrame
        blurView.frame = screenFrame
        self.addSubview(blurView)
        
    }
    
    fileprivate func animateIn() {
        
    }
    
    @objc fileprivate func animateOut(){
        
    }
    

    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
    
    
}
