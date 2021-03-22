//
//  JokePunchlineViewController.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

protocol JokePunchlineDisplayLogic: class {
  func displayData(viewModel: JokePunchline.Data.ViewModel)
}

class JokePunchlineViewController: UIViewController, JokePunchlineDisplayLogic {
  
  // MARK: - Properties
  
  var interactor: JokePunchlineBusinessLogic?
  var router: (NSObjectProtocol & JokePunchlineRoutingLogic & JokePunchlineDataPassing)?
  
  private let sceneView = JokePunchlineView()

  // MARK: Object lifecycle
  
  override func loadView() {
    view = sceneView
  }
  
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
    let interactor = JokePunchlineInteractor()
    let presenter = JokePunchlinePresenter()
    let router = JokePunchlineRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar()
    doLoadData()
  }
  
  // MARK: - Private
  
  private func setupNavigationBar() {
    navigationItem.title = "Punchline!"
    let backButtonView = BackBarButtonItem()
    backButtonView.delegate = self
    navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButtonView)
  }
  
  // MARK: - Output
  
  func doLoadData() {
    let request = JokePunchline.Data.Request()
    interactor?.doLoadData(request: request)
  }
  
  // MARK: - Input
  
  func displayData(viewModel: JokePunchline.Data.ViewModel) {
    sceneView.setupUI(data: viewModel.data)
  }
}

// MARK: - BackBarButtonItemDelegate

extension JokePunchlineViewController: BackBarButtonItemDelegate {
  
  func backBarButtonItemDidPress(_ button: BackBarButtonItem) {
    router?.routeToBack()
  }
}
