//
//  Driver.swift
//  FunctionalDiscreteEventEngine
//
//  Created by Austin Tooley on 12/2/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import Foundation

struct Driver {
    
    //set start time
    let startTime = 1
    
    /* Sets everyting up to stat simulation
    * Needs:
    *       - Main path colsures which will
    *         be turned into actions and set as the 
    *         mainPath in myGraph.
    *       - Enitites which will be put through the simulation
    *
    * Optional:
    *       - Alternate path closures
    */
    func startEngine() {
        var myGraph = Graph()

        //fill entities array
        myGraph.entities = [
            Entity(number: 0),
            Entity(number: 1),
            Entity(number: 2),
            Entity(number: 3),
            Entity(number: 4),
            Entity(number: 5)]

        //fill mainPath array
        myGraph.mainPath = buildGraphlet(
            event0,
            event1,
            event2,
            event3)

        //fill altMap
        myGraph.alternateMap = [myGraph.mainPath[3]: buildGraphlet(
            altEvent0,
            altEvent1,
            altEvent2,
            altEvent3)]

        //put on array
        let graphs = [myGraph]

        //create engine
        var engine = SimulationEngine()
        
        //assign newly formed graph array to engine
        engine.graphs = graphs

        //run engine
        engine.go(startTime)
    }
    
    /*
    * MAIN EVENT CLOSURES
    * Closures must reveive an Entity and a NSUUID while returning
    * an Entity and a Bool, signifying pass or failure within the closure
    */
    
    let event0 = {(anEntity: Entity, uuid: NSUUID) -> (Entity, Bool) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("Main event 0 peformed on entity number \(anEntity.number)")})
        return (anEntity, false)}
    
    let event1 = {(var anEntity: Entity, uuid: NSUUID) -> (Entity, Bool) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("Main event 1 peformed on entity number \(anEntity.number)")})
        
        anEntity.numOfActionsPerformed++
        dispatch_async(dispatch_get_main_queue(), {println("\t\tEntity \(anEntity.number) has been through action1 \(anEntity.numOfActionsPerformed) times")})
        
            //set fail flag for testing
            let randNum = Int(arc4random_uniform(10))
            if (randNum % 5) == 0 {
                println("We failed on entity \(anEntity.number)")
                return (anEntity, true)
            }
        
        return (anEntity, false)}
    
    let event2 = {(anEntity: Entity, uuid: NSUUID) -> (Entity, Bool) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("Main event 2 peformed on entity number \(anEntity.number)")})
        return (anEntity, false)}
    
    let event3 = {(anEntity: Entity, uuid: NSUUID) -> (Entity, Bool) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("Main event 3 peformed on entity number \(anEntity.number)")})
        return (anEntity, false)}
    
    
    /*
    * ALT EVENT CLOSURES
    * Closures must reveive an Entity and a NSUUID while returning
    * an Entity and a Bool, signifying pass or failure within the closure
    */
    let altEvent0 = {(anEntity: Entity, uuid: NSUUID) -> (Entity, Bool) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("\tAlternate event 0 peformed on entity number \(anEntity.number)")})
        return (anEntity, false)}
    
    let altEvent1 = {(anEntity: Entity, uuid: NSUUID) -> (Entity, Bool) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("\tAlternate event 1 peformed on entity number \(anEntity.number)")})
        return (anEntity, false)}
    
    let altEvent2 = {(anEntity: Entity, uuid: NSUUID) -> (Entity, Bool) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("\tAlternate event 2 peformed on entity number \(anEntity.number)")})
        return (anEntity, false)}
    
    let altEvent3 = {(anEntity: Entity, uuid: NSUUID) -> (Entity, Bool) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("\tAlternate event 3 peformed on entity number \(anEntity.number)")})
        return (anEntity, false)}
}