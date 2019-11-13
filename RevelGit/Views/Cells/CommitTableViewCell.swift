//
//  CommitTableViewCell.swift
//  RevelGit
//
//  Created by Axel Nunez on 11/13/19.
//  Copyright © 2019 Axel Nunez. All rights reserved.
//

import UIKit

class CommitTableViewCell: UITableViewCell {
    @IBOutlet weak var commitMessage: UILabel!
    @IBOutlet weak var committer: UILabel!
    @IBOutlet weak var hashLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
