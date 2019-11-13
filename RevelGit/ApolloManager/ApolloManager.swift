//
//  ApolloManager.swift
//  RevelGit
//
//  Created by Axel Nunez on 11/12/19.
//  Copyright © 2019 Axel Nunez. All rights reserved.
//

import Foundation
import Apollo

typealias GraphQLBlock = ((GraphQLResult<GraphQLSelectionSet>, Error?) -> ())


class ApolloManager {
    
    static let instance = ApolloManager()
    
    // Configure the network transport to use the singleton as the delegate.
    private lazy var networkTransport = HTTPNetworkTransport(
      url: URL(string: "https://api.github.com/graphql")!,
      delegate: self
    )
      
    // Use the configured network transport in your Apollo client.
    private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
    
    func findUsers(searchData:FindUserQuery, block: @escaping (Result<GraphQLResult<FindUserQuery.Data>, Error>) -> ()) {
            apollo.fetch(query: searchData) { result in
                block(result)
            }
    }
    
    func findRepos(searchData:FindReposQuery, block: @escaping (Result<GraphQLResult<FindReposQuery.Data>, Error>) -> ()) {
        apollo.fetch(query: searchData) { result in
        block(result)
        }
    }
    
    func findCommits(searchData:FindCommitsQuery, block: @escaping (Result<GraphQLResult<FindCommitsQuery.Data>, Error>) -> ()) {
            apollo.fetch(query: searchData) { result in
            block(result)
        }
    }
}

// MARK: - Pre-flight delegate

extension ApolloManager: HTTPNetworkTransportPreflightDelegate {

  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                          shouldSend request: URLRequest) -> Bool {
    // If there's an authenticated user, send the request. If not, don't.
    return true
  }
  
  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                        willSend request: inout URLRequest) {
                        
    // Get the existing headers, or create new ones if they're nil
    var headers = request.allHTTPHeaderFields ?? [String: String]()

    // Add any new headers you need
    headers["Authorization"] = "Bearer 574b0b2f615e407365356677648a1e15410c2529"
  
    // Re-assign the updated headers to the request.
    request.allHTTPHeaderFields = headers
    
    Logger.log(.debug, "Outgoing request: \(request)")
  }
}

// MARK: - Task Completed Delegate

extension ApolloManager: HTTPNetworkTransportTaskCompletedDelegate {
  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                        didCompleteRawTaskForRequest request: URLRequest,
                        withData data: Data?,
                        response: URLResponse?,
                        error: Error?) {
   // Logger.log(.debug, "Raw task completed for request: \(request)")
                        
    if let error = error {
      Logger.log(.error, "Error: \(error)")
    }
    
    if let response = response {
//      Logger.log(.debug, "Response: \(response)")
    } else {
      Logger.log(.error, "No URL Response received!")
    }
    
    if let data = data {
 //     Logger.log(.debug, "Data: \(String(describing: String(bytes: data, encoding: .utf8)))")
    } else {
      Logger.log(.error, "No data received!")
    }
  }
}

// MARK: - Retry Delegate

extension ApolloManager: HTTPNetworkTransportRetryDelegate {

  func networkTransport(_ networkTransport: HTTPNetworkTransport,
                        receivedError error: Error,
                        for request: URLRequest,
                        response: URLResponse?,
                        retryHandler: @escaping (_ shouldRetry: Bool) -> Void) {
    // Check if the error and/or response you've received are something that requires authentication
    
    retryHandler(false)
  }
}


