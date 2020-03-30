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
    
    @objc fileprivate func animateOut(){
        
    }
    
    fileprivate func setupViews() {
        
    }
    
    fileprivate func animateIn() {
        
    }
    

    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
    }
    
    
    
}
