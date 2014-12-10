//
//  Driver.swift
//  FunctionalDiscreteEventEngine
//
//  Created by Austin Tooley on 12/2/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import Foundation

//create graphs
struct Driver {
    
    let startTime = 1
    
    func startEngine() {
        var myGraph = Graph()
        var test: Action

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

        //array - why?
        let graphs = [myGraph]

        //create engine
        var engine = SimulationEngine()
        engine.graphs = graphs

        //run engine
        engine.go(startTime)
    }
    
    //MAIN EVENTS
    let event0 = {(anEntity: Entity, uuid: NSUUID) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("Main event 0 peformed on entity number \(anEntity.number)")})
        return anEntity}
    
    let event1 = {(var anEntity: Entity, uuid: NSUUID) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("Main event 1 peformed on entity number \(anEntity.number)")})
    
            //set fail flag for testing
            let randNum = Int(arc4random_uniform(10))
            if (randNum % 5) == 0 {
                let uuid = NSUUID()
                if let failPoints = anEntity.failPoints {
                    anEntity.failPoints!.append(uuid)
                }
                else {
                    anEntity.failPoints = [uuid]
                }
//                anEntity.failPoints!.append(uuid)
                println("We failed!")
            }
        return anEntity}
    
    let event2 = {(anEntity: Entity, uuid: NSUUID) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("Main event 2 peformed on entity number \(anEntity.number)")})
        return anEntity}
    
    let event3 = {(anEntity: Entity, uuid: NSUUID) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("Main event 3 peformed on entity number \(anEntity.number)")})
        return anEntity}
    
    
    //ALT EVENTS
    let altEvent0 = {(anEntity: Entity, uuid: NSUUID) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("\tAlternate event 0 peformed on entity number \(anEntity.number)")})
        return anEntity}
    
    let altEvent1 = {(anEntity: Entity, uuid: NSUUID) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("\tAlternate event 1 peformed on entity number \(anEntity.number)")})
        return anEntity}
    
    let altEvent2 = {(anEntity: Entity, uuid: NSUUID) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("\tAlternate event 2 peformed on entity number \(anEntity.number)")})
        return anEntity}
    
    let altEvent3 = {(anEntity: Entity, uuid: NSUUID) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("\tAlternate event 3 peformed on entity number \(anEntity.number)")})
        return anEntity}
}