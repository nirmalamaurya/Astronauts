//
//  AstronautCell.swift
//  SuncorpAstronauts
//
//  Created by Nirmala on 10/6/21.
//

import UIKit
import SDWebImage

class AstronautCell: UITableViewCell {
    
    @IBOutlet var austronautImageView:UIImageView!
    @IBOutlet var austronautName:UILabel!
    @IBOutlet var austronautNationality:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        austronautImageView.translatesAutoresizingMaskIntoConstraints = false
        austronautImageView.clipsToBounds = true
        austronautImageView.contentMode = .scaleAspectFill
        austronautImageView.layer.cornerRadius = self.austronautImageView.bounds.height/2
    }
    func configureCell(with astrounat : Astronaut){
        
        self.austronautName.text = astrounat.name
        self.austronautNationality.text = astrounat.nationality
        if let url = astrounat.makeImageUrl(){
        let image = UIImage(named: "placeholder")
        austronautImageView.sd_setImage(with: url, placeholderImage: image)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
