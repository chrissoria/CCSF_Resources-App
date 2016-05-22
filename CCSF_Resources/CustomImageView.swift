//
//  CustomImageView.swift
//  CCSF_Resources
//
//  Created by christopher soria on 5/19/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class CustomImageView: UIView {

    @IBOutlet weak var resourceImageView: UIImageView!
    @IBOutlet var contentView: UIView!
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    func initSubviews() {
        // standard initialization logic
        let nib = UINib(nibName: "CustomImageView", bundle: nil)
        nib.instantiateWithOwner(self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
            
            // custom initialization logic
        
    }

}
