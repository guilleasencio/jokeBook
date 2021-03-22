//
//  JokeTypeListPresenter.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

protocol JokeTypeListPresentationLogic {
  func presentLoadData(response: JokeTypeList.Data.Response)
  func presentSelectCell(response: JokeTypeList.SelectCell.Response)
}

class JokeTypeListPresenter: JokeTypeListPresentationLogic {
  
  // MARK: - Properties
  
  weak var viewController: JokeTypeListDisplayLogic?
  
  // MARK: - Public
  
  func presentLoadData(response: JokeTypeList.Data.Response) {
    let viewData = createJokeTypeData(types: response.types)
    let viewModel = JokeTypeList.Data.ViewModel(data: viewData)
    viewController?.displayLoadData(viewModel: viewModel)
  }
  
  func presentSelectCell(response: JokeTypeList.SelectCell.Response) {
    let viewModel = JokeTypeList.SelectCell.ViewModel()
    viewController?.displaySelectCell(viewModel: viewModel)
  }
  
  // MARK: - Private
  
  private func createJokeTypeData(types: [JokeType]) -> [JokeTypeViewCellData] {
    types.compactMap({ createJokeTypeViewCellData($0) })
  }
  
  private func createJokeTypeViewCellData(_ type: JokeType) -> JokeTypeViewCellData {
    JokeTypeViewCellData(image: getJobTypeImage(type),
                         title: getJobTypeTitle(type))
  }
  
  private func getJobTypeImage(_ type: JokeType) -> String {
    switch type {
      case .general:
        return "general"
      case .knockKnock:
        return "knock-knock"
      case .programming:
        return "programming"
    }
  }
  
  private func getJobTypeTitle(_ type: JokeType) -> String {
    switch type {
      case .general:
        return "General"
      case .knockKnock:
        return "Knock-Knock"
      case .programming:
        return "Programming"
    }
  }
}
