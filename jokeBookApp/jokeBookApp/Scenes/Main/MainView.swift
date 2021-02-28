//
//  MainView.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Lottie
import UIKit

protocol MainViewDelegate: class {
  func mainViewDidTapButton(_ view: MainView)
}

class MainView: UIView {
  
  // MARK: - Constants
  
  private struct ViewTraits {
    // Margins
    static let contentTopMargin: CGFloat = 150.0
    static let contentMargin: CGFloat = 18.0
    static let contentButtomMargin: CGFloat = 24.0
    
    // Sizes
    static let animationHeight: CGFloat = 300.0
  }
  
  // MARK: - Properties
  
  weak var delegate: MainViewDelegate?
  
  private let animationContainerView = UIView()
  private let animationView = AnimationView()
  private let buttonContainerView = UIView()
  private let nextButton = CustomButton()
  
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
    playAnimation()
  }
  
  func playAnimation() {
    animationView.loopMode = .loop
    animationView.play()
  }
  
  // MARK: - Private
  
  private func setupComponents() {
    backgroundColor = .white
    
    animationView.animation = Animation.named(AnimationIdentifiers.jellyfish)
    animationView.contentMode = .scaleAspectFit
    
    nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
    
    animationContainerView.addSubviewForAutolayout(animationView)
    
    addSubviewForAutolayout(animationContainerView)
    addSubviewForAutolayout(nextButton)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      animationContainerView.topAnchor.constraint(equalTo: topAnchor,
                                                  constant: ViewTraits.contentTopMargin),
      animationContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
      animationContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
      
      nextButton.topAnchor.constraint(equalTo: animationContainerView.bottomAnchor,
                                                  constant: ViewTraits.contentMargin),
      nextButton.leadingAnchor.constraint(equalTo: leadingAnchor,
                                          constant: ViewTraits.contentMargin),
      nextButton.trailingAnchor.constraint(equalTo: trailingAnchor,
                                           constant: -ViewTraits.contentMargin),
      nextButton.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor,
                                                     constant: -ViewTraits.contentButtomMargin),
      
      animationView.heightAnchor.constraint(equalToConstant: ViewTraits.animationHeight),
      animationView.topAnchor.constraint(equalTo: animationContainerView.topAnchor),
      animationView.leadingAnchor.constraint(equalTo: animationContainerView.leadingAnchor,
                                             constant: ViewTraits.contentMargin),
      animationView.trailingAnchor.constraint(equalTo: animationContainerView.trailingAnchor,
                                              constant: -ViewTraits.contentMargin),
      animationView.bottomAnchor.constraint(equalTo: animationContainerView.bottomAnchor)
    ])
  }
}
