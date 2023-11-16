//
//  Result.swift
//  BucketList
//
//  Created by HubertMac on 16/11/2023.
//

import Foundation


struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    static func <(lhs: Page, rhs: Page) -> Bool {
        lhs.title < rhs.title
    }
}

