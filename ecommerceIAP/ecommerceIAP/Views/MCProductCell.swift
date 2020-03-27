//
//  MCProductCell.swift
//  ecommerceIAP
//
//  Created by Erdem Özgür on 27.03.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import UIKit

class MCProductCell: UITableViewCell {
    
    let productImage: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "1")) //image literal
        iv.contentMode = .scaleAspectFit
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Product Title Here"
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .gray
        label.text = "Author Name"
        return label
    }()
    
    let creditLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.text = "1 Credit"
        return label
    }()
    
    let ratingLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
         label.text = "5/5"
         label.textColor = .primaryOne
         return label
     }()

     let addToCartButton:UIButton = {
         let button = MCButton(text: "+", width: 25, height: 25, hasShadow: false)
         button.layer.cornerRadius = 12.5
         return button
     }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        
    }
    
    fileprivate func setupUI() {
        
        contentView.addSubview(productImage)
        
        productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        productImage.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8).isActive = true
        productImage.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8).isActive = true
        productImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, authorLabel, creditLabel])
        stackView.setCustomSpacing(20, after:  authorLabel)
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        let controlsStack = UIStackView(arrangedSubviews: [ratingLabel, addToCartButton])
        controlsStack.spacing = 30
        controlsStack.axis = .vertical
        controlsStack.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(controlsStack)
        
        
        stackView.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 10).isActive = true
         stackView.trailingAnchor.constraint(equalTo: controlsStack.leadingAnchor, constant: -10).isActive = true
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        
        controlsStack.leadingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 10).isActive = true
        controlsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        controlsStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
