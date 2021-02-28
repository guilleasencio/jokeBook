//
//  JokeListInteractor.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

protocol JokeListBusinessLogic {
  func doLoadStaticData(request: JokeList.StaticData.Request)
  func doLoadData(request: JokeList.Data.Request)
  func doSelectJoke(request: JokeList.SelectJoke.Request)
}

protocol JokeListDataStore {
  var selectedJokeType: JokeType? { get set }
  var selectedJoke: JokeEntity? { get }
}

class JokeListInteractor: JokeListBusinessLogic, JokeListDataStore {
 
  // MARK: - Properties
  
  var presenter: JokeListPresentationLogic?
  var jokesApi: JokesAPI?
  
  var selectedJokeType: JokeType?
  private(set) var selectedJoke: JokeEntity?
  
  var jokes: [JokeEntity] = []

  // MARK: - Public
  
  func doLoadStaticData(request: JokeList.StaticData.Request) {
    guard let jokeType = selectedJokeType else {
      return
    }
    let response = JokeList.StaticData.Response(jokeType: jokeType)
    presenter?.presentStaticData(response: response)
  }
  
  func doLoadData(request: JokeList.Data.Request) {
    guard let jokeType = selectedJokeType else {
      return
    }
    
    let response = JokeList.Data.Response(state: .loading)
    presenter?.presentData(response: response)
    
    let parameters = GetJokesParameters(type: jokeType)
    jokesApi?.getJokes(parameters: parameters) { [weak self] result in
      guard let self = self else {
        return
      }
      let state: JokeListState
      switch result {
        case .success(let entities):
          self.jokes = entities
          state = .jokeList(data: entities)
        case .failure:
          state = .error
      }
      let response = JokeList.Data.Response(state: state)
      self.presenter?.presentData(response: response)
    }
  }
  
  func doSelectJoke(request: JokeList.SelectJoke.Request) {
    guard let joke = jokes[safe: request.index] else {
      return
    }
    self.selectedJoke = joke
    let response = JokeList.SelectJoke.Response()
    presenter?.presentSelectJoke(response: response)
  }
}
