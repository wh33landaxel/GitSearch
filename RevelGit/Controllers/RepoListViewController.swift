//
//  RepoListViewController.swift
//  RevelGit
//
//  Created by Axel Nunez on 11/13/19.
//  Copyright © 2019 Axel Nunez. All rights reserved.
//

import UIKit

class RepoListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Repo List"

        // Do any additional setup after loading the view.
    }
}

extension RepoListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
