//
//  JokeTypeListViewController.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

protocol JokeTypeListDisplayLogic: class {
  func displayLoadData(viewModel: JokeTypeList.Data.ViewModel)
  func displaySelectCell(viewModel: JokeTypeList.SelectCell.ViewModel)
}

class JokeTypeListViewController: UIViewController, JokeTypeListDisplayLogic {
  
  // MARK: - Properties
  
  var interactor: JokeTypeListBusinessLogic?
  var router: (NSObjectProtocol & JokeTypeListRoutingLogic & JokeTypeListDataPassing)?
  
  private let sceneView = JokeTypeListView()

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = JokeTypeListInteractor()
    let presenter = JokeTypeListPresenter()
    let router = JokeTypeListRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: View lifecycle
  
  override func loadView() {
    view = sceneView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    setupComponents()
    doLoadData()
  }
  
  // MARK: - Private
  
  private func setupNavigationBar() {
    navigationItem.title = "Joke Type List"
    navigationController?.setNavigationBarHidden(false, animated: false)
    let backButtonView = BackBarButtonItem()
    backButtonView.delegate = self
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButtonView)
  }
  
  private func setupComponents() {
    sceneView.delegate = self
  }
  
  // MARK: - Output
  
  func doLoadData() {
    let request = JokeTypeList.Data.Request()
    interactor?.doLoadData(request: request)
  }
  
  func doSelectCell(index: Int) {
    let request = JokeTypeList.SelectCell.Request(index: index)
    interactor?.doSelectCell(request: request)
  }
  
  // MARK: - Input
  
  func displayLoadData(viewModel: JokeTypeList.Data.ViewModel) {
    sceneView.setupUI(data: viewModel.data)
  }
  
  func displaySelectCell(viewModel: JokeTypeList.SelectCell.ViewModel) {
    router?.routeToJokeList()
  }
}

// MARK: - BackBarButtonItemDelegate

extension JokeTypeListViewController: BackBarButtonItemDelegate {
  
  func backBarButtonItemDidPress(_ button: BackBarButtonItem) {
    router?.routeToBack()
  }
}

// MARK: - JokeTypeListViewDelegate

extension JokeTypeListViewController: JokeTypeListViewDelegate {
  
  func jokeTypeListViewDidTapCell(_ view: JokeTypeListView, index: Int) {
    doSelectCell(index: index)
  }
}
