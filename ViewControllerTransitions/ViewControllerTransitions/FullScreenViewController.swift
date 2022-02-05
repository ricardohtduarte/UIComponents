import UIKit

class FullScreenViewController: UIViewController {
    let imageView = UIImageView()

    init() {
        super.init(nibName: nil, bundle: nil)
        transitioningDelegate = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 300.0).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 300.0).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.image = UIImage(named: "album.png")
    }
}

extension FullScreenViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        AnimationController(animationDuration: 3.5, animationType: .present)
    }
}
