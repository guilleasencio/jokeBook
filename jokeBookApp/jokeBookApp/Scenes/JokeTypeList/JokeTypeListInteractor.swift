//
//  JokeTypeListInteractor.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

protocol JokeTypeListBusinessLogic {
  func doLoadData(request: JokeTypeList.Data.Request)
}

protocol JokeTypeListDataStore {
  var selectedJoke: JokeType? { get }
}

class JokeTypeListInteractor: JokeTypeListBusinessLogic, JokeTypeListDataStore {
  
  // MARK: - Properties
  
  var presenter: JokeTypeListPresentationLogic?
  
  private(set) var selectedJoke: JokeType?
  private let jokeTypes: [JokeType] = [.general, .knockKnock, .programmming]
  
  // MARK: Public
  
  func doLoadData(request: JokeTypeList.Data.Request) {
    let response = JokeTypeList.Data.Response(types: jokeTypes)
    presenter?.presentLoadData(response: response)
  }
}
