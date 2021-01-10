//
//  ColorUtil.swift
//  Game Engine Tutorial
//
//  Created by Christoph Prenissl on 10.01.21.
//

import simd

class ColorUtil {
    
    public static var randomColor: float4 {
        return float4(Float.randomZeroToOne, Float.randomZeroToOne, Float.randomZeroToOne, 1.0)
    }
}
