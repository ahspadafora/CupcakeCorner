//
//  Order.swift
//  CupcakeCorner
//
//  Created by Amber Spadafora on 11/13/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import Foundation

class Order: ObservableObject {
    
    static let types = ["vanilla", "chocolate", "rainbow", "strawberry"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
}
