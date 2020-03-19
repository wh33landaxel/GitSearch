# GitSearch

A Github user search app utilizing `Apollo` and Github's new `GraphQL API v4` network layer https://developer.github.com/v4.
Follow the instructions there to get a `personal access token` that you will place in the ApolloManager for your own use.

Installation: 
1) Be sure that you have `CocoaPods` installed so that you can install the `Apollo` library to do network calls. 
2) Run `pod install` in the App directory 
3) Retrieve Github Personal Access Token (Bearer token) from https://developer.github.com/v4
4) Place personal access token in the `ApolloManager.swift` file inside of the global `bearerToken` variable. 
5) Enjoy~!

 This app has three primary screens:

## View 1 GitUser Search
- You can use the search bar to search for git users
- Users avatars are displayed next to their usernames 

## View 2 Repo List
- Shows repo name, description, stars to repo, people watching repo, primary language of repo, last update date

## View 3 List of Commits
- Commit message, person who committed, day of commit and time committed
