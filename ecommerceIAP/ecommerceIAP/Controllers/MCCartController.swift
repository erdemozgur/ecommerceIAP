//
//  CartController.swift
//  ecommerceIAP
//
//  Created by Erdem Özgür on 26.03.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import UIKit

class MCCartController: UIViewController {
    
    fileprivate let tableView: UITableView = UITableView()
    
    fileprivate let totalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.text = "Total: 0 credits"
        return label
    }()
    
    fileprivate let balanceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.text = "Balance: 0 credits"
        return label
    }()
    
    fileprivate var booksInCart =  [MCProduct]()
    
    fileprivate var balanceCredit: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        curateCart()
        setupUI()
        setupTableView()
        setupCartLabels()
        setupCartButtons()
        
    }
    fileprivate func curateCart() {
        booksInCart = []
        
        for product in products {
            if product.inCart {
                booksInCart.append(product)
                self.cartTotalCredits += 1
            }
        }
        
    }
    
    fileprivate func setupUI() {
        
        view.backgroundColor = .white
        navigationItem.title = "cart"
        
    }
    
    fileprivate func setupTableView(){
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -250).isActive = true
        tableView.register(MCCartCell.self, forCellReuseIdentifier: "CELL")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
    }
    
    fileprivate var cartTotalCredits:Int = 0
    
    fileprivate func setupCartLabels(){
        
        totalLabel.text = "Total: \(self.cartTotalCredits) credits"
        
        let lineOne = UIView()
        lineOne.backgroundColor = .black
        let lineTwo = UIView()
        lineTwo.backgroundColor = .black
        
        lineOne.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineTwo.heightAnchor.constraint(equalToConstant: 1).isActive = true

      let stack = UIStackView(arrangedSubviews: [totalLabel, lineOne, balanceLabel, lineTwo])
        stack.axis = .vertical
        stack.spacing = 30
        view.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 10).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -80).isActive = true
        stack.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20).isActive = true
        stack.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20).isActive = true

 
    }
    fileprivate func setupCartButtons() {
        
         let stackSpacing: CGFloat = 20
         let stackConstants: CGFloat = 20
         let screenWidth: CGFloat = UIScreen.main.bounds.width
         let buyButtonWidth: CGFloat = screenWidth - 108 - stackSpacing - (stackConstants * 2)

         let payButton = MCButton(text: "Pay")
         let buyAnotherCreditButton = MCButton(text: "Buy Another Credit", width: buyButtonWidth)

         let stack = UIStackView(arrangedSubviews: [buyAnotherCreditButton, payButton])
         stack.translatesAutoresizingMaskIntoConstraints = false
         stack.spacing = stackSpacing

         view.addSubview(stack)

         stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
         stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: stackConstants).isActive = true
         stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -stackConstants).isActive = true

         payButton.addTarget(self, action: #selector(handlePay), for: .touchUpInside)
         buyAnotherCreditButton.addTarget(self, action: #selector(handleBuyAnotherCredit), for: .touchUpInside)
        

        
     }

     @objc fileprivate func handlePay() {
         print("trying to pay for books.")
     }

     @objc fileprivate func handleBuyAnotherCredit() {
        let popUp = MCPopup()
        popUp.buyButton.addTarget(self, action: #selector(self.handleBuy), for: .touchUpInside)
        view.addSubview(popUp)
        
    }
    
    @objc func handleBuy() {
        StoreObserver.iapObserver.purchaseCredit { (success) in
            if success {
                self.balanceCredit += 1
                self.balanceLabel.text = "Balance: \(self.balanceCredit) credits"
                print("purchase was successful \(self.balanceCredit)")
                
                
            } else {
                print("purchase was NOT successful")
            }
        }
    }
    

   
}


extension MCCartController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
       
}

extension MCCartController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return booksInCart.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! MCCartCell
        cell.selectionStyle = .none
        let product = booksInCart[indexPath.row]
        cell.product = product
        cell.selectionStyle = .none
        
        return cell
        
    }
    
 
}

