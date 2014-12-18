//
//  Entity.swift
//  ConceptEventEngine
//
//  Created by Austin Tooley on 10/28/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import Foundation
/*
* Entity - what the action will be performed on
* This incarnation of Entity has a number to identify it, 
* an array of failpoints, and a variable for tracking how many
* times it has passed througha  certain action.
*/
struct Entity {
    var number: Int
    var failPoints: [(Int, [Action]?, [Action : [Action]]?)]?
    var numOfActionsPerformed: Int
    
    init(number: Int){
        self.number = number
        self.failPoints = nil
        self.numOfActionsPerformed = 0
    }
}