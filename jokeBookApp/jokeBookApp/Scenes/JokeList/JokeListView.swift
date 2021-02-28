//
//  JokeListView.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

protocol JokeListViewDelegate: class {
  func jokeListViewDidTapCell(_ view: JokeListView, index: Int)
  func jokeListViewDidTapRetryButton(_ view: JokeListView)
}

struct JokeListViewData {
  let cellData: [JokeListTableViewCellData]
}

class JokeListView: UIView {
  
  // MARK: - Constants
  
  private struct ViewTraits {
    // Margins
    static let tableBottomInset: CGFloat = 20.0
    // Size
    static let loaderSize: CGFloat = 50.0
    static let estimatedRowHeight: CGFloat = 100.0
  }
  
  // MARK: - Properties
  
  weak var delegate: JokeListViewDelegate?
  
  private let tableView = UITableView(frame: .zero, style: .grouped)
  private let loaderView = LoaderView()
  private let screenLoadErrorView = ScreenLoadErrorView()
  
  private var tableCellData: [JokeListTableViewCellData] = []
  
  // MARK: - Lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupComponents()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Public
  
  func setState(state: JokeListViewState) {
    switch state {
      case .jokeList(let data):
        tableView.isHidden = false
        screenLoadErrorView.isHidden = true
        loaderView.stopAnimating()
        loaderView.isHidden = true
        tableCellData = data
        tableView.reloadData()
      case .error:
        tableView.isHidden = true
        screenLoadErrorView.isHidden = false
        loaderView.stopAnimating()
        loaderView.isHidden = true
      case .loading:
        tableView.isHidden = true
        screenLoadErrorView.isHidden = true
        loaderView.isHidden = false
        loaderView.startAnimating()
    }
  }
  
  // MARK: - Private
  
  private func setupComponents() {
    backgroundColor = .white
    
    screenLoadErrorView.isHidden = true
    screenLoadErrorView.delegate = self
    
    loaderView.isHidden = true
    
    tableView.dataSource = self
    tableView.delegate = self
    tableView.backgroundColor = nil
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = ViewTraits.estimatedRowHeight
    tableView.separatorStyle = .singleLine
    tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ViewTraits.tableBottomInset, right: 0)
    tableView.register(JokeListTableViewCell.self,
                       forCellReuseIdentifier: JokeListTableViewCell.reuseIdentifier)
    
    addSubviewForAutolayout(tableView)
    addSubviewForAutolayout(screenLoadErrorView)
    addSubviewForAutolayout(loaderView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      
      loaderView.heightAnchor.constraint(equalToConstant: ViewTraits.loaderSize),
      loaderView.widthAnchor.constraint(equalToConstant: ViewTraits.loaderSize),
      loaderView.centerXAnchor.constraint(equalTo: centerXAnchor),
      loaderView.centerYAnchor.constraint(equalTo: centerYAnchor),
      
      screenLoadErrorView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      screenLoadErrorView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      screenLoadErrorView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      screenLoadErrorView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

// MARK: - ScreenLoadErrorViewDelegate
 
extension JokeListView: ScreenLoadErrorViewDelegate {
  
  func screenLoadErrorViewDidTapRetry(_ view: ScreenLoadErrorView) {
    delegate?.jokeListViewDidTapRetryButton(self)
  }
}

// MARK: - UITableViewDataSource

extension JokeListView: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    tableCellData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let reuseId = JokeListTableViewCell.reuseIdentifier
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath)
    guard let jokeCell = cell as? JokeListTableViewCell else {
      return cell
    }
    jokeCell.setupUI(data: tableCellData[indexPath.row])
    return jokeCell
  }
}

// MARK: - UITableViewDelegate

extension JokeListView: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)
    guard tableView.cellForRow(at: indexPath) as? JokeListTableViewCell != nil else {
      return
    }
    delegate?.jokeListViewDidTapCell(self, index: indexPath.row)
  }
}
