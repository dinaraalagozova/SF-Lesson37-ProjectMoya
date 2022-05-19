//
//  NewsFeedViewController.swift
//  SF-Lesson37-ProjectMoya
//
//  Created by Dinara Alagozova on 06.05.2022.
//

import UIKit
import Moya

class NewsFeedViewController: UIViewController {
    // MARK: - View states
    private var state: State = .loading {
      didSet {
        switch state {
        case .ready:
          viewMessage.isHidden = true
          newsFeedTableView.isHidden = false
          newsFeedTableView.reloadData()
        case .loading:
          newsFeedTableView.isHidden = true
          viewMessage.isHidden = false
          labelMessage.text = "Getting news ..."
          imageMessage.image = UIImage(named: "Wait")
        case .error:
          newsFeedTableView.isHidden = true
          viewMessage.isHidden = false
          labelMessage.text = """
                              Something went wrong!
                              Try again later.
                            """
          imageMessage.image = UIImage(named: "Error")
        }
      }
    }
    
    let provider = MoyaProvider<NewsFeed>()
    
    // MARK: - Outlets
    @IBOutlet weak var newsFeedTableView: UITableView!
    @IBOutlet weak var viewMessage: UIView!
    @IBOutlet weak var imageMessage: UIImageView!
    @IBOutlet weak var labelMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        state = .loading

        provider.request(.education) { [weak self] result in
          guard let self = self else { return }

          switch result {
          case .success(let response):
            do {
              self.state = .ready(try response.map(NewsResponse<News>.self).data.results)
            } catch {
              self.state = .error
            }
          case .failure:
            self.state = .error
          }
        }
      }
}

extension NewsFeedViewController {
    enum State {
        case loading
        case ready([News])
        case error
    }
}
// MARK: - UITableView Delegate and DataSource
extension NewsFeedViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseIdentifier, for: indexPath) as? NewsCell ?? NewsCell()

        guard case .ready(let items) = state else { return cell }

        cell.configureWith(items[indexPath.item])

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard case .ready(let items) = state else {return 0}
        return items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard case .ready(let items) = state else { return }

        let newsVC = NewsViewController.instantiate(news: items[indexPath.item])
        navigationController?.pushViewController(newsVC, animated: true)
    }
}
