//
//  RenderPipelineStateLibrary.swift
//  Game Engine Tutorial
//
//  Created by Christoph Prenissl on 12.11.20.
//

import MetalKit

enum RenderPipelineStateTypes {
    case Basic
    case Instanced
}

class RenderPipelineStateLibrary {
    private static var renderPipelineStates: [RenderPipelineStateTypes: RenderPipelineState] = [:]
    
    public static func initialize() {
        createDefaultRenderPipelineStates()
    }
    
    private static func createDefaultRenderPipelineStates() {
        
        renderPipelineStates.updateValue(Basic_RenderPipelineState(), forKey: .Basic)
        renderPipelineStates.updateValue(Instanced_RenderPipelineState(), forKey: .Instanced)
    }
    
    public static func PipelineState(_ renderPipelineStateType: RenderPipelineStateTypes) -> MTLRenderPipelineState {
        return renderPipelineStates[renderPipelineStateType]!.renderPipelineState
    }
}


protocol RenderPipelineState {
    var name: String { get }
    var renderPipelineState: MTLRenderPipelineState! { get }
}

public struct Basic_RenderPipelineState: RenderPipelineState {
    var name: String = "Basic Render Pipeline State"
    var renderPipelineState: MTLRenderPipelineState!
    
    init() {
        do {
            renderPipelineState = try Engine.Device.makeRenderPipelineState(descriptor: RenderPipelineDescriptorLibrary.descriptor(.Basic))
        } catch let error as NSError {
            print("ERROR::CREATE::RENDER_PIPELINE_STATE::__\(error)")
        }
    }
}

public struct Instanced_RenderPipelineState: RenderPipelineState {
    var name: String = "Instanced Render Pipeline State"
    var renderPipelineState: MTLRenderPipelineState!
    
    init() {
        do {
            renderPipelineState = try Engine.Device.makeRenderPipelineState(descriptor: RenderPipelineDescriptorLibrary.descriptor(.Instanced))
        } catch let error as NSError {
            print("ERROR::CREATE::RENDER_PIPELINE_STATE::__\(error)")
        }
    }
}
