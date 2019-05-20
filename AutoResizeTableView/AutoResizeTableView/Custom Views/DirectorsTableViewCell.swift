//
//  DirectorsTableViewCell.swift
//  AutoResizeTableView
//
//  Created by Abhishek Shukla on 18/05/19.
//  Copyright © 2019 Abhishek Shukla. All rights reserved.
//

import UIKit

class DirectorsTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var directorsImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
