//
//  AttractionTableViewCell.swift
//  TableViewStory
//
//  Created by Neil Smyth on 8/28/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import UIKit

class AttractionTableViewCell: UITableViewCell {

    @IBOutlet weak var attractionImage: UIImageView!
    @IBOutlet weak var attractionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
