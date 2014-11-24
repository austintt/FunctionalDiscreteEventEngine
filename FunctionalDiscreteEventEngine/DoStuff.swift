//
//  DoStuff.swift
//  FunctionalDiscreteEventEngine
//
//  Created by Austin Tooley on 11/13/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import Foundation

func doGraph(thingToActOn: Entity, var nextActions: [(Entity) -> (Entity)]?, alternateMap: [(Entity) -> (Entity) : [(Entity) -> (Entity)]]?) -> (Entity) {
    
    //generate UUID
    let uuid = NSUUID().UUIDString
    
    
    //check for failure
    if thingToActOn.failPoints != nil {
        if let rollbackTo = thingToActOn.failPoints?.last {
            return (thingToActOn)
        }
    }

    //check for next
    var next = nextActions?.removeAtIndex(0)
    if next != nil {
        
        // Pop first off the array
        let nextFunc = next! as ((Entity) -> (Entity))
        
        //check for altertate
        if let alternateNexts = alternateMap?[next] {
            let alternateNext = alternateNexts.removeAtIndex(0) // Pop first from list
            return alternateNext(thingToActOn, alternateNexts, alternateMap)
        }
        next(thingToActOn, nextActions, alternateMap)
        doGraph(thingToActOn, nextActions, alternateMap)
    }
    //return
    return thingToActOn
}

//func checkForNext() {
//    
//}


struct SimulationEngine {
    /** 
    the var graph is not hashable and cannot be stored in a dictionary
    implementing a Graph struct
    **/
//    var graph: [([(Entity, NSDate) -> (Entity, Bool, Bool)], [(Entity, NSDate) -> (Entity, Bool, Bool)])]?
    var entitiesDictionary: [graph : Entity]?
    var simQueue // = ?
    

    func go(SimulateStartTime: Int) {
        for graph in graphs{
            var entities = entitiesDisctionary[graph]
            for anEntity in entity {
                dispatch_async(simQueue) {
                    doGraph()
                }
            }
        }
    }
}