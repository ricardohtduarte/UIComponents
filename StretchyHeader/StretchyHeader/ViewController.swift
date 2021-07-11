//
//  ViewController.swift
//  StretchyHeader
//
//  Created by Ricardo Duarte on 09/07/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    let dataSource: [String] = [
        "TableItem 1",
        "TableItem 1",
        "TableItem 1",
        "TableItem 1",
        "TableItem 1",
        "TableItem 1",
        "TableItem 1",
        "TableItem 1",
        "TableItem 1",
        "TableItem 1",
        "TableItem 1",
        "TableItem 1",
        "TableItem 1",
        "TableItem 1",
        "TableItem 1",
        "TableItem 1",
        "TableItem 1",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self

        let header = StretchyHeader(frame: .init(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))

        header.imageView.image = UIImage(named: "tame")
        tableView.tableHeaderView = header
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StretchyHeader else {
            return
        }
        header.scrollViewDidScroll(scrollView: tableView)
    }
}


final class StretchyHeader: UIView {
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private var imageViewHeight = NSLayoutConstraint()
    private var imageViewBottom = NSLayoutConstraint()
    private var containerView = UIView()
    private var containerViewHeight = NSLayoutConstraint()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
        setViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createViews() {
        addSubview(containerView)
        containerView.addSubview(imageView)
    }

    private func setViewConstraints() {
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: containerView.widthAnchor),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            heightAnchor.constraint(equalTo: containerView.heightAnchor)
        ])

        containerView.translatesAutoresizingMaskIntoConstraints = false

        containerView.widthAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: heightAnchor)
        containerViewHeight.isActive = true

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewBottom = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        imageViewBottom.isActive = true

        imageViewHeight = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        imageViewHeight.isActive = true
    }

    public func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
}
