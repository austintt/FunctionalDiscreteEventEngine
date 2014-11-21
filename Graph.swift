//
//  Graph.swift
//  FunctionalDiscreteEventEngine
//
//  Created by Austin Tooley on 11/21/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import Foundation

struct graph: Hashable {
    var uuid = NSUUID().UUIDString
    var value = [([(Entity, NSDate) -> (Entity, Bool, Bool)], [(Entity, NSDate) -> (Entity, Bool, Bool)])]?
}

// MARK: Hashable
extension graph: Hashable {
    var hashValue: Int {
        return uuid.hashValue
    }
}

// MARK: Equatable
func ==(lhs: graph, rhs: graph) -> Bool {
    return lhs.uuid == rhs.uuid
}