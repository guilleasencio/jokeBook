//
//  JokePunchlineModels.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

// MARK: - Use cases

enum JokePunchline {
  enum Data {
    struct Request {
    }
    
    struct Response {
      let punchline: String
    }
    
    struct ViewModel {
      let data: JokePunchlineViewData
    }
  }
}

// MARK: - View models

struct JokePunchlineViewData {
  let punchline: String
}
