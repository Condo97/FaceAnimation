//
//  SmileIdleAnimationStart.swift
//  FaceAnimationTest
//
//  Created by Alex Coundouriotis on 9/9/23.
//

import Foundation

internal struct SmileIdleFaceAnimationStart: FaceAnimation {
    struct EyesAnimation: MoveAnimation {
        var moveToPosition: CGPoint = CGPoint(x: 0, y: 0)
    }
    
    struct NoseAnimation: MoveAnimation {
        var moveToPosition: CGPoint = CGPoint(x: 0, y: 0)
    }
    
    struct MouthAnimation: MoveAnimation {
        var moveToPosition: CGPoint = CGPoint(x: 0, y: 0)
    }
    
    struct BackgroundAnimation: MoveAnimation {
        var moveToPosition: CGPoint = CGPoint(x: 0, y: 0)
    }
    
    var eyebrowsAnimation: FacialFeatureAnimation?
    var eyebrowsPosition: EyebrowsPositions? = EyebrowsPositions.dismissed
    var eyesAnimation: FacialFeatureAnimation? = EyesAnimation()
    var noseAnimation: FacialFeatureAnimation? = NoseAnimation()
    var mouthAnimation: FacialFeatureAnimation? = MouthAnimation()
    var mouthPosition: MouthPositions? = MouthPositions.smile
    var backgroundAnimation: FacialFeatureAnimation? = BackgroundAnimation()
    
    var duration: CFTimeInterval = 1.0
}
