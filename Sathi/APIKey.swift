//
//  APIKey.swift
//  Sathi
//
//  Created by Damber Bokati on 09/18/24.
//

import Foundation

enum APIKey {
  // Fetch the API key from `GeminiAPI-info.plist`
  static var `default`: String {
    guard let filePath = Bundle.main.path(forResource: "GeminiAPI-info", ofType: "plist")
    else {
      fatalError("Couldn't find file 'GenerativeAI-Info.plist'.")
    }
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let value = plist?.object(forKey: "API_KEY") as? String else {
      fatalError("Couldn't find key 'API_KEY' in 'GeminiAPI-info.plist'.")
    }
    if value.starts(with: "_") {
      fatalError(
        "Follow the instructions at https://ai.google.dev/tutorials/setup to get an API key."
      )
    }
    return value
  }
}
