//
//  Library.swift
//  Game Engine Tutorial
//
//  Created by Christoph Prenissl on 12.11.20.
//

import MetalKit

enum VertexShaderTypes {
    case Basic
    case Instanced
}

enum FragmentShaderTypes {
    case Basic
}

class ShaderLibrary {
    
    public static var DefaultLibrary: MTLLibrary!
    
    private static var vertexShaders: [VertexShaderTypes: Shader] = [:]
    private static var fragmentShaders: [FragmentShaderTypes: Shader] = [:]
    
    public static func initialize() {
        DefaultLibrary = Engine.Device.makeDefaultLibrary()
        createDefaultShaders()
    }
    
    public static func createDefaultShaders() {
        //Vertex Shaders
        vertexShaders.updateValue(Basic_VertexShader(), forKey: VertexShaderTypes.Basic)
        vertexShaders.updateValue(Instanced_VertexShader(), forKey: VertexShaderTypes.Instanced)
        
        //Fragment Shaders
        fragmentShaders.updateValue(Basic_FragmentShader(), forKey: FragmentShaderTypes.Basic)
    }
    
    public static func Vertex(_ vertexShaderType: VertexShaderTypes) -> MTLFunction {
        return vertexShaders[vertexShaderType]!.function
    }
    
    public static func Fragment(_ fragmentShaderType: FragmentShaderTypes) -> MTLFunction {
        return fragmentShaders[fragmentShaderType]!.function
    }
        
}


protocol Shader {
    var name: String { get }
    var functionName: String { get }
    var function: MTLFunction! { get }
}

public struct Basic_VertexShader: Shader {
    public var name: String = "Basic Vertex Shader"
    public var functionName: String = "basic_vertex_shader"
    public var function: MTLFunction!
    
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)
        function?.label = name
    }
}

public struct Instanced_VertexShader: Shader {
    public var name: String = "Instanced Vertex Shader"
    public var functionName: String = "instanced_vertex_shader"
    public var function: MTLFunction!
    
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)
        function?.label = name
    }
}

public struct Basic_FragmentShader: Shader {
    public var name: String = "Basic Fragment Shader"
    public var functionName: String = "basic_fragment_shader"
    public var function: MTLFunction!
    
    init() {
        function = ShaderLibrary.DefaultLibrary.makeFunction(name: functionName)
        function?.label = name
    }
}
