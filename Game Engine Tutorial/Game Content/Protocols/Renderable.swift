//
//  Renderable.swift
//  Game Engine Tutorial
//
//  Created by Christoph Prenissl on 12.11.20.
//

import MetalKit

protocol Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder)
}
