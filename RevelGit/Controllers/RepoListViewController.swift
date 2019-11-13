//
//  RepoListViewController.swift
//  RevelGit
//
//  Created by Axel Nunez on 11/13/19.
//  Copyright © 2019 Axel Nunez. All rights reserved.
//

import UIKit

class RepoListViewController: UIViewController {
    
    var ownerName: String? 

    @IBOutlet weak var repoTableView: UITableView!
    var repoDetails : [RepositoryDetails] = []
    let dateFormatterGet = ISO8601DateFormatter()
    let dateFormatterPrint = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Repo List"
        
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        repoTableView.register(UINib(nibName: String(describing:RepoCellTableViewCell.self), bundle: nil), forCellReuseIdentifier: "RepoCell")
        
        DispatchQueue.main.async {
            
            if let owner = self.ownerName {
                self.findPosts(user: owner)
            }
        }
}
    
    func findPosts(user: String = "Dave") {
            
           ApolloManager.instance.findRepos(searchData: FindReposQuery(login: user, last: 100)) { (result) in
               
            switch(result) {
                    case .success(let graphQLResult):
                        if let repos = graphQLResult.data?.user?.repositories.nodes {
                            for repo in repos {
                                   if let repoInfo = repo?.fragments.repositoryDetails
                                   {
                                       self.repoDetails.append(repoInfo)
                                   }
                               }
                           }
                           self.repoTableView.reloadData()
                       
                           case .failure(let error):
                               self.repoTableView.reloadData()
                               print(error)
                       }
                }
    }
}
    

    


extension RepoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CommitViewController()
        vc.repoName = repoDetails[indexPath.row].name
        vc.owner = ownerName
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell", for: indexPath) as? RepoCellTableViewCell {
            
            cell.languageLabel.text = "Language: \(repoDetails[indexPath.row].primaryLanguage?.name ?? "Unknown")"
            cell.repoNameLabel.text = "Repo Name: \(repoDetails[indexPath.row].name)"
            cell.descriptionLabel.text = repoDetails[indexPath.row].description
            
            if let date = dateFormatterGet.date(from: repoDetails[indexPath.row].updatedAt) {
                cell.updateDateLabel.text = "Updated at: \(dateFormatterPrint.string(from: date))"

            } else {
               print("There was an error decoding the string")
            }
            
            cell.starCountLabel.text = "Stargazers:  \(repoDetails[indexPath.row].stargazers.totalCount)"
            cell.watcherCountLabel.text = "Watchers: \(repoDetails[indexPath.row].watchers.totalCount)"
            
            return cell
        }
        
        return UITableViewCell()
    }
}
