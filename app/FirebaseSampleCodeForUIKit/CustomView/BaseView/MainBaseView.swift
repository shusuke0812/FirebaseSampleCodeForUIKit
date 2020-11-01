//
//  MainBaseView.swift
//  FirebaseSampleCodeForUIKit
//
//  Created by Shusuke Ota on 2020/11/1.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class MainBaseView: UIView {
    
    @IBOutlet weak var advertisingImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setUI()
    }
}

extension MainBaseView {
    private func setUI() {
        self.advertisingImageView.backgroundColor = .lightGray
    }
}
