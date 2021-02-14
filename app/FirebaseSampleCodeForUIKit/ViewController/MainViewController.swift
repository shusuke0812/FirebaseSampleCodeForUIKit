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
    private var baseView: MainBaseView { self.view as! MainBaseView }
    /// ViewModel
    private var viewModel: MainViewModel!
    
    // MARK: - Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MainViewModel(atmRepository: AtmRepository())
        self.setDelegateDataSource()
        // Firestoreデータを読み込み
        self.viewModel.getAtms()
    }
}
// MARK: - Initialized Method
extension MainViewController {
    private func setDelegateDataSource() {
        self.baseView.tableView.dataSource = self.viewModel
        self.baseView.tableView.delegate = self
        self.viewModel.delegate = self
    }
    private func transitionMainDetailPage() {
        let s = UIStoryboard(name: "MainDetailViewController", bundle: nil)
        let vc = s.instantiateInitialViewController() as! MainDetailViewController
        self.present(vc, animated: true, completion: nil)
    }
}
// MARK: - TableView Delegate Method
extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
// MARK: - MainViewModel Delegate Method
extension MainViewController: MainViewModelDelegate {
    func didSuccessGetAtm() {
        self.baseView.tableView.reloadData()
    }
    func didFailedGetAtm(errorMessage: String) {
        print(errorMessage)
    }
}
