//
//  ViewController.swift
//  RevelGit
//
//  Created by Axel Nunez on 11/12/19.
//  Copyright © 2019 Axel Nunez. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var usersTableView: UITableView!
    var users: [UserInfo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User Search"
        // Do any additional setup after loading the view.
        
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = users[indexPath.row].login
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(RepoListViewController(), animated: true)
    }
}


extension MainViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.users = []
        
        DispatchQueue.main.async {
            guard let searchText = searchBar.text else {
                return
            }
            ApolloManager.instance.findUsers(searchData: FindUserQuery(id: searchText, last: 100)) { result in
                
                switch(result) {
                    case .success(let graphQLResult):
                        if let nodes = graphQLResult.data?.search.nodes {
                            for node in nodes {
                                if let userInfo = node?.fragments.userInfo {
                                    self.users.append(userInfo)
                                }
                            }
                        }
                        self.usersTableView.reloadData()
                        searchBar.endEditing(true)
                    
                    case .failure(let error):
                        self.usersTableView.reloadData()
                        print(error)
                }
            }
        }
    }
}

