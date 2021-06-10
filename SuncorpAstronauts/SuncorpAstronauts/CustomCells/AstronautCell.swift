//
//  AstronautCell.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 10/6/21.
//

import UIKit

class AstronautCell: UITableViewCell {
    
    @IBOutlet var austronautImageView:UIImageView!
    @IBOutlet var austronautName:UILabel!
    @IBOutlet var austronautNationality:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
