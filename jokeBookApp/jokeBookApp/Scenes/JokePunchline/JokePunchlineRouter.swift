//
//  JokePunchlineRouter.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

protocol JokePunchlineRoutingLogic {
  func routeToBack()
}

protocol JokePunchlineDataPassing {
  var dataStore: JokePunchlineDataStore? { get }
}

class JokePunchlineRouter: NSObject, JokePunchlineRoutingLogic, JokePunchlineDataPassing {
  
  // MARK: - Properties

  weak var viewController: JokePunchlineViewController?
  var dataStore: JokePunchlineDataStore?
  
  // MARK: Routing
  
  func routeToBack() {
    viewController?.navigationController?.popViewController(animated: true)
  }
}
