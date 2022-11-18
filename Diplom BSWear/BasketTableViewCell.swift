//
//  BasketTableViewCell.swift
//  Diplom BSWear
//
//  Created by MyMac on 8/24/22.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    @IBOutlet weak var removeRowButton: UIButton!
    @IBOutlet weak var basketPriceLabel: UILabel!
    @IBOutlet weak var basketNameLabel: UILabel!
    @IBOutlet weak var basketImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
