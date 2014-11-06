//
//  PipelineOpperator.swift
//  FunctionalDiscreteEventEngine
//
//  Created by Austin Tooley on 11/6/14.
//  Copyright (c) 2014 Austin Tooley. All rights reserved.
//

import Foundation

//accept a value (left) and use it in the function (right)
infix operator |> { associativity left }
func |> <T,U>(left: T, right: T -> U) -> U {
    return right(left)
}


func |> <T>(left: ((String?, Entity)->T, Entity, (String?, Any)->()), var right: ()->() ) -> (T){
//    let (aUUID, anAny) = doStuff(entry)
//    if aUUID != nil {
//        errorHandler(aUUID, anAny)
//    } else {
//        return nextFunc(aUUID, anAny)
//    }
}