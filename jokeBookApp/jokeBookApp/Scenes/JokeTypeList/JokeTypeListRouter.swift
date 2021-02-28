//
//  JokeTypeListRouter.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

protocol JokeTypeListRoutingLogic {
  func routeToBack()
  func routeToJokeList()
}

protocol JokeTypeListDataPassing {
  var dataStore: JokeTypeListDataStore? { get }
}

class JokeTypeListRouter: NSObject, JokeTypeListRoutingLogic, JokeTypeListDataPassing {
  
  // MARK: - Properties
  
  weak var viewController: JokeTypeListViewController?
  var dataStore: JokeTypeListDataStore?
  
  // MARK: Routing
  
  func routeToBack() {
    viewController?.navigationController?.popViewController(animated: true)
  }
  
  func routeToJokeList() {
    
  }
}
