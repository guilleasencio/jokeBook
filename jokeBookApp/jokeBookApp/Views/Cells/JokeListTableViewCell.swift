//
//  JokeListTableViewCell.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

struct JokeListTableViewCellData {
  let setup: String
}

class JokeListTableViewCell: UITableViewCell {

  // MARK: - Constants
  
  private struct ViewTraits {
    // Margins
    static let contentMargin: CGFloat = 18.0
    
    // Fonts
    static let setupFontSize: CGFloat = 13.0
  }
  
  // MARK: - Properties
  
  private let setupLabel = UILabel()
  
  // MARK: - Lifecycle
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupComponents()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Public
  
  func setupUI(data: JokeListTableViewCellData) {
    setupLabel.text = data.setup
  }
  
  private func setupComponents() {
    backgroundColor = .clear
    
    setupLabel.lineBreakMode = .byWordWrapping
    setupLabel.numberOfLines = 0
    setupLabel.font = UIFont(name: "SF-Pro" , size: ViewTraits.setupFontSize)
    setupLabel.textAlignment = .left
    setupLabel.textColor = UIColor.softBlack
    
    contentView.addSubviewForAutolayout(setupLabel)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      setupLabel.topAnchor.constraint(equalTo: contentView.topAnchor,
                                      constant: ViewTraits.contentMargin),
      setupLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                          constant: ViewTraits.contentMargin),
      setupLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                           constant: -ViewTraits.contentMargin),
      setupLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                         constant: -ViewTraits.contentMargin),
    ])
  }
}
