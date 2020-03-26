//
//  ProductController.swift
//  ecommerceIAP
//
//  Created by Erdem Özgür on 26.03.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import UIKit

class MCProductsController: UIViewController {
    
    fileprivate let tableView = UITableView()
    

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
        
        let cart = MCButton(text: "Cart")
        view.addSubview(cart)
        
        cart.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        cart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
    }
    fileprivate func setupTableView(){
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true

        
    }
   


}
