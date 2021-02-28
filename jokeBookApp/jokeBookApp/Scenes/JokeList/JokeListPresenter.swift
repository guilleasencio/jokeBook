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
    let state: JokeListViewState
    switch response.state {
      case .loading:
        state = .loading
      case .jokeList(let data):
        state = .jokeList(data: createTableData(data: data))
      case .error:
        state = .error
    }
    let viewModel = JokeList.Data.ViewModel(state: state)
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
  
  private func createTableData(data: [JokeEntity]) -> [JokeListTableViewCellData] {
    data.map({ createTableCellData(data: $0) })
  }
  
  private func createTableCellData(data: JokeEntity) -> JokeListTableViewCellData {
    JokeListTableViewCellData(setup: data.setup)
  }
}
