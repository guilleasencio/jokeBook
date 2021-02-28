//
//  JokePunchlineView.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Lottie
import UIKit

class JokePunchlineView: UIView {
  // MARK: - Constants
  
  private struct ViewTraits {
    // Margins
    static let contentTopMargin: CGFloat = 50.0
    static let contentMargin: CGFloat = 18.0
    static let contentSpacing: CGFloat = 30.0
    
    // Sizes
    static let animationHeight: CGFloat = 300.0

    static let punchlineFontSize: CGFloat = 24.0
  }
  
  // MARK: - Properties
  
  weak var delegate: MainViewDelegate?
  
  private let contentView = UIView()
  private let contentStackView = UIStackView()
  private let animationContainerView = UIView()
  private let animationView = AnimationView()
  private let punchlineContainerView = UIView()
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
    animationView.loopMode = .loop
    animationView.play()
  }
  
  // MARK: - Private
  
  private func setupComponents() {
    backgroundColor = .white
    
    contentStackView.axis = .vertical
    contentStackView.alignment = .center
    contentStackView.distribution = .fill
    contentStackView.spacing = ViewTraits.contentSpacing
    
    animationView.animation = Animation.named(AnimationIdentifiers.laughs)
    animationView.contentMode = .scaleAspectFit
    
    punchlineLabel.lineBreakMode = .byWordWrapping
    punchlineLabel.numberOfLines = 0
    punchlineLabel.font = UIFont(name: "SF-Pro" , size: ViewTraits.punchlineFontSize)
    punchlineLabel.textAlignment = .center
    punchlineLabel.textColor = UIColor.softBlack
    
    animationContainerView.addSubviewForAutolayout(animationView)
    punchlineContainerView.addSubviewForAutolayout(punchlineLabel)
    
    contentStackView.addArrangedSubview(animationContainerView)
    contentStackView.addArrangedSubview(punchlineContainerView)
        
    contentView.addSubviewForAutolayout(contentStackView)
    
    addSubviewForAutolayout(contentView)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      contentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),

      contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                            constant: ViewTraits.contentTopMargin),
      contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      contentStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,
                                               constant: -ViewTraits.contentMargin),
      
      animationView.heightAnchor.constraint(equalToConstant: ViewTraits.animationHeight),
      animationView.topAnchor.constraint(equalTo: animationContainerView.topAnchor),
      animationView.leadingAnchor.constraint(equalTo: animationContainerView.leadingAnchor,
                                             constant: ViewTraits.contentMargin),
      animationView.trailingAnchor.constraint(equalTo: animationContainerView.trailingAnchor,
                                              constant: -ViewTraits.contentMargin),
      animationView.bottomAnchor.constraint(equalTo: animationContainerView.bottomAnchor),
      
      punchlineLabel.topAnchor.constraint(equalTo: punchlineContainerView.topAnchor),
      punchlineLabel.leadingAnchor.constraint(equalTo: punchlineContainerView.leadingAnchor,
                                              constant: ViewTraits.contentMargin),
      punchlineLabel.trailingAnchor.constraint(equalTo: punchlineContainerView.trailingAnchor,
                                               constant: -ViewTraits.contentMargin),
      punchlineLabel.bottomAnchor.constraint(equalTo: punchlineContainerView.bottomAnchor)
    ])
  }
}
