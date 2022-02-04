import UIKit

class ViewControllerB: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        transitioningDelegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

extension ViewControllerB: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        AnimationController(animationDuration: 3.5, animationType: .present)
    }
}
