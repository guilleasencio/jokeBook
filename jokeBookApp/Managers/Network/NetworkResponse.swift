//
//  NetworkResponse.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

struct NetworkResponse<T> {
  let statusCode: Int?
  let headers: [String: String]
  let data: T
}
