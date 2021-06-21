//
//  AmiiboAPI.swift
//  AmiiboTableView
//
//  Created by Дмитрий Геращенко on 02.02.2021.
//  Copyright © 2021 Дмитрий Геращенко. All rights reserved.
//

import Foundation

final class AmiiboAPI {
  
  static let shared = AmiiboAPI()
  
  func fetchAmiiboList(onCompletion: @escaping ([Amiibo]) -> () ) {
    let urlString = "https://www.amiiboapi.com/api/amiibo"
    guard let url = URL(string: urlString) else {
      fatalError("Cannot fetch data from \(urlString) with \(Error.self)")}
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      
      guard let data = data else { fatalError("No availible data.") }
      
      guard let amiiboList = try? JSONDecoder().decode(AmiiboList.self, from: data) else {
        fatalError("Cannot decode JSON data.")
      }
      
      onCompletion(amiiboList.amiibo)
    }
    task.resume()
  }
}

struct AmiiboList: Codable {
  let amiibo: [Amiibo]
}

struct Amiibo: Codable {
  let amiiboSeries: String
  let character: String
  let gameSeries: String
  let head: String
  let image: String
  let name: String
  let release: AmiiboRelease
  let tail: String
  let type: String
}

struct AmiiboRelease: Codable {
  let au: String?
  let eu: String?
  let jp: String?
  let na: String?
}

/*
 "amiiboSeries": "Super Mario Bros.",
 "character": "Mario",
 "gameSeries": "Super Mario",
 "head": "00000000",
 "image": "https://raw.githubusercontent.com/N3evin/AmiiboAPI/master/images/icon_00000000-00340102.png",
 "name": "Mario",
 "release": {
 "au": "2015-03-21",
 "eu": "2015-03-20",
 "jp": "2015-03-12",
 "na": "2015-03-20"
 },
 "tail": "00340102",
 "type": "Figure"
 */
