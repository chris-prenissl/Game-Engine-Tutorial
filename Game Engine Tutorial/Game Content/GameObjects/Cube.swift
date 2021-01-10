//
//  Cube.swift
//  Game Engine Tutorial
//
//  Created by Christoph Prenissl on 30.11.20.
//

import MetalKit


class Cube: GameObject {
    
    init() {
        super.init(meshType: .Cube_Custom)
    }
    
    override func update(deltaTime: Float) {
        self.rotation.x += deltaTime
        self.rotation.y += deltaTime
        super.update(deltaTime: deltaTime)
    }
}
