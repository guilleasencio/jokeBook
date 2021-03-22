//
//  JokeTypeListInteractor.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

protocol JokeTypeListBusinessLogic {
  func doLoadData(request: JokeTypeList.Data.Request)
  func doSelectCell(request: JokeTypeList.SelectCell.Request)
}

protocol JokeTypeListDataStore {
  var selectedJokeType: JokeType? { get }
}

class JokeTypeListInteractor: JokeTypeListBusinessLogic, JokeTypeListDataStore {
  
  // MARK: - Properties
  
  var presenter: JokeTypeListPresentationLogic?
  
  private(set) var selectedJokeType: JokeType?
  private let jokeTypes: [JokeType] = [.general, .knockKnock, .programming]
  
  // MARK: Public
  
  func doLoadData(request: JokeTypeList.Data.Request) {
    let response = JokeTypeList.Data.Response(types: jokeTypes)
    presenter?.presentLoadData(response: response)
  }
  
  func doSelectCell(request: JokeTypeList.SelectCell.Request) {
    guard let jokeType = jokeTypes[safe: request.index] else {
      return
    }
    selectedJokeType = jokeType
    let response = JokeTypeList.SelectCell.Response()
    presenter?.presentSelectCell(response: response)
  }
}
