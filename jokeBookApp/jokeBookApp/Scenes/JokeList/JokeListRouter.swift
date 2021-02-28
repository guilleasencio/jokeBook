//
//  JokeListRouter.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

protocol JokeListRoutingLogic {
  func routeToBack()
  func routeToJokePunchline()
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
  
  func routeToJokePunchline() {
    let destinationVC = JokePunchlineViewController()
    if let sourceDS = dataStore, var destinationDS = destinationVC.router?.dataStore {
      destinationDS.selectedJoke = sourceDS.selectedJoke
    }
    viewController?.navigationController?.pushViewController(destinationVC, animated: true)
  }
}
