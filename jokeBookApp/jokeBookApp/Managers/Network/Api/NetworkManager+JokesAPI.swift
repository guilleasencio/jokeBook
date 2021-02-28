//
//  NetworkManager+JokesAPI.swift
//  jokeBookApp
//
//  Created by Guillermo Asencio Sanchez on 28/2/21.
//

import Foundation

private enum JokesAPIEndpoint {
  static let getJokes = "/jokes/%@/ten"
}

protocol JokesAPI {
  func getJokes(parameters: GetJokesParameters,
                completion: @escaping(Result<[JokeEntity], GetJokesError>) -> Void)
}

extension NetworkManager: JokesAPI {
  
  func getJokes(parameters: GetJokesParameters,
                completion: @escaping (Result<[JokeEntity], GetJokesError>) -> Void) {
    let requestData = GetJokesRequestData(parameters: parameters)
    
    var urlComponents = URLComponents(string: NetworkConfig.jokesBaseUrl)
    urlComponents?.path = String(format: JokesAPIEndpoint.getJokes, requestData.getJokeType())
    let path = urlComponents?.url?.absoluteString ?? ""
    print(path)
    let networkRequest = NetworkRequest(httpMethod: .get,
                                        encoding: .json,
                                        path: path,
                                        headers: requestData.getHeaders())
    
    request(networkRequest) { networkResult in
      switch networkResult {
        case .success(let response):
          let parser = NetworkEntityParser()
          if let entity = parser.parse(data: response.data,
                                       entityType: GetJokesResponse.self,
                                       statusCode: response.statusCode,
                                       headers: response.headers) {
            if entity.isEmpty {
              completion(.failure(.emptyResponse))
            } else {
              completion(.success(entity))
            }
          } else {
            completion(.failure(.responseProblems))
          }
        case .failure(let error):
          switch error.code {
            case .noConnection:
              completion(.failure(.noConnection))
            default:
              completion(.failure(.responseProblems))
          }
      }
    }
  }
}
