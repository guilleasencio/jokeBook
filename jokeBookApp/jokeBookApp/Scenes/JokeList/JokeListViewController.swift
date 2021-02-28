//
//  JokeListViewController.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

protocol JokeListDisplayLogic: class {
  func displayStaticData(viewModel: JokeList.StaticData.ViewModel)
  func displayData(viewModel: JokeList.Data.ViewModel)
  func displaySelectJoke(viewModel: JokeList.SelectJoke.ViewModel)
}

class JokeListViewController: UIViewController, JokeListDisplayLogic {
  
  // MARK: - Properties
  
  var interactor: JokeListBusinessLogic?
  var router: (NSObjectProtocol & JokeListRoutingLogic & JokeListDataPassing)?
  
  private let sceneView = JokeListView()

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
    let interactor = JokeListInteractor()
    let presenter = JokeListPresenter()
    let router = JokeListRouter()
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
    doLoadStaticData()
  }
  
  // MARK: - Private
  
  private func setupNavigationBar() {
    navigationItem.title = "Joke List"
    let backButtonView = BackBarButtonItem()
    backButtonView.delegate = self
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButtonView)
  }
  
  private func setupComponents() {
//    sceneView.delegate = self
  }
  
  // MARK: - Output
  
  func doLoadStaticData() {
    let request = JokeList.StaticData.Request()
    interactor?.doLoadStaticData(request: request)
  }
  
  func doLoadData() {
    let request = JokeList.Data.Request()
    interactor?.doLoadData(request: request)
  }
  
  func doSelectJoke(index: Int) {
    let request = JokeList.SelectJoke.Request(index: index)
    interactor?.doSelectJoke(request: request)
  }
  
  // MARK: - Input
  
  func displayStaticData(viewModel: JokeList.StaticData.ViewModel) {
    navigationItem.title = viewModel.title
    doLoadData()
  }
  
  func displayData(viewModel: JokeList.Data.ViewModel) {
    
  }
  
  func displaySelectJoke(viewModel: JokeList.SelectJoke.ViewModel) {
    
  }
}

// MARK: - BackBarButtonItemDelegate

extension JokeListViewController: BackBarButtonItemDelegate {
  
  func backBarButtonItemDidPress(_ button: BackBarButtonItem) {
    router?.routeToBack()
  }
}
