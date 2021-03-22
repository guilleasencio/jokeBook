//
//  JokesEntities.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

// MARK: - Enums

enum JokeType {
  case general
  case knockKnock
  case programming
}

// MARK: - Entities

struct JokeEntity {
  let identifier: Int
  let type: JokeType
  let setup: String
  let punchline: String
}

// MARK: - Parameters

struct GetJokesParameters {
  let type: JokeType
}

// MARK: - Errors

enum GetJokesError: Error {
  case noConnection
  case responseProblems
  case emptyResponse
}
