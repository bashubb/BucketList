//
//  extension FileManager.swift
//  BucketList
//
//  Created by HubertMac on 31/10/2023.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        // find full path of directory
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func encodeToFile<T: Encodable>(content: T, fileName: String) {
        let url = FileManager.documentsDirectory.appendingPathComponent(fileName)
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(content)
            let jsonString = String( decoding: data, as: UTF8.self)
            try jsonString.write(to: url, atomically: true, encoding: .utf8)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    func decode<T: Decodable>(_ type: T.Type, from fileName: String) -> T {
        
        let url = FileManager.documentsDirectory.appending(path: fileName)

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(fileName) from bundle.")
        }

        let decoder = JSONDecoder()
        

        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(fileName) from bundle due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(fileName) from bundle due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(fileName) from bundle due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(fileName) from bundle because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(fileName) from bundle: \(error.localizedDescription)")
        }
    }
        
}


