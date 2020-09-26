//
//  ViewController.swift
//  3DCarousel
//
//  Created by Ricardo Duarte on 26/09/2020.
//

import UIKit

func degreeToRadians(degree: CGFloat) -> CGFloat {
    (degree * CGFloat.pi)/180
}

class ViewController: UIViewController {
    let imageCardSize: CGSize = CGSize(width: 150, height: 300)
    let transformLayer = CATransformLayer()
    var currentAngle: CGFloat = 0
    var currentOffset: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        transformLayer.frame = self.view.bounds
        view.layer.addSublayer(transformLayer)
        
        for imageIndex in 1...6 {
            addImageCard(name: "\(imageIndex)")
        }

        turnCarousel()
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(ViewController.performPanAction(recognizer:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }

    func addImageCard(name: String) {
        let imageLayer = CALayer()
        imageLayer.frame = CGRect(x: view.frame.size.width/2 - imageCardSize.width/2,
                                  y: view.frame.size.height/2 - imageCardSize.height/2,
                                  width: imageCardSize.width,
                                  height: imageCardSize.height)
        imageLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        guard let imageCardImage = UIImage(named: name)?.cgImage else {
            return
        }
        
        imageLayer.contents = imageCardImage
        imageLayer.contentsGravity = .resizeAspectFill
        imageLayer.masksToBounds = true
        imageLayer.isDoubleSided = true
        imageLayer.borderColor = UIColor(white: 1, alpha: 0.5).cgColor
        imageLayer.borderWidth = 5
        imageLayer.cornerRadius = 10
        transformLayer.addSublayer(imageLayer)
    }

    func turnCarousel() {
        guard let transformSublayers = transformLayer.sublayers else {
            return
        }
        let segmentForImageCard = CGFloat(360 / transformSublayers.count)
        var angleOffset = currentAngle
        for layer in transformSublayers {
            var transform = CATransform3DIdentity
            // responsible for depth of perpective
            transform.m34 = -1/500
            
            transform = CATransform3DRotate(transform, degreeToRadians(degree: angleOffset), 0, 1, 0)
            transform = CATransform3DTranslate(transform, 0, 0, 200)
            CATransaction.setAnimationDuration(0)
            layer.transform = transform
            angleOffset += segmentForImageCard
        }
    }

    @objc
    func performPanAction(recognizer: UIPanGestureRecognizer) {
        let xOffset = recognizer.translation(in: view).x
        if recognizer.state == .began {
            currentOffset = 0
        }
        let xDiff = xOffset - currentOffset
        currentOffset += xDiff
        currentAngle += xDiff
        
        turnCarousel()
    }
}

