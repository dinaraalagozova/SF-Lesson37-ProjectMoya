//
//  NewsCell.swift
//  SF-Lesson37-ProjectMoya
//
//  Created by Dinara Alagozova on 06.05.2022.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {
    public static let reuseIdentifier = "NewsCell"
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    public func configureWith(_ news: News) {
        titleLabel.text = news.title
        descriptionLabel.text = news.description 
        newsImageView.kf.setImage(with: news.thumbnail.url,
                                  options: [.transition(.fade(0.3))])
    }
}
