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
    }

    let feeds = Feed().getSampleData()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(FeedTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
		tableView.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 16)
        let logOut = UIBarButtonItem(title: Constants.textBack, style: .plain, target: self, action: #selector(logOut))
		navigationItem.leftBarButtonItem = logOut
        navigationItem.title = Constants.title
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
        return 90
    }

     // MARK: - Table view delegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let feed = feeds[indexPath.row]
		let postModel = BlogPostModel()
        postModel.setData(imageName: feed.getImage(), title: feed.getTitle(), author: feed.getAuthor(), text: feed.getDescription())
        let postVC = BlogPostViewController(model: postModel)
        navigationController?.pushViewController(postVC, animated: false)
    }
}
