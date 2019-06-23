//
//  ViewController.swift
//  InfiniteScroll
//
//  Created by Ricardo Duarte on 16/06/2019.
//  Copyright © 2019 Ricardo Duarte. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var tableContent: [String] = []
    private var isFetching = false

    override func viewDidLoad() {
        super.viewDidLoad()
        populateTableContent()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    func populateTableContent() {
        let batch = 2
        tableContent.append(contentsOf: (tableContent.count...tableContent.count + batch).map { "Item \($0)" })
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height {
            fetch()
        }
    }
    
    func fetch() {
        isFetching = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.populateTableContent()
            self.isFetching = false
            self.tableView.reloadData()
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = tableContent[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if isFetching {
            let spinner = UIActivityIndicatorView(style: .gray)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            
            self.tableView.tableFooterView = spinner
            self.tableView.tableFooterView?.isHidden = false
        }
    }
}

