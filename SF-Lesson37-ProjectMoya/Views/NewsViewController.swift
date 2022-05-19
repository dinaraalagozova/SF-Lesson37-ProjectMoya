//
//  NewsViewController.swift
//  SF-Lesson37-ProjectMoya
//
//  Created by Dinara Alagozova on 06.05.2022.
//

import UIKit
import Moya
import Kingfisher

class NewsViewController: UIViewController {
    // MARK: - Dependencies
    private var news: News?

    private var uploadResult: UploadResult?
    
    // MARK: - Outlets
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsDescription: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let news = news else { fatalError("Please pass in a valid Comic object") }

        layoutCard(news: news)
    }
}

// MARK: - News handling
extension NewsViewController {
  private func layoutCard(news: News) {
    newsTitle.text = news.title
    newsDescription.text = news.description
    newsImage.kf.setImage(with: news.thumbnail.url)
  }
}

// MARK: - Helpers
extension NewsViewController {
  static func instantiate(news: News) -> NewsViewController {
    guard let vc = UIStoryboard(name: "Main", bundle: nil)
      .instantiateViewController(withIdentifier: "NewsViewController") as? NewsViewController else { fatalError("Unexpectedly failed getting NewsViewController from Storyboard") }

    vc.news = news

    return vc
  }
}
