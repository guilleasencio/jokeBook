//
//  JokePunchlineInteractor.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

protocol JokePunchlineBusinessLogic {
  func doLoadData(request: JokePunchline.Data.Request)
}

protocol JokePunchlineDataStore {
  var selectedJoke: JokeEntity? { get set }
}

class JokePunchlineInteractor: JokePunchlineBusinessLogic, JokePunchlineDataStore {
  
  // MARK: - Properties
  
  var presenter: JokePunchlinePresentationLogic?
  
  var selectedJoke: JokeEntity?
  
  // MARK: - Public
  
  func doLoadData(request: JokePunchline.Data.Request) {
    guard let joke = selectedJoke else {
      return
    }
    let response = JokePunchline.Data.Response(punchline: joke.punchline)
    presenter?.presentData(response: response)
  }
}
