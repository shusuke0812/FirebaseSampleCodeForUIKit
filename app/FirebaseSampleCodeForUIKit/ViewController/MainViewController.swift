//
//  ViewController.swift
//  FirebaseSampleCodeForUIKit
//
//  Created by Shusuke Ota on 2020/6/20.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    /// BaseView
    private var baseView: MainBaseView { return self.view as! MainBaseView }
    /// ViewModel
    private var viewModel: MainViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MainViewModel()
        self.baseView.tableView.dataSource = self.viewModel
        self.baseView.tableView.delegate = self
        
        // セルタップを無効にする
        #if false
        self.baseView.tableView.allowsSelection = false
        #endif
        
        // TableViewCellを読み込み
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        self.baseView.tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
}
// MARK: - TableView Delegate Method
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let s: UIStoryboard = UIStoryboard(name: "MainDetailViewController", bundle: nil)
        let vc: MainDetailViewController = s.instantiateInitialViewController() as! MainDetailViewController
        self.present(vc, animated: true, completion: nil)
    }
}
