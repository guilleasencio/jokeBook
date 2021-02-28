//
//  MainViewController.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

protocol MainDisplayLogic: class {
  func displayLoadData(viewModel: Main.Data.ViewModel)
}

class MainViewController: UIViewController, MainDisplayLogic {
  
  // MARK: - Properties
  
  var interactor: MainBusinessLogic?
  var router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)?

  private let sceneView = MainView()
  
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
    let interactor = MainInteractor()
    let presenter = MainPresenter()
    let router = MainRouter()
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
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.setNavigationBarHidden(true, animated: false)
    sceneView.playAnimation()
  }
  
  // MARK: - Private
  
  private func setupNavigationBar() {
    navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  private func setupComponents() {
    sceneView.delegate = self
  }
  
  // MARK: - Output
    
  func doLoadData() {
    let request = Main.Data.Request()
    interactor?.doLoadData(request: request)
  }
  
  // MARK: - Input
  
  func displayLoadData(viewModel: Main.Data.ViewModel) {
    sceneView.setupUI(data: viewModel.data)
  }
}

// MARK: - MainViewDelegate

extension MainViewController: MainViewDelegate {
  
  func mainViewDidTapButton(_ view: MainView) {
    router?.routeToJokeTypeList()
  }
}
