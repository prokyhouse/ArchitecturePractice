//
//  FeedModel.swift
//  ArchitecturePractice
//
//  Created by ilya bolotov on 27.11.2021.
//

import Foundation

final class Feed {
    var title: String?
    var description: String?
    var author: String?
    var image: String?
    
    func setData(title: String, description: String, author: String, image: String) {
        self.title = title
        self.description = description
        self.author = author
        self.image = image
    }
    
    func getTitle() -> String {
        guard let title = self.title else {
            return "Title"
        }
        return title
    }
    
    func getDescription() -> String {
        guard let description = self.description else {
            return "Description"
        }
        return description
    }
    
    func getImage() -> String {
        guard let image = self.image else {
            return "1.jpg"
        }
        return image
    }
    
    func getAuthor() -> String {
        guard let author = author else {
            return "Author"
        }
        return author
    }
    
    func getSampleData() -> [Feed] {
        var feeds: [Feed] = []
        for i in 1...4 {
            let feed = Feed()
            feed.setData(title: "Title Feed \(i)", description: "Labore sunt veniam amet est. Minim nisi dolor eu ad incididunt cillum elit ex ut. Dolore exercitation nulla tempor consequat aliquip occaecat. Nisi id ipsum irure aute. Deserunt sit aute irure quis nulla eu consequat fugiat Lorem sunt magna et consequat labore. Laboris incididunt id Lorem est duis deserunt nisi dolore eiusmod culpa exercitation consectetur", author: "Author \(i)", image: "\(i).jpg")
            feeds.append(feed)
        }
        
        return feeds
    }
    
    func getUpdateData() -> [Feed] {
        var feeds: [Feed] = []
        for i in stride(from: 4, to: 0, by: -1) {
            let feed = Feed()
            feed.setData(title: "Title Feed \(i)", description: "Labore sunt veniam amet est. Minim nisi dolor eu ad incididunt cillum elit ex ut. Dolore exercitation nulla tempor consequat aliquip occaecat. Nisi id ipsum irure aute. Deserunt sit aute irure quis nulla eu consequat fugiat Lorem sunt magna et consequat labore. Laboris incididunt id Lorem est duis deserunt nisi dolore eiusmod culpa exercitation consectetur", author: "Author \(i)", image: "\(i).jpg")
            feeds.append(feed)
        }
        
        return feeds
    }
}

