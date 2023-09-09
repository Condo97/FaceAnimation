//
//  ViewController.swift
//  FaceAnimationTest
//
//  Created by Alex Coundouriotis on 9/8/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        let faceAnimationView = FaceAnimationView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        view.addSubview(faceAnimationView)
    }

}

