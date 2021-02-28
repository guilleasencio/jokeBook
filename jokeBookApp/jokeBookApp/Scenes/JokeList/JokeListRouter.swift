//
//  JokeListRouter.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

protocol JokeListRoutingLogic {
  func routeToBack()
}

protocol JokeListDataPassing {
  var dataStore: JokeListDataStore? { get }
}

class JokeListRouter: NSObject, JokeListRoutingLogic, JokeListDataPassing {
  
  // MARK: - Properties
  
  weak var viewController: JokeListViewController?
  var dataStore: JokeListDataStore?
  
  // MARK: Routing
  
  func routeToBack() {
    viewController?.navigationController?.popViewController(animated: true)
  }  
}
