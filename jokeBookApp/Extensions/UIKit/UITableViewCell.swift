//
//  UITableViewCell.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

extension UITableViewCell {
  
  static var reuseIdentifier: String {
    String(describing: Self.self)
  }
}
