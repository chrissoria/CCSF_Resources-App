//
//  ResourceTableViewCell.swift
//  CCSF_Resources
//
//  Created by christopher soria on 5/16/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class ResourceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var resourceTitleLabel: UILabel!
    @IBOutlet weak var decriptionLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
