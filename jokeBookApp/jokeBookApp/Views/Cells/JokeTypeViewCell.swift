//
//  JokeTypeViewCell.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

// MARK: - ViewData

struct JokeTypeViewCellData {
  let image: String
  let title: String
}

class JokeTypeViewCell: UICollectionViewCell {
  
  private struct ViewTraits {
    // Margins
    static let titleMargin: CGFloat = 16.0
    
    // Sizes
    static let cornerRadius: CGFloat = 8.0
    static let imageHeightMultiplier: CGFloat = 0.6
    
    // Fonts
    static let titleFontSize: CGFloat = 13.0
  }
  
  // MARK: - Properties
  
  private let imageView = UIImageView()
  private let titleLabel = UILabel()
  
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
  
  func setupUI(data: JokeTypeViewCellData) {
    let image = UIImage(named: data.image)
    imageView.image = image
    titleLabel.text = data.title
  }
  
  // MARK: - Private
  
  private func setupComponents() {
    backgroundColor = .white
    
    layer.masksToBounds = true
    layer.cornerRadius = ViewTraits.cornerRadius
    layer.borderColor = UIColor.softBlack.cgColor
    layer.borderWidth = 1
    
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    
    titleLabel.lineBreakMode = .byWordWrapping
    titleLabel.numberOfLines = 0
    titleLabel.font = UIFont(name: "SF-Pro" , size: ViewTraits.titleFontSize)
    titleLabel.textAlignment = .left
    titleLabel.textColor = UIColor.softBlack
        
    contentView.addSubviewForAutolayout(imageView)
    contentView.addSubviewForAutolayout(titleLabel)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      imageView.topAnchor.constraint(equalTo: topAnchor),
      imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
      imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
      imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor,
                                        multiplier: ViewTraits.imageHeightMultiplier),
      
      titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: ViewTraits.titleMargin),
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: ViewTraits.titleMargin),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -ViewTraits.titleMargin),
      titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -ViewTraits.titleMargin)
    ])
  }
}
