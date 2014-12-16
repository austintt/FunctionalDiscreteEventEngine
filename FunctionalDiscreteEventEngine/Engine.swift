//
//  DoStuff.swift
//  FunctionalDiscreteEventEngine
//
//  Created by Austin Tooley on 11/13/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import Foundation

func doAction(actionIndex: Int, var thingToActOn: Entity, var nextActions: [Action]?, alternateMap: [Action : [Action]]?) -> (Entity) {
    
    //check for failure - TODO: BUG HERE I THINK
    if thingToActOn.failPoints != nil {
        if let (rollbackIndex, rollbackToActions, rollbackToAlts) = thingToActOn.failPoints?.last {
            println("Fail check")
            doAction(rollbackIndex, thingToActOn, rollbackToActions, rollbackToAlts)
        }
    }
    
    //check for next
    var next: Action?
    var failed = false
    if nextActions?.count > actionIndex {
        
        next = nextActions?[actionIndex]
        
        if next != nil {
            let nextFunc = next!
            
            //check for altertate
            var alternateNexts = alternateMap?[nextFunc]
            
            if alternateNexts != nil {
                let alternateNext = alternateNexts![actionIndex]
                (thingToActOn, failed) = alternateNext.go(thingToActOn)
                if failed {
                    var rollbackList = thingToActOn.failPoints
                    if rollbackList == nil {
                        thingToActOn.failPoints = [(actionIndex, nextActions, alternateMap)]
                    }
                    else {
                        let toBeAppended = (actionIndex, nextActions, alternateMap)
                        rollbackList!.append(toBeAppended)
                    }
                }
                nextActions = alternateNexts
            }
            else {
                (thingToActOn, failed) = nextFunc.go(thingToActOn)
                if failed {
                    var rollbackList = thingToActOn.failPoints
                    if rollbackList == nil {
                        thingToActOn.failPoints = [(actionIndex, nextActions, alternateMap)]
                    }
                    else {
                        let toBeAppended = (actionIndex, nextActions, alternateMap)
                        rollbackList!.append(toBeAppended)
                    }
                }
                
            }
            let nextIndex = actionIndex + 1
            thingToActOn = doAction(nextIndex, thingToActOn, nextActions, alternateMap)
        }
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
                    let finalEntity = doAction(0, anEntity, aGraph.mainPath, aGraph.alternateMap)
                }
            }
        }
    }
}