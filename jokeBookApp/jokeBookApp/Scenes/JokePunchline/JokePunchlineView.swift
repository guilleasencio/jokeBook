//
//  JokePunchlineView.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

class JokePunchlineView: UIView {
  // MARK: - Constants
  
  private struct ViewTraits {
    // Margins
    static let contentSideMargin: CGFloat = 18.0
    
    // Sizes
    static let punchlineFontSize: CGFloat = 16.0
  }
  
  // MARK: - Properties
  
  weak var delegate: MainViewDelegate?
  
  private let punchlineLabel = UILabel()
  
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
  
  func setupUI(data: JokePunchlineViewData) {
    punchlineLabel.text = data.punchline
  }
  
  // MARK: - Private
  
  private func setupComponents() {
    backgroundColor = .white
    
    punchlineLabel.lineBreakMode = .byWordWrapping
    punchlineLabel.numberOfLines = 0
    punchlineLabel.font = UIFont(name: "SF-Pro" , size: ViewTraits.punchlineFontSize)
    punchlineLabel.textAlignment = .center
    punchlineLabel.textColor = UIColor.softBlack
    
    addSubviewForAutolayout(punchlineLabel)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      punchlineLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      punchlineLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      punchlineLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewTraits.contentSideMargin),
      punchlineLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ViewTraits.contentSideMargin)
    ])
  }
}
