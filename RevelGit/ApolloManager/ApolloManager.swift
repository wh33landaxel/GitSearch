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
    
    static var instance = ApolloManager(urlString: "https://api.github.com/graphql")

    private var url: URL?
    
    convenience init(urlString: String) {
        self.init()
        
        if let url = URL(string: urlString) {
            self.url = url
        } else {
            assertionFailure("Invalid URL string")
        }
    }
}
