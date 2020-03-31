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
        setupTableView()
        setupAddToCartButton()
                
        
    }
    fileprivate func setupUI() {
        
        view.backgroundColor = .white
        navigationItem.title = "maxreads"
        
    }
    
    fileprivate func setupAddToCartButton() {
        
        let cart = MCButton(text: "Cart")
        view.addSubview(cart)
        cart.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25).isActive = true
        cart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        cart.addTarget(self, action: #selector(self.handleGoToCart), for: .touchUpInside)
        
    }
    @objc fileprivate func handleGoToCart(){
        
         self.navigationController?.pushViewController(MCCartController(), animated: true)
        
    }

    fileprivate func setupTableView() {
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        tableView.register(MCProductCell.self, forCellReuseIdentifier: "CELL")
        tableView.dataSource = self
        tableView.delegate = self
        
    }
   
}

protocol MCCartProtocol {
    
    func addProductToCart(product: MCProduct)
    func removeProductFromCart(product: MCProduct)
    
}

extension MCProductsController: MCCartProtocol {

    
    
    func addProductToCart(product: MCProduct) {
        //Copying the product for changing the inCart bool value without  it is important.
        guard product.inCart == false else { return }
        var productCopy = product
        productCopy.inCart = true
        
        let indexOfProduct = products.firstIndex { (item) -> Bool in
            item._id == productCopy._id
        }
        
        products[indexOfProduct ?? 0] = productCopy
        self.tableView.reloadData()
        
    }
    
    func removeProductFromCart(product: MCProduct) {
        
        guard product.inCart == true else { return }
        
        var productCopy = product
        productCopy.inCart = false
        
        //Product copy id nin tüm productlar icindeki  item id ile esit olan yerin index ini ver.
        let indexOfProduct = products.firstIndex { (item) -> Bool in
            item._id == productCopy._id
        }
        products[indexOfProduct ?? 0] = productCopy

        self.tableView.reloadData()
        
    }

}

extension MCProductsController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
       
}

extension MCProductsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return products.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! MCProductCell
        cell.selectionStyle = .none
        let product = products[indexPath.row]
        cell.delegate = self
        cell.product = product
        cell.selectionStyle = .none
        
        return cell
        
    }
 
}
