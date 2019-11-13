//
//  RepoListViewController.swift
//  RevelGit
//
//  Created by Axel Nunez on 11/13/19.
//  Copyright © 2019 Axel Nunez. All rights reserved.
//

import UIKit

class RepoListViewController: UIViewController {

    @IBOutlet weak var repoTableView: UITableView!
    var repoDetails : [RepositoryDetails] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Repo List"

        // Do any additional setup after loading the view.
        ApolloManager.instance.findRepos(searchData: FindReposQuery(login: "Dave", last: 100)) { (result) in
            
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repoDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = repoDetails[indexPath.row].name
        
        return cell
    }
}
