//
//  ReadingLeftAnimation.swift
//  FaceAnimationTest
//
//  Created by Alex Coundouriotis on 9/8/23.
//

import Foundation

struct ReadingLeftAnimation: FaceAnimation {
    struct EyesAnimation: MoveCurveAnimation {
        var moveToPosition: CGPoint = CGPoint(x: -8, y: 0)
        var moveToQuadCurveControlPoint: CGPoint = CGPoint(x: -4, y: 4)
    }
    
    struct NoseAnimation: MoveAnimation {
        var moveToPosition: CGPoint = CGPoint(x: -4, y: 0)
    }
    
    struct MouthAnimation: MoveAnimation {
        var moveToPosition: CGPoint = CGPoint(x: -4, y: 0)
    }
    
    struct BackgroundAnimation: MoveAnimation {
        var moveToPosition: CGPoint = CGPoint(x: -2, y: 0)
    }
    
    var eyesAnimation: FacialFeatureAnimation? = EyesAnimation()
    var noseAnimation: FacialFeatureAnimation? = NoseAnimation()
    var mouthAnimation: FacialFeatureAnimation? = MouthAnimation()
    var mouthPosition: MouthPositions? = MouthPositions.thinking
    var backgroundAnimation: FacialFeatureAnimation? = BackgroundAnimation()
    
    var duration: CFTimeInterval = 1.0
}
