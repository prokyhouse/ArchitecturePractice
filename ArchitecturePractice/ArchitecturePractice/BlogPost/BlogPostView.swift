//
//  BlogPostView.swift
//  ArchitecturePractice
//
//  Created by Кирилл Прокофьев on 27.11.2021.
//

import Foundation
import UIKit
import SnapKit

final class BlogPostView: UIView {
    
    private enum Metrics {
        static let imageCornerRadius = CGFloat(8)
        static let largeFontSize = CGFloat(30)
        static let mediumFontSize = CGFloat(16)
        
        static let imageHeight = 180
        
        static let smallVerticalSpacing = 8
        static let mediumVerticalSpacing = 16
        static let largeVerticalSpacing = 32
        
        static let horizontalSpacing = 16
    }
    
    private lazy var imageBlock: UIImageView = {
        let obj = UIImageView()
        obj.backgroundColor = .gray
        obj.layer.cornerRadius = Metrics.imageCornerRadius
        obj.clipsToBounds = true
        obj.contentMode = .scaleAspectFill
        return obj
    }()
    
    private lazy var title: UILabel = {
        let obj = UILabel()
        obj.font = UIFont.systemFont(ofSize: Metrics.largeFontSize, weight: .medium)
        obj.adjustsFontSizeToFitWidth = true
        obj.textAlignment = .left
        return obj
    }()
    
    private lazy var author: UILabel = {
        let obj = UILabel()
        obj.font = UIFont.systemFont(ofSize: Metrics.mediumFontSize, weight: .semibold)
        obj.adjustsFontSizeToFitWidth = true
        obj.textAlignment = .left
        return obj
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var text: UILabel = {
        let obj = UILabel()
        obj.font = UIFont.systemFont(ofSize: Metrics.mediumFontSize, weight: .medium)
        obj.numberOfLines = 0
        obj.sizeToFit()
        obj.adjustsFontSizeToFitWidth = true
        obj.textAlignment = .left
        return obj
    }()
    
    func configure() {
        self.addSubviews()
        self.setConstraints()
    }
    
    private func addSubviews() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.imageBlock)
        self.scrollView.addSubview(self.title)
        self.scrollView.addSubview(self.author)
        self.scrollView.addSubview(self.text)
    }
    
    private func setConstraints() {
        
        self.scrollView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(Metrics.horizontalSpacing)
            make.top.equalTo(self.snp.topMargin)
            make.bottom.equalToSuperview().inset(Metrics.largeVerticalSpacing)
        }
        
        self.imageBlock.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.width.equalToSuperview()

            make.height.equalTo(Metrics.imageHeight)
        }
        
        self.title.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.imageBlock.snp.bottom).offset(Metrics.largeVerticalSpacing)
        }
        
        self.author.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.title.snp.bottom).offset(Metrics.smallVerticalSpacing)
        }
        
        self.text.snp.makeConstraints { make in
            make.top.equalTo(self.author.snp.bottom).offset(Metrics.mediumVerticalSpacing)
            make.width.equalToSuperview()
            
            make.bottom.equalToSuperview()
        }
    }
    
    func update(imageName: String, title: String?, author: String?, text: String?) {
        self.imageBlock.image = UIImage(named: imageName)
        self.title.text = title
        self.author.text = author
        self.text.text = text
    }
}
