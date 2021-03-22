//
//  JokePunchlinePresenter.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

protocol JokePunchlinePresentationLogic {
  func presentData(response: JokePunchline.Data.Response)
}

class JokePunchlinePresenter: JokePunchlinePresentationLogic {
  
  // MARK: - Properties

  weak var viewController: JokePunchlineDisplayLogic?
  
  // MARK: - Public
  
  func presentData(response: JokePunchline.Data.Response) {
    let viewModel = JokePunchline.Data.ViewModel(data: JokePunchlineViewData(punchline: response.punchline))
    viewController?.displayData(viewModel: viewModel)
  }
}
