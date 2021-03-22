//
//  MainModels.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

// MARK: - Use cases

enum Main {
  enum Data {
    struct Request {
    }
    
    struct Response {
    }
    
    struct ViewModel {
      let data: MainViewData
    }
  }
}

// MARK: - View Models

struct MainViewData {
  let buttonText: String
}
