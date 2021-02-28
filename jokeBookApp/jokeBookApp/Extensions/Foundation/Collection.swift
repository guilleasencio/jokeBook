//
//  Collection.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

public extension Collection {
  
  subscript (safe index: Index) -> Element? {
    if indices.contains(index) {
      return self[index]
    }
    return nil
  }
}
