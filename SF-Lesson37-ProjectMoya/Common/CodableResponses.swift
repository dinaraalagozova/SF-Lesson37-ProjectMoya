//
//  CodableResponses.swift
//  SF-Lesson37-ProjectMoya
//
//  Created by Dinara Alagozova on 06.05.2022.
//

import Foundation

struct NewsResponse<T: Codable>: Codable {
  let data: NewsResults<T>
}

struct NewsResults<T: Codable>: Codable {
  let results: [T]
}
