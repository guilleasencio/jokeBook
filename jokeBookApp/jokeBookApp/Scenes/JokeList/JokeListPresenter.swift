//
//  JokeListPresenter.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

protocol JokeListPresentationLogic {
  func presentStaticData(response: JokeList.StaticData.Response)
  func presentData(response: JokeList.Data.Response)
  func presentSelectJoke(response: JokeList.SelectJoke.Response)
}

class JokeListPresenter: JokeListPresentationLogic {
  weak var viewController: JokeListDisplayLogic?
  
  // MARK: - Public
  
  func presentStaticData(response: JokeList.StaticData.Response) {
    let viewModel = JokeList.StaticData.ViewModel(title: getTitle(type: response.jokeType))
    viewController?.displayStaticData(viewModel: viewModel)
  }
  
  func presentData(response: JokeList.Data.Response) {
    let viewModel = JokeList.Data.ViewModel()
    viewController?.displayData(viewModel: viewModel)
  }
  
  func presentSelectJoke(response: JokeList.SelectJoke.Response) {
    let viewModel = JokeList.SelectJoke.ViewModel()
    viewController?.displaySelectJoke(viewModel: viewModel)
  }
  
  // MARK: - Private
  
  private func getTitle(type: JokeType) -> String {
    switch type {
      case .general:
        return "Joke List (General)"
      case .knockKnock:
        return "Joke List (Knock-knock)"
      case .programming:
        return "Joke List (Programming)"
    }
  }
}
