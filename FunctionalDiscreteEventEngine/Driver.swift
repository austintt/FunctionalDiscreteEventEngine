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
    
    func startEngine() {
        var myGraph = Graph()

        //fill entities array
        myGraph.entities = [Entity(number: 0), Entity(number: 1), Entity(number: 2), Entity(number: 3), Entity(number: 4), Entity(number: 5)]

        //fill mainPath array
        myGraph.mainPath = buildGraphlet(
            event0,
            event1,
            event2,
            event3)

        //fill altMap
        myGraph.alternateMap = [buildGraphlet(event2)[0]: buildGraphlet(
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
        engine.go(1)
    }
    
    //MAIN EVENTS
    let event0 = {(anEntity: Entity) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("Main event 0 peformed on entity number \(anEntity.number)")})
        return anEntity}
    
    let event1 = {(anEntity: Entity) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("Main event 1 peformed on entity number \(anEntity.number)")})
        return anEntity}
    
    let event2 = {(anEntity: Entity) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("Main event 2 peformed on entity number \(anEntity.number)")})
        return anEntity}
    
    let event3 = {(anEntity: Entity) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("Main event 3 peformed on entity number \(anEntity.number)")})
        return anEntity}
    
    
    //ALT EVENTS
    let altEvent0 = {(anEntity: Entity) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("\tAlternate event 0 peformed on entity number \(anEntity.number)")})
        return anEntity}
    
    let altEvent1 = {(anEntity: Entity) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("\tAlternate event 1 peformed on entity number \(anEntity.number)")})
        return anEntity}
    
    let altEvent2 = {(anEntity: Entity) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("\tAlternate event 2 peformed on entity number \(anEntity.number)")})
        return anEntity}
    
    let altEvent3 = {(anEntity: Entity) -> (Entity) in
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            println("\tAlternate event 3 peformed on entity number \(anEntity.number)")})
        return anEntity}
}