//
//  ReadingLeftAnimation.swift
//  FaceAnimationTest
//
//  Created by Alex Coundouriotis on 9/8/23.
//

import Foundation

internal struct ReadingLeftFaceAnimation: FaceAnimation {
    struct EyebrowsAnimation: MoveCurveAnimation {
        var moveToQuadCurvePoint: CGPoint = CGPoint(x: -4, y: 0)
        var moveToQuadCurveControlPoint: CGPoint = CGPoint(x: -2, y: 2)
    }
    
    struct EyesAnimation: MoveCurveAnimation {
        var moveToQuadCurvePoint: CGPoint = CGPoint(x: -8, y: 0)
        var moveToQuadCurveControlPoint: CGPoint = CGPoint(x: -4, y: 4)
    }
    
    struct NoseAnimation: MoveCurveAnimation {
        var moveToQuadCurvePoint: CGPoint = CGPoint(x: -4, y: 0)
        var moveToQuadCurveControlPoint: CGPoint = CGPoint(x: -2, y: 2)
    }
    
    struct MouthAnimation: MoveCurveAnimation {
        var moveToQuadCurvePoint: CGPoint = CGPoint(x: -4, y: 0)
        var moveToQuadCurveControlPoint: CGPoint = CGPoint(x: -2, y: 2)
    }
    
    struct BackgroundAnimation: MoveAnimation {
        var moveToPosition: CGPoint = CGPoint(x: -2, y: 0)
    }
    
    var eyebrowsAnimation: FacialFeatureAnimation? = EyebrowsAnimation()
    var eyebrowsPosition: EyebrowsPositions? = EyebrowsPositions.lowered
    var eyesAnimation: FacialFeatureAnimation? = EyesAnimation()
    var noseAnimation: FacialFeatureAnimation? = NoseAnimation()
    var mouthAnimation: FacialFeatureAnimation? = MouthAnimation()
    var mouthPosition: MouthPositions? = MouthPositions.thinking
    var backgroundAnimation: FacialFeatureAnimation? = BackgroundAnimation()
    
    var duration: CFTimeInterval = 1.0
}
