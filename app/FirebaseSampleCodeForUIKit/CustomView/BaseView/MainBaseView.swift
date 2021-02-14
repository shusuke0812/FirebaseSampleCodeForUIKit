//
//  MainBaseView.swift
//  FirebaseSampleCodeForUIKit
//
//  Created by Shusuke Ota on 2020/11/1.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class MainBaseView: UIView {
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initUI()
    }
}
// MARK: - Initialized Method
extension MainBaseView {
    private func initUI() {
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
}
