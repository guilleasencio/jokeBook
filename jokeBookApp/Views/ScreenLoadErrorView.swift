//
//  ScreenLoadErrorView.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

protocol ScreenLoadErrorViewDelegate: class {
  func screenLoadErrorViewDidTapRetry(_ view: ScreenLoadErrorView)
}

class ScreenLoadErrorView: UIView {
  
  // MARK: - Constant
  
  private struct ViewTraits {
    
    // Margins
    static let contentMargins: CGFloat = 18.0
    static let retryMarginTop: CGFloat = 25.0
    
    // Sizes
    static let buttonWidth: CGFloat = 150.0
    static let imageButtonSize = CGSize(width: 20.0, height: 20.0)
    
    // Fonts
    static let messageFontSize: CGFloat = 15
  }
  
  // MARK: - Properties
  
  weak var delegate: ScreenLoadErrorViewDelegate?
  
  private let contentView = UIView()
  private let messageLabel = UILabel()
  private let retryButton = CustomButton()
  
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
  
  @objc private func didTapRetryButton() {
    delegate?.screenLoadErrorViewDidTapRetry(self)
  }
  
  // MARK: - Private
  
  private func setupComponents() {
    backgroundColor = .white
    
    messageLabel.textColor = .softBlack
    messageLabel.textAlignment = .center
    messageLabel.numberOfLines = 0
    messageLabel.text = "Ops! There was an error loading your request. Please, try again later"
    messageLabel.font = UIFont(name: "SF-Pro" , size: ViewTraits.messageFontSize)
    
    retryButton.setTitle("Retry", for: .normal)
    retryButton.addTarget(self, action: #selector(didTapRetryButton), for: .touchUpInside)
    
    contentView.addSubviewForAutolayout(messageLabel)
    contentView.addSubviewForAutolayout(retryButton)
    
    addSubviewForAutolayout(contentView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      contentView.centerYAnchor.constraint(equalTo: centerYAnchor),
      contentView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                           constant: ViewTraits.contentMargins),
      contentView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                            constant: -ViewTraits.contentMargins),
      contentView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor,
                                       constant: ViewTraits.contentMargins),
      
      messageLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
      messageLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      messageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      
      retryButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      retryButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: ViewTraits.retryMarginTop),
      retryButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      retryButton.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor),
      retryButton.widthAnchor.constraint(equalToConstant: ViewTraits.buttonWidth)
    ])
  }
}

