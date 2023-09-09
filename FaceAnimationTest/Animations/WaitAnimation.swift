//
//  WaitAnimation.swift
//  FaceAnimationTest
//
//  Created by Alex Coundouriotis on 9/9/23.
//

import Foundation

struct WaitAnimation: FaceAnimation {
    var eyesAnimation: FacialFeatureAnimation?
    var noseAnimation: FacialFeatureAnimation?
    var mouthAnimation: FacialFeatureAnimation?
    var mouthPosition: MouthPositions?
    var backgroundAnimation: FacialFeatureAnimation?
    
    var duration: CFTimeInterval
    
    init(duration: CFTimeInterval) {
        self.duration = duration
    }
}
