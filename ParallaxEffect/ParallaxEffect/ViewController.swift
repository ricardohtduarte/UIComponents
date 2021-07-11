//
//  ViewController.swift
//  ParallaxEffect
//
//  Created by Ricardo Duarte on 25/06/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    let dataSource: [String] = [
        "images-1",
        "images-2",
        "images-3",
        "images-4",
        "images-5",
        "images-6",
        "images-7"
    ]

    var parallaxOffsetSpeed: CGFloat = 30
    var cellHeight: CGFloat = 250

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.rowHeight = 200
        tableView.register(UINib(nibName: "ImageCell", bundle: nil), forCellReuseIdentifier: "ImageCell")
    }

    var parallaxImageHeight: CGFloat {
        let maxOffset = (sqrt(pow(cellHeight, 2) + 4 * parallaxOffsetSpeed + tableView.frame.height) - cellHeight) / 2
        return maxOffset + cellHeight
    }

    func parallaxOffset(newOffsetY: CGFloat, cell: UITableViewCell) -> CGFloat {
        (newOffsetY - cell.frame.origin.y) / parallaxImageHeight * parallaxOffsetSpeed
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as? ImageCell else {
            return UITableViewCell()
        }
        cell.configure(with: dataSource[indexPath.row])
        cell.landscapeHeight.constant = parallaxImageHeight
        cell.landscapeImageTopConstraint.constant = parallaxOffset(newOffsetY: tableView.contentOffset.y,
                                                                   cell: cell)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = tableView.contentOffset.y
        for cell in tableView.visibleCells as! [ImageCell] {
            cell.landscapeImageTopConstraint.constant = parallaxOffset(newOffsetY: tableView.contentOffset.y,
                                                                       cell: cell)
        }
    }
}

