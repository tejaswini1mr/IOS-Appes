//
//  ViewController.swift
//  CoreGraphics
//
//  Created by Tejaswini MR on 16/06/21.
//

import UIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = 
        path.move(to: CGPoint(x: 10, y: 10))
        path.addLine(to: CGPoint(x: 100, y: 100))

        // Create a `CAShapeLayer` that uses that `UIBezierPath`:

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.blue.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 3

        // Add that `CAShapeLayer` to your view's layer:

        view.layer.addSublayer(shapeLayer)
    }


}

