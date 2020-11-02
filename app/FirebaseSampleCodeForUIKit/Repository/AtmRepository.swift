//
//  AtmRepository.swift
//  FirebaseSampleCodeForUIKit
//
//  Created by Shusuke Ota on 2020/11/2.
//  Copyright © 2020 shusuke. All rights reserved.
//

import Foundation

protocol AtmRepositoryProtocol {
    /// ATM情報を取得する
    func getAtms(atmId: String,
                 onSuccess: @escaping () -> Void,
                 onError: @escaping (String) -> Void)
}

class AtmRepository: AtmRepositoryProtocol {
}

extension AtmRepository {
    func getAtms(atmId: String, onSuccess: @escaping () -> Void, onError: @escaping (String) -> Void) {
        print("")
    }
}
