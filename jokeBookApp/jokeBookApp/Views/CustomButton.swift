//
//  CustomButton.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

class CustomButton: UIButton {
  
  // MARK: - Constants
  
  private struct ViewTraits {
    // Margins
    static let defaultHeight: CGFloat = 50.0
    
    // Sizes
    static let cornerRadius: CGFloat = 8.0
    
    // Fonts
    static let defaultFontSize: CGFloat = 13.0
  }
  
  // MARK: - Properties
  
  override var isEnabled: Bool {
    didSet {
      refreshEnabledStyle()
    }
  }
  
  // MARK: - Lifecycle
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupComponents()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Private
  
  private func setupComponents() {
    setBackgroundImage(UIImage(color: UIColor.lightBlue), for: .normal)
    setBackgroundImage(UIImage(color: UIColor.lightGray), for: .disabled)
    
    layer.borderColor = UIColor.softBlack.cgColor
    layer.borderWidth = 1
    layer.masksToBounds = true
    layer.cornerRadius = ViewTraits.cornerRadius
    
    setTitleColor(.black, for: .normal)
    setTitleColor(.darkGray, for: .disabled)
    titleLabel?.font = UIFont(name: "SF-Pro" , size: ViewTraits.defaultFontSize)
    titleLabel?.textColor = UIColor.softBlack
    titleLabel?.lineBreakMode = .byTruncatingTail
    titleLabel?.numberOfLines = 1
    titleLabel?.textAlignment = .center
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      heightAnchor.constraint(equalToConstant: ViewTraits.defaultHeight)
    ])
  }
  
  private func refreshEnabledStyle() {
    layer.borderColor = isEnabled ? UIColor.softBlack.cgColor : UIColor.lightGray.cgColor
    titleLabel?.textColor = isEnabled ? UIColor.softBlack : UIColor.lightGray
  }
}
