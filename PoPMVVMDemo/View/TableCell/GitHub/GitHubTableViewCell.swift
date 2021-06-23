//
//  GitHubTableViewCell.swift
//  PoPMVVMDemo
//
//  Created by abc on 20/06/21.
//

import UIKit

class GitHubTableViewCell: UITableViewCell, ViewReusable {

    //MARK:- Outlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
