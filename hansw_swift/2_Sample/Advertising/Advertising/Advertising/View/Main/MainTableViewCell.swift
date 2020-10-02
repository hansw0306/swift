//
//  MainTableViewCell.swift
//  Advertising
//
//  Created by SANGWON HAN on 2020/09/26.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet var cellCategory: UILabel!
    @IBOutlet var cellBigTitle: UILabel!
    @IBOutlet var cellSmallTitle: UILabel!
    @IBOutlet var celImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
}
