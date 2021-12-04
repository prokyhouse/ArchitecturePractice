//
//  FeedTableViewController.swift
//  ArchitecturePractice
//
//  Created by ilya bolotov on 27.11.2021.
//

import UIKit

class FeedTableViewController: UITableViewController {
    
    private enum Constants {
        static let reuseIdentifier = "Cell"
        static let textBack = "Log out"
        static let title = "Feed"
        
        static let separatorInsetLeftEdge: CGFloat = 80
        static let separatorInsetRightEdge: CGFloat = 80
        static let separatorInsetTopEdge: CGFloat = 0
        static let separatorInsetBottomEdge: CGFloat = 0
        static let heightForRowAt: CGFloat = 90
        static let waitSeconds: Double = 2.0
    }
    
    var feeds = Feed().getSampleData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        tableView.separatorInset = UIEdgeInsets(top: Constants.separatorInsetTopEdge,
                                                left: Constants.separatorInsetLeftEdge,
                                                bottom: Constants.separatorInsetBottomEdge,
                                                right: Constants.separatorInsetRightEdge)
        let logOut = UIBarButtonItem(title: Constants.textBack, style: .plain, target: self, action: #selector(logOut))
        navigationItem.leftBarButtonItem = logOut
        navigationItem.title = Constants.title
        
        tableView.refreshControl = refreshCntrl
    }
    
    @objc
    private func logOut() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath) as! FeedTableViewCell
        let feed = feeds[indexPath.row]
        cell.setup(with: feed)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.heightForRowAt
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let feed = feeds[indexPath.row]
        let postModel = BlogPostModel()
        postModel.setData(imageName: feed.getImage(), title: feed.getTitle(), author: feed.getAuthor(), text: feed.getDescription())
        let postVC = BlogPostViewController(model: postModel)
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    // MARK: - Эмуляция загрузки данных из сети
    
    let refreshCntrl: UIRefreshControl = {
        let refreshCntrl = UIRefreshControl()
        refreshCntrl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshCntrl
    }()
    
    @objc private func refresh() {
        run(after: Constants.waitSeconds) {
            self.feeds = Feed().getUpdateData()
            self.tableView.reloadData()
            self.refreshCntrl.endRefreshing()
        }
    }
    
    private func run(after wait: TimeInterval, closure: @escaping () -> Void) {
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
    }
}
