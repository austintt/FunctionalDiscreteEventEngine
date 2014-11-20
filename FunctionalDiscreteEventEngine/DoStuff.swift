//
//  DoStuff.swift
//  FunctionalDiscreteEventEngine
//
//  Created by Austin Tooley on 11/13/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import Foundation

func doGraph(thingToActOn: Entity, nextActions: [T]?, alternateMap: [T : [T]]?) -> (Entity?, String?) {
    
    //generate UUID
    let uuid = NSUUID().UUIDString
    
    //code to  execute
    //closure?
    
    
    //check for failure
    if thingToActOn.failPoints != nil {
        if let rollbackTo = thingToActOn.failPoints?.last {
            return (nil, rollbackTo)
        }
    }


    //check for next
    if let next = nextActions?.removeAtIndex(0) {
        // Pop first off the array
        
        //check for altertate
        if let alternateNexts = alternateMap?[next] && alternateShouldRun {
            let alternateNexts. // Pop first from list
            return alternateNext(thingToActOn, alternateNexts, alternateMap)
        }
        next(thingToActOn, nextActions, alternateMap)
    }
    //return
    return thingToActOn
}

func checkForNext() {
    
}


func SimulationEngine() {
    var graph: [([(Entity, NSDate) -> (Entity, Bool, Bool)], [(Entity, NSDate) -> (Entity, Bool, Bool)])]?
    var entitiesDictionary :[graph: Entity]?
    var simQueue
}

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
