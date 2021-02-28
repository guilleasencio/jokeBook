//
//  MainView.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

protocol MainViewDelegate: class {
  func mainViewDidTapButton(_ view: MainView)
}

class MainView: UIView {
  
  // MARK: - Constants
  
  private struct ViewTraits {
    // Margins
    static let contentSideMargin: CGFloat = 18.0
    static let nextButtonButtomMargin: CGFloat = 24.0
  }
  
  // MARK: - Properties
  
  weak var delegate: MainViewDelegate?
  
  private let nextButton = UIButton()
  
  // MARK: - Lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupComponents()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Actions
  
  @objc private func didTapNextButton() {
    delegate?.mainViewDidTapButton(self)
  }
  
  // MARK: - Public
   
  func setupUI(data: MainViewData) {
    nextButton.setTitle(data.buttonText, for: .normal)
  }
  
  // MARK: - Private
  
  private func setupComponents() {
    backgroundColor = .white
    
    nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
    
    addSubviewForAutolayout(nextButton)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
      nextButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewTraits.contentSideMargin),
      nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ViewTraits.contentSideMargin),
      nextButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -ViewTraits.nextButtonButtomMargin)
    ])
  }
}
