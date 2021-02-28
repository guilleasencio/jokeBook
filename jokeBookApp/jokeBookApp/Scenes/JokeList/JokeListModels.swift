//
//  JokeListModels.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

// MARK: - Use cases

enum JokeList {
  
  enum StaticData {
    struct Request {
    }
    
    struct Response {
      let jokeType: JokeType
    }
    
    struct ViewModel {
      let title: String
    }
  }
  
  enum Data {
    struct Request {
    }
    
    struct Response {
      let state: JokeListState
    }
    
    struct ViewModel {
      let state: JokeListViewState
    }
  }
  
  enum SelectJoke {
    struct Request {
      let index: Int
    }
    
    struct Response {
    }
    
    struct ViewModel {
    }
  }
}

// MARK: - Business models

enum JokeListState {
  case loading
  case jokeList(data: [JokeEntity])
  case error
}

// MARK: - View models

enum JokeListViewState {
  case loading
  case jokeList(data: [JokeListTableViewCellData])
  case error
}
