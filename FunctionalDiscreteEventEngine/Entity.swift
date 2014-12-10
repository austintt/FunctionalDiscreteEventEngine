//
//  Entity.swift
//  ConceptEventEngine
//
//  Created by Austin Tooley on 10/28/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import Foundation

struct Entity {
    var number: Int
    var failPoints: [NSUUID]?
    
    init(number: Int){
        self.number = number
        self.failPoints = nil
    }
}