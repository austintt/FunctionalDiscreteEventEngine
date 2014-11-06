// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func doStuff() {
    let first = Int(arc4random_uniform(10))
    let second = Int(arc4random_uniform(10))
    let add = first + second
    return add
}

println(doStuff())
