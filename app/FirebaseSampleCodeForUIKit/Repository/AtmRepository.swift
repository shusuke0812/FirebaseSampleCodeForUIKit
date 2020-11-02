//
//  AtmRepository.swift
//  FirebaseSampleCodeForUIKit
//
//  Created by Shusuke Ota on 2020/11/2.
//  Copyright © 2020 shusuke. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

protocol AtmRepositoryProtocol {
    /// ATM情報を取得する
    /// - Parameters:
    ///   - atmId: atmドキュメントID
    ///   - onSuccess: 成功した時に呼ばれる
    ///   - onError: 失敗した時に呼ばれる
    func getAtms(atmId: String,
                 onSuccess: @escaping (_ atm: Atm) -> Void,
                 onError: @escaping (Error) -> Void)
}

class AtmRepository: AtmRepositoryProtocol {
}

extension AtmRepository {
    func getAtms(atmId: String, onSuccess: @escaping (_ atm: Atm) -> Void, onError: @escaping (Error) -> Void) {
        let db: Firestore = Firestore.firestore()
        let ref: DocumentReference = db.collection("atms").document(atmId)
        
        ref.getDocument { (snapshot, error) in
            if let error = error {
                print("DEBUG: atmの取得に失敗しました -> \(error)")
            }
            guard let snapshot = snapshot?.data() else { return }
            do {
                let atm = try Firestore.Decoder().decode(Atm.self, from: snapshot)
                onSuccess(atm)
            } catch (let error ) {
                onError(error)
                return
            }
        }
    }
}
