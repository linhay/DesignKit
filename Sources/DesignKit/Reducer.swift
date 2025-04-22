//
//  Reducer.swift
//  FlowUp
//
//  Created by linhey on 2/4/25.
//


public protocol Reducer: AnyObject, Hashable, Equatable {
    
}

public extension Reducer {
 
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs === rhs
    }
    
}
