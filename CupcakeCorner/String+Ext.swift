//
//  String+Ext.swift
//  CupcakeCorner
//
//  Created by Amber Spadafora on 11/13/20.
//  Copyright © 2020 Amber Spadafora. All rights reserved.
//

import Foundation

extension String {
    var isBlank: Bool {
        return allSatisfy({ $0.isWhitespace })
    }
}
