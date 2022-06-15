//
//  ActividadesTableViewCell.swift
//  Integrador_iOS
//
//  Created by training on 14-06-22.
//

import UIKit

class ActividadesTableViewCell: UITableViewCell {

    @IBOutlet weak var ActividadesLabel: UILabel!
    @IBOutlet weak var ActividadesButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
