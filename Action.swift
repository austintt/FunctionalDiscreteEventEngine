//
//  Graph.swift
//  FunctionalDiscreteEventEngine
//
//  Created by Austin Tooley on 11/21/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import Foundation

/*
* Action struct holds a closure and is hashable
* to be stored in a dictionary
*/
struct Action: Hashable {
    var uuid: NSUUID
    var behavior: (Entity, NSUUID) -> (Entity, Bool)
    
    init(behavior: (Entity, NSUUID)->(Entity, Bool)) {
        self.uuid = NSUUID()
        self.behavior = behavior
    }
    
    func go(anEntity: Entity) -> (Entity, Bool){
        return self.behavior(anEntity, self.uuid)
    }

}

// MARK: Hashable
extension Action: Hashable {
    var hashValue: Int {
        return uuid.hashValue
    }
}

// MARK: Equatable
func ==(lhs: Action, rhs: Action) -> Bool {
    return lhs.uuid == rhs.uuid
}