//
//  MoveCurveAnimatin.swift
//  FaceAnimationTest
//
//  Created by Alex Coundouriotis on 9/8/23.
//

import Foundation

protocol MoveCurveAnimation: MoveAnimation {
    var moveToQuadCurveControlPoint: CGPoint { get set }
}
