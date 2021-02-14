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
    }
}
// MARK: - Setting UI Method
extension TableViewCell {
    func setUI(atm: Atm) {
        self.atmName.text = atm.atmName
        self.atmKind.text = atm.atmKind
        self.atmAddress.text = atm.atmAddress
    }
}
