//
//  ViewController.swift
//  FirebaseSampleCodeForUIKit
//
//  Created by Shusuke Ota on 2020/6/20.
//  Copyright © 2020 shusuke. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // セルタップを無効にする
        #if false
        tableView.allowsSelection = false
        #endif
        
        // TableViewCellを読み込み
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
    }
        
    // MARK: - Private Method
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let s: UIStoryboard = UIStoryboard(name: "MainDetailViewController", bundle: nil)
        let vc: MainDetailViewController = s.instantiateInitialViewController() as! MainDetailViewController
        self.present(vc, animated: true, completion: nil)
    }
}

