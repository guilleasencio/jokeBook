//
//  MainInteractor.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

protocol MainBusinessLogic {
  func doLoadData(request: Main.Data.Request)
}

protocol MainDataStore {
}

class MainInteractor: MainBusinessLogic, MainDataStore {
  
  // MARK: - Properties
  
  var presenter: MainPresentationLogic?
  
  // MARK: Public
  
  func doLoadData(request: Main.Data.Request) {
    let response = Main.Data.Response()
    presenter?.presentLoadData(response: response)
  }
}
