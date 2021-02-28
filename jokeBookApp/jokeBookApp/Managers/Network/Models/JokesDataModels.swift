//
//  JokesDataModels.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

enum JokeTypeNetwork: String {
  case general = "general"
  case knockKnock = "knock-knock"
  case programming = "programming"
}

// MARK: - Request

struct GetJokesRequestData {
  
  private let parameters: GetJokesParameters
  
  init(parameters: GetJokesParameters) {
    self.parameters = parameters
  }
  
  func getHeaders() -> [String: String] {
    [
      "Accept": "application/json"
    ]
  }
  
  func getJokeType() -> String {
    switch parameters.type {
      case .general:
        return JokeTypeNetwork.general.rawValue
      case .knockKnock:
        return JokeTypeNetwork.knockKnock.rawValue
      case .programming:
        return JokeTypeNetwork.programming.rawValue
    }
  }
}

// MARK: - Response

class GetJokesResponse: Decodable, DomainConvertible {
  typealias DomainEntityType = [JokeEntity]
  
  private let jokes: [JokeData]
  
  required init(from decoder: Decoder) throws {
    jokes = try [JokeData](from: decoder)
  }
  
  func domainEntity(statusCode: Int?, headers: [String: String]) -> [JokeEntity]? {
    guard !jokes.isEmpty else {
      return []
    }
    return jokes.compactMap({ $0.domainEntity(statusCode: statusCode, headers: headers) })
  }
  
  private class JokeData: Decodable, DomainConvertible {
    typealias DomainEntityType = JokeEntity
    
    enum CodingKeys: String, CodingKey {
      case identifier = "id"
      case type
      case setup
      case punchline
    }
    
    private let identifier: Int
    private let type: String
    private let setup: String
    private let punchline: String
    
    func domainEntity(statusCode: Int?, headers: [String: String]) -> JokeEntity? {
      guard let jokeType = getJokeType() else {
        return nil
      }
      return JokeEntity(identifier: identifier, type: jokeType, setup: setup, punchline: punchline)
    }
    
    private func getJokeType() -> JokeType? {
      switch type {
        case JokeTypeNetwork.general.rawValue:
          return .general
        case JokeTypeNetwork.knockKnock.rawValue:
          return .knockKnock
        case JokeTypeNetwork.programming.rawValue:
          return .programming
        default:
          return nil
      }
    }
  }
}
