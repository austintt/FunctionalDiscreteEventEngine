//
//  Graph.swift
//  FunctionalDiscreteEventEngine
//
//  Created by Austin Tooley on 11/21/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import Foundation

struct Action: Hashable {
    var uuid: NSUUID
    var behavior: (Entity, NSUUID) -> (Entity)
    
    init(behavior: (Entity, NSUUID)->(Entity)) {
        self.uuid = NSUUID()
        self.behavior = behavior
    }
    
    func go(anEntity: Entity) -> Entity{
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