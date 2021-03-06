//
//  Atm.swift
//  FirebaseSampleCodeForUIKit
//
//  Created by Shusuke Ota on 2020/11/2.
//  Copyright © 2020 shusuke. All rights reserved.
//

import Foundation

struct Atm: Codable {
    /// ATM支店名
    internal var atmName: String = ""
    /// ATM住所
    internal var atmAddress: String = ""
    /// ATM種別
    internal var atmKind: String = ""
    /// お気に入りフラグ
    internal var favorite: Bool?
    /// アイコン
    internal var iconImage: String = ""
    
    enum CodingKeys: String, CodingKey {
        case atmName
        case atmAddress
        case atmKind
        case favorite
        case iconImage
    }
    
    init() {
        self.favorite = nil
    }
}

extension Atm {
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.atmName, forKey: .atmName)
        try container.encode(self.atmAddress, forKey: .atmAddress)
        try container.encode(self.atmKind, forKey: .atmKind)
        try container.encode(self.favorite, forKey: .favorite)
        try container.encode(self.iconImage, forKey: .iconImage)
    }
}
