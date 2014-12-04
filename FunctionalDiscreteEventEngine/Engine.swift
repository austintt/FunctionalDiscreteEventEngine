//
//  DoStuff.swift
//  FunctionalDiscreteEventEngine
//
//  Created by Austin Tooley on 11/13/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import Foundation

func doAction(var thingToActOn: Entity, var nextActions: [Action]?, alternateMap: [Action : [Action]]?) -> (Entity) {
    
    //generate UUID
    let uuid = NSUUID().UUIDString
    
    
    //check for failure
    if thingToActOn.failPoints != nil {
        if let rollbackTo = thingToActOn.failPoints?.last {
            return (thingToActOn)
        }
    }
    
    //check for next
    var next: Action?
    if nextActions?.count > 0 {
        next = nextActions?.removeAtIndex(0)
    }
    
    if next != nil {
        
        // Pop first off the array
        let nextFunc = next!
        
        //check for altertate
        var alternateNexts = alternateMap?[next!]
        if alternateNexts != nil {
            let alternateNext = alternateNexts!.removeAtIndex(0) // Pop first from list
            thingToActOn = alternateNext.go(thingToActOn)
        }
        else {
            thingToActOn = next!.go(thingToActOn)
        }
        doAction(thingToActOn, nextActions, alternateMap)
    }
    //return
    return thingToActOn
}


struct SimulationEngine {
    var graphs = [Graph]()
    var simQueue = dispatch_queue_create("com.simFunc.engine", DISPATCH_QUEUE_CONCURRENT)
    
    func go(SimulateStartTime: Int) {
        for aGraph in graphs {
            var entities = aGraph.entities
            for anEntity in entities {
                dispatch_async(simQueue) {
                    let finalEntity = doAction(anEntity, aGraph.mainPath, aGraph.alternateMap)
                }
            }
        }
        
    }
}