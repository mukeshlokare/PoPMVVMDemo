//
//  JsonParsorExtension.swift
//  plexigo
//
//  Created by Mukesh Lokare on 06/12/20.
//  Copyright © 2020 neosoft. All rights reserved.
//

import Foundation
// Decodable Extension
extension Decodable {
    static func decode(data: Data) throws -> Self {
        let decoder = JSONDecoder()
        return try decoder.decode(Self.self, from: data)
    }
}

// Encodable Extension
extension Encodable {
    func encode() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return try encoder.encode(self)
    }
}

 extension KeyedDecodingContainer {
     public func decodeSafelyIfPresent<T: Decodable>(_ key: KeyedDecodingContainer.Key) -> T? {
         return self.decodeSafelyIfPresent(T.self, forKey: key)
     }
     
     public func decodeSafelyIfPresent<T: Decodable>(_ type: T.Type, forKey key: KeyedDecodingContainer.Key) -> T? {
         let decoded = ((try? decodeIfPresent(SafeProcess<T>.self, forKey: key)) as SafeProcess<T>??)
         return decoded??.value
     }
 }
 public struct SafeProcess<Base: Decodable>: Decodable {
     public let value: Base?
     public init(from decoder: Decoder) throws {
         do {
             let container = try decoder.singleValueContainer()
             self.value = try container.decode(Base.self)
         } catch let error {
            //print(error)
             self.value = nil
         }
     }
 }
