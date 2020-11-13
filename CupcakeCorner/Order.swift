//
//  Order.swift
//  CupcakeCorner
//
//  Created by Amber Spadafora on 11/13/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import Foundation

class ObservableOrder: ObservableObject {
    @Published var order: Order
    
    init(order: Order) {
        self.order = order
    }
}

struct Order: Codable {
    
    static let types = ["vanilla", "chocolate", "rainbow", "strawberry"]
    
//    enum CodingKeys: CodingKey {
//        case type, quantity, addSprinkles, extraFrosting, name, streetAddress, city, zip
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//
//        try container.encode(type, forKey: .type)
//        try container.encode(quantity, forKey: .quantity)
//
//        try container.encode(extraFrosting, forKey: .extraFrosting)
//        try container.encode(addSprinkles, forKey: .addSprinkles)
//
//        try container.encode(name, forKey: .name)
//        try container.encode(streetAddress, forKey: .streetAddress)
//
//        try container.encode(city, forKey: .city)
//        try container.encode(zip, forKey: .zip)
//    }
    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        type = try container.decode(Int.self, forKey: .type)
//        quantity = try container.decode(Int.self, forKey: .quantity)
//
//        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
//        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
//
//        name = try container.decode(String.self, forKey: .name)
//        streetAddress = try container.decode(String.self, forKey: .streetAddress)
//        city = try container.decode(String.self, forKey: .city)
//        zip = try container.decode(String.self, forKey: .zip)
//    }
    
    init(){}
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        
        return (!name.isEmpty && !name.isBlank)
            && (!streetAddress.isEmpty && !streetAddress.isBlank)
            && (!city.isEmpty && !city.isBlank)
            && (!zip.isEmpty && !zip.isBlank)
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += (Double(type) / 2)
        if extraFrosting {
            cost += Double(quantity)
        }
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        return cost
    }
    
    
    
}
