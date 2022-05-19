//
//  News.swift
//  SF-Lesson37-ProjectMoya
//
//  Created by Dinara Alagozova on 06.05.2022.
//

import Foundation

struct News: Codable {
    let id: String
    let title: String
    let description: String
    let thumbnail: Thumbnail
}

extension News: CustomDebugStringConvertible {
  var debugDescription: String {
    return "<News:\(id)> \(title)"
  }
}

extension News {
  struct Thumbnail: Codable {
    let path: String
    let `extension`: String

    var url: URL {
      return URL(string: path + "." + `extension`)!
    }
  }
}

extension News {
  struct Date: Codable {
    let type: String
    let date: String
  }
}

//extension Comic {
//  struct CharactersInfo: Codable {
//    let available: Int
//    let items: [Character]
//  }
//
//  struct Character: Codable {
//    let resourceURI: URL
//    let name: String
//  }
//}
