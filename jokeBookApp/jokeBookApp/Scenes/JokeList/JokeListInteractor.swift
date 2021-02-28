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
}

class JokeListInteractor: JokeListBusinessLogic, JokeListDataStore {
 
  // MARK: - Properties
  
  var presenter: JokeListPresentationLogic?
  
  var selectedJokeType: JokeType?

  // MARK: - Public
  
  func doLoadStaticData(request: JokeList.StaticData.Request) {
    guard let jokeType = selectedJokeType else {
      return
    }
    let response = JokeList.StaticData.Response(jokeType: jokeType)
    presenter?.presentStaticData(response: response)
  }
  
  func doLoadData(request: JokeList.Data.Request) {
    let response = JokeList.Data.Response()
    presenter?.presentData(response: response)
  }
  
  func doSelectJoke(request: JokeList.SelectJoke.Request) {
    let response = JokeList.SelectJoke.Response()
    presenter?.presentSelectJoke(response: response)
  }
}
