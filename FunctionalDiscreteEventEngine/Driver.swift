//
//  Driver.swift
//  FunctionalDiscreteEventEngine
//
//  Created by Austin Tooley on 12/2/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import Foundation

//create graphs
func startEngine() {
    

    var myGraph = Graph()

    //fill entities array
    myGraph.entities = [Entity(number: 0), Entity(number: 1), Entity(number: 2), Entity(number: 3), Entity(number: 4), Entity(number: 5)]
    
    //fill mainPath array
    myGraph.mainPath = buildGraphlet(
        {(anEntity: Entity) -> (Entity) in println("Main event 0 peformed on entity number \(anEntity.number)")
        return anEntity},
        {(anEntity: Entity) -> (Entity) in println("Main event 1 peformed on entity number \(anEntity.number)")
            return anEntity},
        {(anEntity: Entity) -> (Entity) in println("Main event 2 peformed on entity number \(anEntity.number)")
            return anEntity},
        {(anEntity: Entity) -> (Entity) in println("Main event 3 peformed on entity number \(anEntity.number)")
            return anEntity})

    //fill altMap

    //array - why?
    let graphs = [myGraph]
    
    //create engine
    var engine = SimulationEngine()
    engine.graphs = graphs
    
    //run engine
    engine.go(1)
    
    
}