//
//  Node.swift
//  Game Engine Tutorial
//
//  Created by Christoph Prenissl on 12.11.20.
//

import MetalKit


class Node {
    
    
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder)
        }
    }
}
