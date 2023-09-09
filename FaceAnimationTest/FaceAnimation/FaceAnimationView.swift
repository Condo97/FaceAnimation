//
//  FaceAnimationView.swift
//  FaceAnimationTest
//
//  Created by Alex Coundouriotis on 9/9/23.
//

import Foundation
import UIKit

class FaceAnimationView: UIView {
    
    public var idleAnimations: [FaceAnimation] = []
    
    private var fullFaceLayer: CALayer!
    
    private var originalMouthPath: UIBezierPath!
    private var mouthShapeLayer: CAShapeLayer!
    
    private var leftEyeShapeLayer: CAShapeLayer!
    private var rightEyeShapeLayer: CAShapeLayer!
    private var eyesLayer: CALayer!
    
    private var originalNosePath: UIBezierPath!
    private var noseShapeLayer: CAShapeLayer!
    
    private var backgroundFaceLayer: CALayer!
    private var backgroundFaceImage: UIImage!
    
    private var animationsQueue: DispatchQueue = DispatchQueue(label: "animationsQueue")
    private var animationGroup: DispatchGroup = DispatchGroup()
    
    private var shouldStopAnimating = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawFace()
        setupAnimations()
        subscribeToAnimationGroupNotify()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func addFaceAnimations(_ faceAnimations: [FaceAnimation]) {
        // Loops through animations, and once they are all done, loops through the list again
        for faceAnimation in faceAnimations {
            addFaceAnimation(faceAnimation)
        }
        
    }
    
    public func addFaceAnimation(_ faceAnimation: FaceAnimation) {
        guard !shouldStopAnimating else {
            return
        }
        
        animationsQueue.async(group: animationGroup) {
            
            // Animate eyes, nose, mouth, and background
            if let eyesAnimation = faceAnimation.eyesAnimation {
                self.animate(facialFeatureAnimation: eyesAnimation, layer: self.eyesLayer, duration: faceAnimation.duration)
            }
            if let noseAnimation = faceAnimation.noseAnimation {
                self.animate(facialFeatureAnimation: noseAnimation, layer: self.noseShapeLayer, duration: faceAnimation.duration)
            }
            if let mouthAnimation = faceAnimation.mouthAnimation {
                self.animate(facialFeatureAnimation: mouthAnimation, layer: self.mouthShapeLayer, duration: faceAnimation.duration)
            }
            if let mouthPosition = faceAnimation.mouthPosition {
                self.animate(facialFeatureAnimation: mouthPosition, layer: self.mouthShapeLayer, duration: faceAnimation.duration)
            }
            if let backgroundAnimation = faceAnimation.backgroundAnimation {
                self.animate(facialFeatureAnimation: backgroundAnimation, layer: self.backgroundFaceLayer, duration: faceAnimation.duration)
            }
            
            Thread.sleep(forTimeInterval: faceAnimation.duration)
        }
    }
    
    public func blink(duration: CFTimeInterval = 0.2, blinkMinXScale: CGFloat = 0.8, blinkMinYScale: CGFloat = 0.2) {
        animationsQueue.async(group: animationGroup) {
            let xAnimation = CAKeyframeAnimation(keyPath: "transform.scale.x")
            let yAnimation = CAKeyframeAnimation(keyPath: "transform.scale.y")
            xAnimation.duration = duration
            yAnimation.duration = duration

            xAnimation.values = [1, blinkMinXScale, 1]
            xAnimation.keyTimes = [0, 0.5, 1]
            yAnimation.values = [1, blinkMinYScale, 1]
            yAnimation.keyTimes = [0, 0.5, 1]

            DispatchQueue.main.async {
                self.leftEyeShapeLayer.add(xAnimation, forKey: nil)
                self.rightEyeShapeLayer.add(xAnimation, forKey: nil)
                self.leftEyeShapeLayer.add(yAnimation, forKey: nil)
                self.rightEyeShapeLayer.add(yAnimation, forKey: nil)
            }
        }
    }
    
    private func drawFace() {
        leftEyeShapeLayer = CAShapeLayer()
        leftEyeShapeLayer.frame = CGRect(x: 93, y: 140, width: 20, height: 20)
        leftEyeShapeLayer.path = UIBezierPath(ovalIn: leftEyeShapeLayer.frame).cgPath
        leftEyeShapeLayer.bounds = leftEyeShapeLayer.path!.boundingBox
        leftEyeShapeLayer.strokeColor = UIColor.black.cgColor
        leftEyeShapeLayer.fillColor = UIColor.black.cgColor
        
        rightEyeShapeLayer = CAShapeLayer()
        rightEyeShapeLayer.frame = CGRect(x: 187, y: 140, width: 20, height: 20)
        rightEyeShapeLayer.path = UIBezierPath(ovalIn: rightEyeShapeLayer.frame).cgPath
        rightEyeShapeLayer.bounds = rightEyeShapeLayer.path!.boundingBox
        rightEyeShapeLayer.strokeColor = UIColor.black.cgColor
        rightEyeShapeLayer.fillColor = UIColor.black.cgColor
        
        eyesLayer = CALayer()
        eyesLayer.addSublayer(leftEyeShapeLayer)
        eyesLayer.addSublayer(rightEyeShapeLayer)
        
        originalNosePath = UIBezierPath()
        originalNosePath.move(to: CGPoint(x: 150, y: 154))
        originalNosePath.addLine(to: CGPoint(x: 168, y: 196))
        originalNosePath.addLine(to: CGPoint(x: 130, y: 196))
        
        noseShapeLayer = CAShapeLayer()
        noseShapeLayer.path = originalNosePath.cgPath
        noseShapeLayer.strokeColor = UIColor.black.cgColor
        noseShapeLayer.fillColor = UIColor.clear.cgColor
        noseShapeLayer.lineWidth = 8.0
        noseShapeLayer.lineCap = .round
        noseShapeLayer.lineJoin = .round
        
        originalMouthPath = UIBezierPath()
        originalMouthPath.move(to: CGPoint(x: 122, y: 228))
        originalMouthPath.addQuadCurve(to: CGPoint(x: 178, y: 228), controlPoint: CGPoint(x: 150, y: 232))
        
        mouthShapeLayer = CAShapeLayer()
        mouthShapeLayer.path = originalMouthPath.cgPath
        mouthShapeLayer.strokeColor = UIColor.black.cgColor
        mouthShapeLayer.fillColor = UIColor.clear.cgColor
        mouthShapeLayer.lineWidth = 8.0
        mouthShapeLayer.lineCap = .round
        
        backgroundFaceImage = UIImage(named: "face_background")
        backgroundFaceLayer = CALayer()
        backgroundFaceLayer.frame = CGRect(x: 150.0, y: 150.0, width: 300, height: 300)
        backgroundFaceLayer.position = CGPoint(x: 0.0, y: 0.0)
        backgroundFaceLayer.anchorPoint = CGPoint(x: 0.0, y: 0.0)
//        backgroundFaceLayer.path = originalBackgroundFacePath.cgPath
        backgroundFaceLayer.contents = backgroundFaceImage.cgImage
        
        fullFaceLayer = CALayer()
        
        fullFaceLayer.addSublayer(backgroundFaceLayer)
        fullFaceLayer.addSublayer(mouthShapeLayer)
        fullFaceLayer.addSublayer(noseShapeLayer)
        fullFaceLayer.addSublayer(eyesLayer)
        
        self.layer.addSublayer(fullFaceLayer)
    }
    
    func setupAnimations() {
        idleAnimations = [
            SmileIdleAnimationStart(),
            WaitAnimation(duration: 0.4),
            SmileIdleAnimation1(),
            WaitAnimation(duration: 0.4),
            SmileIdleAnimation2()
        ]
        
        addFaceAnimation(SmileIdleAnimationStart())
        blink()
        addFaceAnimation(SmileIdleAnimation1())
        addFaceAnimation(SmileIdleAnimation2())
        addFaceAnimation(WaitAnimation(duration: 1.0))
        addFaceAnimation(SmileIdleAnimation1())
        blink()
        addFaceAnimation(WaitAnimation(duration: 1.0))
        addFaceAnimation(SmileIdleAnimation2())
        addFaceAnimation(SmileIdleAnimation3())
        addFaceAnimation(SmileIdleAnimationStart())
        blink()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.addFaceAnimation(ReadingLeftAnimation())
            self.addFaceAnimation(ReadingRightAnimation())
            self.addFaceAnimation(WaitAnimation(duration: 1.0))
            self.addFaceAnimation(ReadingLeftAnimation())
            self.addFaceAnimation(ReadingRightAnimation())
        }
    }
    
    private func subscribeToAnimationGroupNotify() {
        animationGroup.notify(queue: animationsQueue) {
            print("hi")
            self.addFaceAnimations(self.idleAnimations)
            self.subscribeToAnimationGroupNotify()
        }
    }
    
    private func animate(facialFeatureAnimation: FacialFeatureAnimation, layer: CALayer, duration: CFTimeInterval) {
        if let moveCurveAnimation = facialFeatureAnimation as? MoveCurveAnimation {
            let animation = CAKeyframeAnimation(keyPath: "position")
            animation.duration = duration
            
            let path = UIBezierPath()
            path.move(to: layer.position)
            path.addQuadCurve(to: moveCurveAnimation.moveToPosition, controlPoint: moveCurveAnimation.moveToQuadCurveControlPoint)
            
//            animation.values = [layer.position, moveAnimation.moveToPosition]
            animation.path = path.cgPath
            animation.keyTimes = [0, 1]
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            DispatchQueue.main.async {
                layer.position = moveCurveAnimation.moveToPosition
                layer.add(animation, forKey: nil)
            }
        } else if let moveAnimation = facialFeatureAnimation as? MoveAnimation {
            let animation = CAKeyframeAnimation(keyPath: "position")
            animation.duration = duration
            
            animation.values = [layer.position, moveAnimation.moveToPosition]
            animation.keyTimes = [0, 1]
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
            DispatchQueue.main.async {
                layer.position = moveAnimation.moveToPosition
                layer.add(animation, forKey: nil)
            }
        } else if let lineAnimation = facialFeatureAnimation as? LineAnimation, let shapeLayer = layer as? CAShapeLayer {
            let animation = CAKeyframeAnimation(keyPath: "path")
            animation.duration = duration
            
            let path = UIBezierPath()
            path.move(to: lineAnimation.linePosition)
            path.addQuadCurve(to: lineAnimation.quadCurvePoint, controlPoint: lineAnimation.quadCurveControlPoint)
            
            animation.values = [shapeLayer.path!, path.cgPath]
            animation.keyTimes = [0, 1]
            
            DispatchQueue.main.async {
                shapeLayer.path = path.cgPath
                shapeLayer.add(animation, forKey: nil)
            }
        }
    }
    
}
