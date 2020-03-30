//
//  MCProduct.swift
//  ecommerceIAP
//
//  Created by Erdem Özgür on 27.03.2020.
//  Copyright © 2020 Erdem Özgür. All rights reserved.
//

import Foundation


struct MCProduct {
    
    var _id, creditPrice, rating: Int
    var title, author, imageURL: String
    let inCart: Bool
    
    //inCard
    //owned
    
}

var products:[MCProduct] = [MCProduct(_id: 0, creditPrice: 1, rating: 5, title: "Can't Hurt Me", author: "David Goggins", imageURL: "0",inCart: true),
    MCProduct(_id: 1, creditPrice: 1, rating: 4, title: "The Alchemist", author: "Paulo Author", imageURL: "1", inCart: true),
    MCProduct(_id:21, creditPrice: 2, rating: 3, title: "12 Rules For Life", author: "Jordan B. Peterson", imageURL: "2", inCart: false)
]
