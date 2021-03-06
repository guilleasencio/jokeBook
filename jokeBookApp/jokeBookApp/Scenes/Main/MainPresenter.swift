//
//  MainPresenter.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

protocol MainPresentationLogic {
  func presentLoadData(response: Main.Data.Response)
}

class MainPresenter: MainPresentationLogic {
  
  // MARK: - Properties
  
  weak var viewController: MainDisplayLogic?
  
  // MARK: Public
  
  func presentLoadData(response: Main.Data.Response) {
    let data = MainViewData(buttonText: "Let's start joking time!")
    let viewModel = Main.Data.ViewModel(data: data)
    viewController?.displayLoadData(viewModel: viewModel)
  }
}
