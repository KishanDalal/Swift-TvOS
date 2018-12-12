//
//  myDataTableViewCell.swift
//  IOSApp
//
//  Created by Xcode User on 2018-12-12.
//  Copyright © 2018 Kish. All rights reserved.
//

import UIKit

class myDataTableViewCell: UITableViewCell {
    
    @IBOutlet var mySong : UILabel!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
