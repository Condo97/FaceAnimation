//
//  SmileIdleAnimation1.swift
//  FaceAnimationTest
//
//  Created by Alex Coundouriotis on 9/9/23.
//

import Foundation

struct SmileIdleAnimation1: FaceAnimation {
    struct EyesAnimation: MoveAnimation {
        var moveToPosition: CGPoint = CGPoint(x: -8, y: 0)
    }
    
    struct NoseAnimation: MoveAnimation {
        var moveToPosition: CGPoint = CGPoint(x: -6, y: 0)
    }
    
    struct MouthAnimation: MoveAnimation {
        var moveToPosition: CGPoint = CGPoint(x: -6, y: 0)
    }
    
    struct BackgroundAnimation: MoveAnimation {
        var moveToPosition: CGPoint = CGPoint(x: -2, y: 0)
    }
    
    var eyesAnimation: FacialFeatureAnimation? = EyesAnimation()
    var noseAnimation: FacialFeatureAnimation? = NoseAnimation()
    var mouthAnimation: FacialFeatureAnimation? = MouthAnimation()
    var mouthPosition: MouthPositions?
    var backgroundAnimation: FacialFeatureAnimation? = BackgroundAnimation()
    
    var duration: CFTimeInterval = 0.4
}