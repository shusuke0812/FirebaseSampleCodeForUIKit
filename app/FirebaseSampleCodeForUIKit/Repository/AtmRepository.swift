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
    /// ATM情報一覧を取得する
    /// - Parameters:
    ///   - onSuccess: 成功した時に呼ばれる
    ///   - onError: 失敗した時に呼ばれる
    func getAtms(onSuccess: @escaping (_ atms: [(documentId: String, atm: Atm)]) -> Void, onError: @escaping (Error) -> Void)
}
class AtmRepository: AtmRepositoryProtocol {
}
// MARK: - Firebase Firestore Method
extension AtmRepository {
    func getAtms(onSuccess: @escaping (_ atms: [(documentId: String, atm: Atm)]) -> Void, onError: @escaping (Error) -> Void) {
        let db: Firestore = Firestore.firestore()
        let collectionReferencce = db.collection("atms")
        
        collectionReferencce.getDocuments { (snapshot, error) in
            if let error = error {
                print("DEBUG: atmの取得に失敗しました -> \(error)")
                onError(error)
                return
            }
            guard let snapshot = snapshot else { return }
            var atms: [(documentId: String, atm: Atm)] = []
            do {
                for document in snapshot.documents {
                    let atm = try Firestore.Decoder().decode(Atm.self, from: document.data())
                    atms.append((documentId: document.documentID, atm: atm))
                }
                onSuccess(atms)
            } catch {
                onError(error)
            }
        }
    }
}
