//
//  MCProductCell.swift
//  ecommerceIAP
//
//  Created by Erdem Özgür on 27.03.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import UIKit

class MCProductCell: UITableViewCell {
    
    var delegate: MCCartProtocol?
    
    var product: MCProduct? {
        didSet{
            //modify any view
            guard let product = product else { return }
            productImage.image = UIImage(named: product.imageURL)
            titleLabel.text = product.title
            authorLabel.text = product.author
            if product.inCart {
                creditLabel.text = "added to cart"
                addToCartButton.backgroundColor = .scarletRed
                addToCartButton.setTitle("-", for: .normal)
                addToCartButton.isEnabled = true
            } else {
                addToCartButton.isEnabled = true
                addToCartButton.backgroundColor = .oceanBlue
                addToCartButton.setTitle("+", for: .normal)
                if product.creditPrice > 1 {
                    creditLabel.text = String(product.creditPrice)  + " credits"
                }else {
                    creditLabel.text = String(product.creditPrice)  + " credit"
                }
            }
            ratingLabel.text = String(product.rating) + "/5"
        }
    }
    
    fileprivate let productImage: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "1")) //image literal
        iv.contentMode = .scaleAspectFit
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.text = "Product Title Here"
        return label
    }()
    
    fileprivate let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        label.textColor = .gray
        label.text = "Author Name"
        return label
    }()
    
    fileprivate let creditLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.text = "1 Credit"
        return label
    }()
    
    fileprivate let ratingLabel: UILabel = {
         let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.systemFont(ofSize: 13, weight: .bold)
         label.text = "5/5"
         label.textColor = .primaryOne
         return label
     }()

     fileprivate let addToCartButton:UIButton = {
         let button = MCButton(text: "+", width: 25, height: 25, hasShadow: false)
         button.layer.cornerRadius = 12.5
         return button
     }()
    
    @objc fileprivate func handleAddToCart() {
        
        guard let delegate = delegate else { return }
        guard let product = product else { return }
        delegate.addProductToCart(product: product)
        
    }
    @objc fileprivate func removeHandleFromCart() {
        
        guard let delegate = delegate else { return }
        guard let product = product else { return }
        
        delegate.removeProductFromCart(product: product)
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        self.addToCartButton.addTarget(self, action: #selector(handleAddToCart), for: .touchUpInside)
        self.addToCartButton.addTarget(self, action: #selector(removeHandleFromCart), for: .touchUpInside)
        


        
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
