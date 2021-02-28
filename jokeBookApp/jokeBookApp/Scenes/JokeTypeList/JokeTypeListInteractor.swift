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
}

class JokeTypeListInteractor: JokeTypeListBusinessLogic, JokeTypeListDataStore {
  
  // MARK: - Properties
  
  var presenter: JokeTypeListPresentationLogic?
  
  // MARK: Public
  
  func doLoadData(request: JokeTypeList.Data.Request) {
    let response = JokeTypeList.Data.Response()
    presenter?.presentLoadData(response: response)
  }
}
