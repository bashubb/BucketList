//
//  Location.swift
//  BucketList
//
//  Created by HubertMac on 07/11/2023.
//

import Foundation

struct Location: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
}
