//
//  types.swift
//  Game Engine Tutorial
//
//  Created by Christoph Prenissl on 10.11.20.
//

import simd

protocol sizeable {
    static func size(_ count: Int) -> Int
    static func stride(_ count: Int) -> Int
}


extension sizeable {
    static func size() -> Int {
        return MemoryLayout<Self>.size
    }
    
    static func stride() -> Int {
        return MemoryLayout<Self>.stride
    }
    
    static func size(_ count: Int) -> Int {
        return MemoryLayout<Self>.size * count
    }
    
    static func stride(_ count: Int) -> Int {
        return MemoryLayout<Self>.stride * count
    }
}

struct Vertex: sizeable {
    var position: float3
    var color: float4
}

extension float3: sizeable {}
extension float4: sizeable {}
