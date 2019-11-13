//
//  ViewController.swift
//  RevelGit
//
//  Created by Axel Nunez on 11/12/19.
//  Copyright © 2019 Axel Nunez. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
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
        return UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
    }
}


extension MainViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

