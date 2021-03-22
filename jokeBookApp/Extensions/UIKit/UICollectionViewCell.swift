//
//  UICollectionViewCell.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

extension UICollectionViewCell {
  
  static var reuseIdentifier: String {
    String(describing: Self.self)
  }
}
