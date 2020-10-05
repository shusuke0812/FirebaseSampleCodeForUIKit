//
//  TableViewCell.swift
//  FirebaseSampleCodeForUIKit
//
//  Created by Shusuke Ota on 2020/7/24.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var atmImage: UIImageView!
    @IBOutlet weak var atmKind: UILabel!
    @IBOutlet weak var atmName: UILabel!
    @IBOutlet weak var atmAddress: UILabel!
    @IBOutlet weak var atmFavoriteLabel: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func atmFavoriteButton(_ sender: Any) {
    }
    
}
