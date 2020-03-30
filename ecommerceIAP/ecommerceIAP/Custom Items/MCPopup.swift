//
//  MCPopup.swift
//  ecommerceIAP
//
//  Created by Erdem Özgür on 30.03.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import UIKit


class MCPopup: UIView {
    
    //Properties
    
    //IUVisualEffect
    fileprivate var effect: UIVisualEffect = UIBlurEffect(style: .prominent)
    fileprivate lazy var blurView: UIVisualEffectView = UIVisualEffectView(effect: effect)
    
    fileprivate let container: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        
        return view
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        animateIn()
        animateOut()
        addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(animateOut)))

        
    }

    
    
    
    
    fileprivate func setupViews() {
        
        let screenFrame = UIScreen.main.bounds
        self.frame = screenFrame
        blurView.frame = screenFrame
        
        self.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        self.addSubview(blurView)
        blurView.contentView.addSubview(container)
        
        container.heightAnchor.constraint(equalTo: blurView.heightAnchor, multiplier: 0.45).isActive = true
        container.widthAnchor.constraint(equalTo: blurView.widthAnchor, multiplier: 0.7).isActive = true
        container.centerYAnchor.constraint(equalTo: blurView.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: blurView.centerXAnchor).isActive = true

        
        
    }
    
    fileprivate func animateIn() {
        
        
    }
    
    @objc fileprivate func animateOut(){
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
            
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.alpha = 0
            
        }) { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
    }
    

    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
    
    
}
