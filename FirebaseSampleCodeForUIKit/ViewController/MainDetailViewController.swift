//
//  MainDetailViewController.swift
//  FirebaseSampleCodeForUIKit
//
//  Created by Shusuke Ota on 2020/8/24.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class MainDetailViewController: UIViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action Method
    @IBAction func didTapCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
