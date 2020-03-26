//
//  ProductController.swift
//  ecommerceIAP
//
//  Created by Erdem Özgür on 26.03.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import UIKit

class MCProductsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupAddToCartButton()
        setupTableView()
        
    }
    fileprivate func setupUI(){
        
        view.backgroundColor = .white
        navigationItem.title = "maxreads"
        
    }
    
    fileprivate func setupAddToCartButton(){
        
    }
    fileprivate func setupTableView(){
        
        let cart = MCButton(text: "Cart")
        view.addSubview(cart)
        
        cart.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        cart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
    }
   


}
