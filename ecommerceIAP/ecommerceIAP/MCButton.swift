//
//  MCButton.swift
//  ecommerceIAP
//
//  Created by Erdem Özgür on 26.03.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import UIKit

class MCButton: UIButton {
    
    init(text: String, width: CGFloat = 108, height: CGFloat = 45 , hasShadow: Bool = true) {
        super.init(frame: .zero)
        
        setupConstraints(width, height)
        hasShadow ? setupShadow(width, height) : ()
        setupStyles(text)
        
        
    }
    
    fileprivate func setupShadow(_ width: CGFloat, _ height: CGFloat) {
        
        let shadowSize: CGFloat = 20
        let contactRect = CGRect(x: 0, y: height - (shadowSize * 0.6), width: width, height: shadowSize)
        layer.shadowPath = UIBezierPath(ovalIn: contactRect).cgPath
        layer.shadowRadius  = 10
        layer.shadowOpacity = 0.8
        layer.shadowColor = UIColor.primaryOne.cgColor
        
    }
    
    fileprivate func setupConstraints(_ width: CGFloat,_ height: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        
    }
    
    fileprivate func setupStyles(_ text: String){
        
        backgroundColor = .primaryOne
        setTitle(text, for: .normal)
        layer.cornerRadius = 22.5
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        
    }

    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
}


