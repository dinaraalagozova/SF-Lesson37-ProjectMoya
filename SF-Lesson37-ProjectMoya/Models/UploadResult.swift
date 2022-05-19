//
//  UploadResult.swift
//  SF-Lesson37-ProjectMoya
//
//  Created by Dinara Alagozova on 06.05.2022.
//

import Foundation

struct UploadResult: Codable, CustomDebugStringConvertible {
  let deletehash: String
  let link: URL

  var debugDescription: String {
    return "<UploadResult:\(deletehash)> \(link)"
  }
}
