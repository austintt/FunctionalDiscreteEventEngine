//
//  Graph.swift
//  FunctionalDiscreteEventEngine
//
//  Created by Austin Tooley on 12/2/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import Foundation

struct Graph {
    var mainPath = [Action]()
    var alternateMap = [Action : [Action]]() //value is of alts
    var entities = [Entity]()
    
    
}

func buildGraphlet(structs:(Entity, NSUUID)->(Entity, Bool)...) -> [Action] {
    var actions = [Action]()
    for aStruct in structs {
        actions.append(Action(behavior: aStruct))
    }
    
    return actions
}