//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class FindUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query FindUser($id: String!) {
      search(query: $id, type: USER, last: 100) {
        __typename
        nodes {
          __typename
          ... on User {
            avatarUrl
            login
          }
        }
      }
    }
    """

  public let operationName = "FindUser"

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("search", arguments: ["query": GraphQLVariable("id"), "type": "USER", "last": 100], type: .nonNull(.object(Search.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.resultMap])
    }

    /// Perform a search across resources.
    public var search: Search {
      get {
        return Search(unsafeResultMap: resultMap["search"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes = ["SearchResultItemConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nodes", type: .list(.object(Node.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(nodes: [Node?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "SearchResultItemConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of nodes.
      public var nodes: [Node?]? {
        get {
          return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
        }
      }

      public struct Node: GraphQLSelectionSet {
        public static let possibleTypes = ["Issue", "PullRequest", "Repository", "User", "Organization", "MarketplaceListing", "App"]

        public static let selections: [GraphQLSelection] = [
          GraphQLTypeCase(
            variants: ["User": AsUser.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeIssue() -> Node {
          return Node(unsafeResultMap: ["__typename": "Issue"])
        }

        public static func makePullRequest() -> Node {
          return Node(unsafeResultMap: ["__typename": "PullRequest"])
        }

        public static func makeRepository() -> Node {
          return Node(unsafeResultMap: ["__typename": "Repository"])
        }

        public static func makeOrganization() -> Node {
          return Node(unsafeResultMap: ["__typename": "Organization"])
        }

        public static func makeMarketplaceListing() -> Node {
          return Node(unsafeResultMap: ["__typename": "MarketplaceListing"])
        }

        public static func makeApp() -> Node {
          return Node(unsafeResultMap: ["__typename": "App"])
        }

        public static func makeUser(avatarUrl: String, login: String) -> Node {
          return Node(unsafeResultMap: ["__typename": "User", "avatarUrl": avatarUrl, "login": login])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asUser: AsUser? {
          get {
            if !AsUser.possibleTypes.contains(__typename) { return nil }
            return AsUser(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsUser: GraphQLSelectionSet {
          public static let possibleTypes = ["User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
            GraphQLField("login", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(avatarUrl: String, login: String) {
            self.init(unsafeResultMap: ["__typename": "User", "avatarUrl": avatarUrl, "login": login])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// A URL pointing to the user's public avatar.
          public var avatarUrl: String {
            get {
              return resultMap["avatarUrl"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "avatarUrl")
            }
          }

          /// The username used to login.
          public var login: String {
            get {
              return resultMap["login"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "login")
            }
          }
        }
      }
    }
  }
}

public final class FindReposQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query FindRepos($login: String!) {
      user(login: $login) {
        __typename
        repositories(last: 10) {
          __typename
          nodes {
            __typename
            name
            stargazers {
              __typename
              totalCount
            }
            watchers {
              __typename
              totalCount
            }
            primaryLanguage {
              __typename
              name
            }
            updatedAt
          }
        }
      }
    }
    """

  public let operationName = "FindRepos"

  public var login: String

  public init(login: String) {
    self.login = login
  }

  public var variables: GraphQLMap? {
    return ["login": login]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("user", arguments: ["login": GraphQLVariable("login")], type: .object(User.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: User? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
    }

    /// Lookup a user by login.
    public var user: User? {
      get {
        return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "user")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("repositories", arguments: ["last": 10], type: .nonNull(.object(Repository.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(repositories: Repository) {
        self.init(unsafeResultMap: ["__typename": "User", "repositories": repositories.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of repositories that the user owns.
      public var repositories: Repository {
        get {
          return Repository(unsafeResultMap: resultMap["repositories"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "repositories")
        }
      }

      public struct Repository: GraphQLSelectionSet {
        public static let possibleTypes = ["RepositoryConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "RepositoryConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["Repository"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("stargazers", type: .nonNull(.object(Stargazer.selections))),
            GraphQLField("watchers", type: .nonNull(.object(Watcher.selections))),
            GraphQLField("primaryLanguage", type: .object(PrimaryLanguage.selections)),
            GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, stargazers: Stargazer, watchers: Watcher, primaryLanguage: PrimaryLanguage? = nil, updatedAt: String) {
            self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "stargazers": stargazers.resultMap, "watchers": watchers.resultMap, "primaryLanguage": primaryLanguage.flatMap { (value: PrimaryLanguage) -> ResultMap in value.resultMap }, "updatedAt": updatedAt])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of the repository.
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// A list of users who have starred this starrable.
          public var stargazers: Stargazer {
            get {
              return Stargazer(unsafeResultMap: resultMap["stargazers"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "stargazers")
            }
          }

          /// A list of users watching the repository.
          public var watchers: Watcher {
            get {
              return Watcher(unsafeResultMap: resultMap["watchers"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "watchers")
            }
          }

          /// The primary language of the repository's code.
          public var primaryLanguage: PrimaryLanguage? {
            get {
              return (resultMap["primaryLanguage"] as? ResultMap).flatMap { PrimaryLanguage(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "primaryLanguage")
            }
          }

          /// Identifies the date and time when the object was last updated.
          public var updatedAt: String {
            get {
              return resultMap["updatedAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "updatedAt")
            }
          }

          public struct Stargazer: GraphQLSelectionSet {
            public static let possibleTypes = ["StargazerConnection"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(totalCount: Int) {
              self.init(unsafeResultMap: ["__typename": "StargazerConnection", "totalCount": totalCount])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Identifies the total count of items in the connection.
            public var totalCount: Int {
              get {
                return resultMap["totalCount"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "totalCount")
              }
            }
          }

          public struct Watcher: GraphQLSelectionSet {
            public static let possibleTypes = ["UserConnection"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(totalCount: Int) {
              self.init(unsafeResultMap: ["__typename": "UserConnection", "totalCount": totalCount])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Identifies the total count of items in the connection.
            public var totalCount: Int {
              get {
                return resultMap["totalCount"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "totalCount")
              }
            }
          }

          public struct PrimaryLanguage: GraphQLSelectionSet {
            public static let possibleTypes = ["Language"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "Language", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The name of the current language.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }
        }
      }
    }
  }
}

public final class ListCommitsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition =
    """
    query ListCommits($repo: String!, $owner: String!) {
      repository(name: $repo, owner: $owner) {
        __typename
        commitComments(last: 10) {
          __typename
          nodes {
            __typename
            commit {
              __typename
              author {
                __typename
                name
              }
              message
              committedDate
              id
            }
          }
        }
      }
    }
    """

  public let operationName = "ListCommits"

  public var repo: String
  public var owner: String

  public init(repo: String, owner: String) {
    self.repo = repo
    self.owner = owner
  }

  public var variables: GraphQLMap? {
    return ["repo": repo, "owner": owner]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("repository", arguments: ["name": GraphQLVariable("repo"), "owner": GraphQLVariable("owner")], type: .object(Repository.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(repository: Repository? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "repository": repository.flatMap { (value: Repository) -> ResultMap in value.resultMap }])
    }

    /// Lookup a given repository by the owner and repository name.
    public var repository: Repository? {
      get {
        return (resultMap["repository"] as? ResultMap).flatMap { Repository(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "repository")
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes = ["Repository"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("commitComments", arguments: ["last": 10], type: .nonNull(.object(CommitComment.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(commitComments: CommitComment) {
        self.init(unsafeResultMap: ["__typename": "Repository", "commitComments": commitComments.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of commit comments associated with the repository.
      public var commitComments: CommitComment {
        get {
          return CommitComment(unsafeResultMap: resultMap["commitComments"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "commitComments")
        }
      }

      public struct CommitComment: GraphQLSelectionSet {
        public static let possibleTypes = ["CommitCommentConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("nodes", type: .list(.object(Node.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "CommitCommentConnection", "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of nodes.
        public var nodes: [Node?]? {
          get {
            return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["CommitComment"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("commit", type: .object(Commit.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(commit: Commit? = nil) {
            self.init(unsafeResultMap: ["__typename": "CommitComment", "commit": commit.flatMap { (value: Commit) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Identifies the commit associated with the comment, if the commit exists.
          public var commit: Commit? {
            get {
              return (resultMap["commit"] as? ResultMap).flatMap { Commit(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "commit")
            }
          }

          public struct Commit: GraphQLSelectionSet {
            public static let possibleTypes = ["Commit"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("author", type: .object(Author.selections)),
              GraphQLField("message", type: .nonNull(.scalar(String.self))),
              GraphQLField("committedDate", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(author: Author? = nil, message: String, committedDate: String, id: GraphQLID) {
              self.init(unsafeResultMap: ["__typename": "Commit", "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }, "message": message, "committedDate": committedDate, "id": id])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Authorship details of the commit.
            public var author: Author? {
              get {
                return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "author")
              }
            }

            /// The Git commit message
            public var message: String {
              get {
                return resultMap["message"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "message")
              }
            }

            /// The datetime when this commit was committed.
            public var committedDate: String {
              get {
                return resultMap["committedDate"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "committedDate")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public struct Author: GraphQLSelectionSet {
              public static let possibleTypes = ["GitActor"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .scalar(String.self)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(name: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "GitActor", "name": name])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The name in the Git commit.
              public var name: String? {
                get {
                  return resultMap["name"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }
            }
          }
        }
      }
    }
  }
}
