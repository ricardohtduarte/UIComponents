//
//  AnimationController.swift
//  ViewControllerTransitions
//
//  Created by Ricardo Duarte on 04/02/2022.
//

import UIKit
import Foundation

class AnimationController: NSObject {
    internal init(animationDuration: TimeInterval, animationType: AnimationController.AnimationType) {
        self.animationDuration = animationDuration
        self.animationType = animationType
    }

    private let animationDuration: TimeInterval
    private let animationType: AnimationType

    enum AnimationType {
        case present
        case dimiss
    }
}

extension AnimationController: UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        .init(exactly: animationDuration) ?? 0
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromViewController = transitionContext.viewController(forKey: .from),
            let toViewController = transitionContext.viewController(forKey: .to)
        else {
            transitionContext.completeTransition(false)
            return
        }

        switch animationType {
        case .present:
            transitionContext.containerView.addSubview(toViewController.view)
            presentViewController(with: transitionContext, viewToAnimate: toViewController.view)
        case .dimiss:
            print("Implement dismiss")
        }
    }

    func presentViewController(with transitionContext: UIViewControllerContextTransitioning, viewToAnimate: UIView) {
        viewToAnimate.clipsToBounds = true
        viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)

        let duration = transitionDuration(using: transitionContext)

        UIView.animate(
            withDuration: duration,
            delay: 0,
            usingSpringWithDamping: 0.80,
            initialSpringVelocity: 0.1,
            options: .curveEaseOut,
            animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            },
            completion: { _ in
                transitionContext.completeTransition(true)
            }
        )
    }
}
