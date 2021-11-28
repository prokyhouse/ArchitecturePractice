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
    }
    
    let feeds = Feed.data

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        navigationItem.title = "Feed"
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
        return 70
    }

     // MARK: - Table view delegate
     
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let feed = feeds[indexPath.row]
		let postModel = BlogPostModel()
		postModel.setData(imageName: feed.image, title: feed.title, author: "ddd", text: feed.description)
        let postVC = BlogPostViewController(model: postModel)
        navigationController?.pushViewController(postVC, animated: false)
    }

}

