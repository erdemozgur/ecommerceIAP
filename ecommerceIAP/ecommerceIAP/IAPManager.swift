//
//  IAPManager.swift
//  ecommerceIAP
//
//  Created by Erdem Özgür on 30.03.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import UIKit
import StoreKit

typealias CompletionHandler = (_ success: Bool) -> ()


class StoreObserver: NSObject, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    
    var transactionComplete: CompletionHandler?
    var isAuthorizedForPayments: Bool {
        return SKPaymentQueue.canMakePayments()
    }
    
    var products = [SKProduct]()
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        if response.products.count > 0 {
            print(response.products, response,products.debugDescription)
            products = response.products
        }
        
    }

    
    static var iapObserver = StoreObserver()
    
    var productsRequest: SKProductsRequest!
    let IAP_CREDIT_PRODUCT = "99700101"
    
    func fetchProducts() {
        
        let productIds = NSSet(object: IAP_CREDIT_PRODUCT) as! Set<String>
        productsRequest = SKProductsRequest(productIdentifiers: productIds)
        productsRequest.delegate = self
        productsRequest.start()
        
    }
    
    func purchaseCredit(completion: @escaping CompletionHandler) {
        
        if SKPaymentQueue.canMakePayments() && products.count > 0 {
            
            transactionComplete = completion
            let creditProduct = products[0]
            let payment = SKPayment(product: creditProduct)
            SKPaymentQueue.default().add(payment)
            
        } else {
            print("you can not make payments on this device or there are simply no product to charge the user for")
            completion(false)
        }
        
        
    }
    //Initialize the store observer.
    override init() {
        super.init()
        //Other initialization here.
    }

    //Observe transaction updates.
    func paymentQueue(_ queue: SKPaymentQueue,updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            
            switch transaction.transactionState {
                
            case .purchased:
                if transaction.payment.productIdentifier == IAP_CREDIT_PRODUCT {
                    transactionComplete?(true)
                }
                SKPaymentQueue.default().finishTransaction(transaction)
            case .failed:
                SKPaymentQueue.default().finishTransaction(transaction)
                transactionComplete?(false)
            case .restored:
                SKPaymentQueue.default().finishTransaction(transaction)
            case .purchasing:
                print("state is purchasing")
            default:
                print("default case")
                print(transaction.transactionState.rawValue)
                transactionComplete?(false)
            }
            
        }
    }
}
