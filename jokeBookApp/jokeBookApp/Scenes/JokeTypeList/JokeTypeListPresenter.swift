//
//  JokeTypeListPresenter.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

protocol JokeTypeListPresentationLogic {
  func presentLoadData(response: JokeTypeList.Data.Response)
}

class JokeTypeListPresenter: JokeTypeListPresentationLogic {
  
  // MARK: - Properties
  
  weak var viewController: JokeTypeListDisplayLogic?
  
  // MARK: - Public
  
  func presentLoadData(response: JokeTypeList.Data.Response) {
    let viewModel = JokeTypeList.Data.ViewModel()
    viewController?.displayLoadData(viewModel: viewModel)
  }
}
