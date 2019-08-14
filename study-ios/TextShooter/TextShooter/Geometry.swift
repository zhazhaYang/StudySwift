//
//  Geometry.swift
//  TextShooter
//
//  Created by yang on 2019/4/23.
//  Copyright © 2019 yang. All rights reserved.
//

import UIKit

//takes a CGVector and a CGFloat
//returns a new CGFloat where each component of v has been multiplied by m
func vectorMutiply(_ v: CGVector, _ m: CGFloat) -> CGVector {
    return CGVector(dx: v.dx * m, dy: v.dy * m)
}

//returns a CGVector representing a direction from p1 to p2
func vectorBetweenPoints(_ p1: CGPoint, _ p2: CGPoint) -> CGVector {
    return CGVector(dx: p2.x - p1.x, dy: p2.y - p1.y)
}

//returns a CGFloat containing the length of vector, calculated using Pythagoras' theorem(勾股定理)
func vectorLength(_ v: CGVector) -> CGFloat {
    return CGFloat(sqrtf(powf(Float(v.dx), 2.0) + powf(Float(v.dy), 2.0)))
}

//returns a CGFloat containing the distance betwween them with Pythagoras' theorem
func pointDistance(_ p1: CGPoint, _ p2: CGPoint) -> CGFloat {
    return CGFloat(sqrtf(powf(Float(p2.x - p1.x), 2.0) + powf(Float(p2.y - p1.y), 2.0)))
}


