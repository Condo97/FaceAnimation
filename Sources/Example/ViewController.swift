//
//  ViewController.swift
//  FaceAnimationTest
//
//  Created by Alex Coundouriotis on 9/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    let sequence1: [FaceAnimation] = SmileIdleFaceAnimationSequence().animations
    
    let sequence2: [FaceAnimation] = [
        ReadingLeftFaceAnimation(),
        WaitFaceAnimation(duration: 0.4),
        ReadingRightFaceAnimation(),
        WaitFaceAnimation(duration: 0.4)
    ]
    
    let sequence3: [FaceAnimation] = [
        
    ]
    
    let action1: [FaceAnimation] = [
        ReadingLeftFaceAnimation(),
        WaitFaceAnimation(duration: 2.0)
    ]
    
    let action2: [FaceAnimation] = [
        ReadingRightFaceAnimation(),
        WaitFaceAnimation(duration: 2.0)
    ]
    
    let action3: [FaceAnimation] = [
        SmileIdleFaceAnimationStart(),
        WaitFaceAnimation(duration: 2.0)
    ]
    
    let blink: FaceAnimation = BlinkFaceAnimation()
    
    @IBOutlet weak var faceAnimationViewContainer: UIView!
    
    var faceAnimationView: FaceAnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        faceAnimationView = FaceAnimationView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        faceAnimationViewContainer.addSubview(faceAnimationView!)
    }
    
    @IBAction func sequence1Pressed(_ sender: Any) {
        faceAnimationView?.setIdleAnimations(sequence1)
    }
    
    @IBAction func sequence2Pressed(_ sender: Any) {
        faceAnimationView?.setIdleAnimations(sequence2)
    }
    
    @IBAction func sequence3Pressed(_ sender: Any) {
        faceAnimationView?.setIdleAnimations(sequence3)
    }
    
    @IBAction func action1Pressed(_ sender: Any) {
        faceAnimationView?.interrupt(with: action1)
    }
    
    @IBAction func action2Pressed(_ sender: Any) {
        faceAnimationView?.interrupt(with: action2)
    }
    
    @IBAction func action3Pressed(_ sender: Any) {
        faceAnimationView?.queue(faceAnimations: action3)
    }
    
    @IBAction func blinkPressed(_ sender: Any) {
        faceAnimationView?.async(faceAnimation: blink)
    }
    
}

