//
//  JokeTypeListView.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

protocol JokeTypeListViewDelegate: class {
  func jokeTypeListViewDidTapCell(_ view: JokeTypeListView, index: Int)
}

class JokeTypeListView: UIView {
  
  // MARK: - Constants
  
  private struct ViewTraits {
    // Margins
    static let contentInset = UIEdgeInsets(top: 18.0, left: 0, bottom: 24.0, right: 0)
    static let cellSpacing: CGFloat = 18.0
     
    
    // Sizes
    static let itemWidth: CGFloat = UIScreen.main.bounds.width - 50.0
    static let titleLabelCellMiniumHeight: CGFloat = 50.0
  }
  
  // MARK: - Properties
  
  weak var delegate: JokeTypeListViewDelegate?
  
  private let layout = UICollectionViewFlowLayout()
  private let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
  private var viewData: [JokeTypeViewCellData] = []
  
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
  
  func setupUI(data: [JokeTypeViewCellData]) {
    viewData = data
    let height = calculateMaxHeight(width: ViewTraits.itemWidth)
    layout.itemSize = CGSize(width: ViewTraits.itemWidth, height: height)
    collectionView.reloadData()
  }
  
  private func setupComponents() {
    backgroundColor = .white
    
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = ViewTraits.cellSpacing
    
    collectionView.collectionViewLayout = layout
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.contentInset = ViewTraits.contentInset
    collectionView.backgroundColor = .clear
    collectionView.allowsSelection = true
    collectionView.register(JokeTypeViewCell.self, forCellWithReuseIdentifier: JokeTypeViewCell.reuseIdentifier)
    collectionView.dataSource = self
    collectionView.delegate = self
    
    addSubviewForAutolayout(collectionView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
  
  private func calculateMaxHeight(width: CGFloat) -> CGFloat {
    let dummyCell = JokeTypeViewCell()
    var maxHeight: CGFloat = 0
    for item in viewData {
      maxHeight = max(maxHeight, calculateHeight(dummyCell: dummyCell, width: width, data: item))
    }
    return maxHeight
  }
  
  private func calculateHeight(dummyCell: JokeTypeViewCell,
                               width: CGFloat,
                               data: JokeTypeViewCellData) -> CGFloat {
    dummyCell.setupUI(data: data)
    let size = dummyCell.systemLayoutSizeFitting(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
    return size.height + ViewTraits.titleLabelCellMiniumHeight
  }
}


// MARK: - UICollectionViewDelegate

extension JokeTypeListView: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: false)
    delegate?.jokeTypeListViewDidTapCell(self, index: indexPath.row)
  }
}

// MARK: - UICollectionViewDataSource

extension JokeTypeListView: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let reuseId = JokeTypeViewCell.reuseIdentifier
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
    guard let jokeTypeCell = cell as? JokeTypeViewCell else {
      return cell
    }
    jokeTypeCell.setupUI(data: viewData[indexPath.row])
    return jokeTypeCell
  }
}
