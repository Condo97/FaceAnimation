//
//  SmileIdleAnimation1.swift
//  FaceAnimationTest
//
//  Created by Alex Coundouriotis on 9/9/23.
//

import Foundation

internal struct SmileIdleFaceAnimation1: FaceAnimation {
    struct EyesAnimation: MoveCurveAnimation {
        var moveToQuadCurvePoint: CGPoint = CGPoint(x: -8, y: 0)
        var moveToQuadCurveControlPoint: CGPoint = CGPoint(x: -4, y: 4)
    }
    
    struct NoseAnimation: MoveCurveAnimation {
        var moveToQuadCurvePoint: CGPoint = CGPoint(x: -6, y: 0)
        var moveToQuadCurveControlPoint: CGPoint = CGPoint(x: -3, y: 2)
    }
    
    struct MouthAnimation: MoveCurveAnimation {
        var moveToQuadCurvePoint: CGPoint = CGPoint(x: -6, y: 0)
        var moveToQuadCurveControlPoint: CGPoint = CGPoint(x: -3, y: 2)
    }
    
    struct BackgroundAnimation: MoveCurveAnimation {
        var moveToQuadCurvePoint: CGPoint = CGPoint(x: -2, y: 0)
        var moveToQuadCurveControlPoint: CGPoint = CGPoint(x: -3, y: 1)
    }
    
    var eyebrowsAnimation: FacialFeatureAnimation?
    var eyebrowsPosition: EyebrowsPositions? = EyebrowsPositions.dismissed
    var eyesAnimation: FacialFeatureAnimation? = EyesAnimation()
    var noseAnimation: FacialFeatureAnimation? = NoseAnimation()
    var mouthAnimation: FacialFeatureAnimation? = MouthAnimation()
    var mouthPosition: MouthPositions?
    var backgroundAnimation: FacialFeatureAnimation? = BackgroundAnimation()
    
    var duration: CFTimeInterval = 0.4
}
