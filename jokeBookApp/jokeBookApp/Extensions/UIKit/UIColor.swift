//
//  UIColor.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import UIKit

extension UIColor {
  
  static func create(named name: String) -> UIColor {
    UIColor(named: name) ?? .black
  }
}
