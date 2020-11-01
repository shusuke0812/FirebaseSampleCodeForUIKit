//
//  MainViewModel.swift
//  FirebaseSampleCodeForUIKit
//
//  Created by Shusuke Ota on 2020/11/1.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class MainViewModel: NSObject {
    
}

// MARK: - TableView DataSource
extension MainViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能なCellを得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // 値を設定する
        cell.textLabel!.text = "Row \(indexPath.row)"
        
        return cell
    }
}
