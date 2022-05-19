//
//  NewsFeed.swift
//  SF-Lesson37-ProjectMoya
//
//  Created by Dinara Alagozova on 06.05.2022.
//

import Foundation
import Moya

public enum NewsFeed {
    // My NewsApi private API key
    static private let privateApiKey = "fc061a3ffb11444f919462969e5bd57d"
    // Represents the only endpoint to hit in News API
    case education
}

extension NewsFeed: TargetType {

  public var baseURL: URL {
    return URL(string: "https://newsapi.org/v2")!
  }

  public var path: String {
    switch self {
    case .education:
        return "/everything"
    }
  }

  public var method: Moya.Method {
    switch self {
    case .education:
        return .get
    }
  }

  public var sampleData: Data {
    return Data()
  }

  public var task: Task {
      return .requestParameters(parameters: ["q": "education",
                                             "language": "en",
                                             "pageSize": "10"],
                                encoding: URLEncoding.default)
  }

  public var headers: [String: String]? {
    return ["Content-Type": "application/json"]
  }

  public var validationType: ValidationType {
    return .successCodes
  }
    
}
