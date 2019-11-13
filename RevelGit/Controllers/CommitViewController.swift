//
//  CommitViewController.swift
//  RevelGit
//
//  Created by Axel Nunez on 11/13/19.
//  Copyright © 2019 Axel Nunez. All rights reserved.
//

import UIKit

class CommitViewController: UIViewController {
    
    var commits: [CommitDetails] = []
    var owner : String?
    var repoName: String?
    
    let dateFormatterGet = ISO8601DateFormatter()
    let dateFormatterPrint = DateFormatter()
    
    @IBOutlet weak var commitTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Commits"
        
        dateFormatterPrint.dateFormat = "hh:mm a MMM dd,yyyy"
        dateFormatterPrint.amSymbol = "AM"
        dateFormatterPrint.pmSymbol = "PM"
        
        commitTableView.register(UINib(nibName: String(describing:CommitTableViewCell.self), bundle: nil), forCellReuseIdentifier: "CommitCell")

        DispatchQueue.main.async {
            
            guard let ownerName = self.owner, let repoName = self.repoName else {
                self.getCommits()
                return
            }
            
            self.getCommits(owner:ownerName, repoName: repoName)
        }
        // Do any additional setup after loading the view.
    }
    
    func getCommits(owner: String = "Dave", repoName: String = "", last: Int = 100) {
        
        ApolloManager.instance.findCommits(searchData: FindCommitsQuery(repo: repoName, owner: owner, last: last), block: { (result) in
           
            switch(result) {
                case .success(let graphQLResult):
                    self.commits = []
                    if let commitComments = graphQLResult.data?.repository?.commitComments.nodes {
                        for commitComment in commitComments {
                               if let commitDetails = commitComment?.fragments.commitDetails
                               {
                                   self.commits.append(commitDetails)
                               }
                           }
                       }
                       self.commitTableView.reloadData()
                   
                       case .failure(let error):
                           self.commitTableView.reloadData()
                           print(error)
                   }
            })
    }
}

extension CommitViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let commit = commits[indexPath.row].commit else {
            return UITableViewCell()
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CommitCell", for: indexPath) as? CommitTableViewCell {
            cell.commitMessage.text = commit.message
            
            if let date = dateFormatterGet.date(from: commit.committedDate) {
                        cell.dateLabel.text = "Committed on: \(dateFormatterPrint.string(from: date))"

                       } else {
                          print("There was an error decoding the string")
            }
                       
            cell.hashLabel.text = commit.id
            cell.committer.text = commit.author?.name
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commits.count
    }
}
