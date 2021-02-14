//
//  MainViewModel.swift
//  FirebaseSampleCodeForUIKit
//
//  Created by Shusuke Ota on 2020/11/1.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

protocol MainViewModelDelegate: class {
    /// atmの取得に成功した
    func didSuccessGetAtm()
    /// atmの取得に失敗した
    /// - Parameter errorMessage: エラーメッセージ
    func didFailedGetAtm(errorMessage: String)
}

class MainViewModel: NSObject {
    /// atmリポジトリ
    private let atmRepository: AtmRepositoryProtocol
    /// デリゲート
    internal weak var delegate: MainViewModelDelegate?
    /// atm
    var atms: [(documentId: String, atm: Atm)] = []
    
    init(atmRepository: AtmRepositoryProtocol) {
        self.atmRepository = atmRepository
    }
}

// MARK: - TableView DataSource Method
extension MainViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.atms.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.setUI(atm: self.atms[indexPath.row].atm)
        return cell
    }
}
// MARK: - Firebase Firestore Method
extension MainViewModel {
    func getAtms() {
        self.atmRepository.getAtms(onSuccess: { [weak self] atms in
            self?.atms = atms
            self?.delegate?.didSuccessGetAtm()
        }) { error in
            print(error.localizedDescription)
            self.delegate?.didFailedGetAtm(errorMessage: "ATM情報一覧の取得に失敗しました")
        }
    }
}
