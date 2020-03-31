//
//  MCPopup.swift
//  ecommerceIAP
//
//  Created by Max Nelson on 6/23/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

class MCPopup:UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        animateIn()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateOut)))
    }
    
    fileprivate var effect:UIVisualEffect = UIBlurEffect(style: .prominent)
    fileprivate lazy var blurView:UIVisualEffectView = UIVisualEffectView(effect: effect)
    
    fileprivate let container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        return view
    }()
    
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "buy another credit"
        label.textAlignment = .center
        label.numberOfLines = 2
        return label
    }()
    
    fileprivate let oneCreditLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "one credit"
        label.textAlignment = .center
        return label
    }()
    
    fileprivate let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "$4.99"
        label.textAlignment = .center
        return label
    }()
    
    let buyButton = MCButton(text: "Buy")
    
    let oneImageView: UIImageView = {
        let oneImage = UIImage(named: "creditsymbol")
        let iv = UIImageView(image: oneImage)
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
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
        
        let arrayOfViews:[UIView] = [
            titleLabel,
            oneImageView,
            oneCreditLabel,
            priceLabel,
            buyButton
        ]
        let stack = UIStackView(arrangedSubviews: arrayOfViews)
        stack.axis = .vertical
        stack.distribution = .equalCentering
        stack.spacing = 20
        
        container.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        stack.widthAnchor.constraint(equalToConstant: 108).isActive = true
        stack.topAnchor.constraint(equalTo: container.topAnchor, constant: 50).isActive = true
        stack.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -50).isActive = true
        
        oneImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
     
    }
    


    
    fileprivate func animateIn() {
        self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
        self.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
            self.container.transform = .identity
            self.alpha = 1
        })
    }
    
    @objc fileprivate func animateOut() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2, options: .curveEaseOut, animations: {
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            self.alpha = 0
        }) { (complete) in
            if complete {
                self.removeFromSuperview()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
