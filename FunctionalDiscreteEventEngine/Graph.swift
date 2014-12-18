//
//  Graph.swift
//  FunctionalDiscreteEventEngine
//
//  Created by Austin Tooley on 12/2/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import Foundation

/*
* Graph holds all of the necessary information to run the simulation engine
*
* MainPath - holds an array of Actions which will be the standard control path
*
* alternateMap - A map/dictionary where the key is an Action found in the mainPath
* and the value is an array of alternate Actions to be performed
*
* entities - An array of Entity, which the actions will be performed on
*/
struct Graph {
    var mainPath = [Action]()
    var alternateMap = [Action : [Action]]() //value is of alts
    var entities = [Entity]()
}

/*
* Generates an array of Actions from structs
*/
func buildGraphlet(structs:(Entity, NSUUID)->(Entity, Bool)...) -> [Action] {
    var actions = [Action]()
    for aStruct in structs {
        actions.append(Action(behavior: aStruct))
    }
    
    return actions
}