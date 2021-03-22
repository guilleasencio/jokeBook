//
//  JokeTypeListModels.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

// MARK: - Use cases

enum JokeTypeList {
  enum Data {
    struct Request {
    }
    
    struct Response {
      let types: [JokeType]
    }
    
    struct ViewModel {
      let data: [JokeTypeViewCellData]
    }
  }
  
  enum SelectCell {
    struct Request {
      let index: Int
    }
    
    struct Response {
    }
    
    struct ViewModel {
    }
  }
}
