//
//  SmileIdleAnimationSequence.swift
//  FaceAnimationTest
//
//  Created by Alex Coundouriotis on 9/9/23.
//

import Foundation

internal struct SmileIdleFaceAnimationSequence: FaceAnimationSequence {
    
    var animations: [FaceAnimation] = [
        SmileIdleFaceAnimationStart(),
        SmileIdleFaceAnimation1(),
        WaitFaceAnimation(duration: 0.4),
        SmileIdleFaceAnimation2(),
        WaitFaceAnimation(duration: 0.1),
        SmileIdleFaceAnimation3()
    ]
    
}
