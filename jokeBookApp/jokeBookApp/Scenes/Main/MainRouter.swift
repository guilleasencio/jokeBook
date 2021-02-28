//
//  MainRouter.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

protocol MainRoutingLogic
{
  func routeToJokeTypeList()
}

protocol MainDataPassing {
  var dataStore: MainDataStore? { get }
}

class MainRouter: NSObject, MainRoutingLogic, MainDataPassing {
  
  // MARK: - Properties
  
  weak var viewController: MainViewController?
  var dataStore: MainDataStore?
  
  // MARK: Routing
  
  func routeToJokeTypeList() {
    let destinationVC = JokeTypeListViewController()
    viewController?.navigationController?.pushViewController(destinationVC, animated: true)
  }
}
