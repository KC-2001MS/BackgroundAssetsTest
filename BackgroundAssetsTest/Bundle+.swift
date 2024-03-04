//
//  Bundle+.swift
//  BackgroundAssetsTest
//  
//  Created by Keisuke Chinone on 2024/02/29.
//


import Foundation

extension Bundle {
    func decodeJSON<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Faild to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
    
    func decodeJSON<T: Codable>(_ file: URL) -> T {
        guard let data = try? Data(contentsOf: file, options: .mappedIfSafe) else {
            fatalError("Failed to decode \(file.absoluteString) from bundle.")
        }
        let decoder = JSONDecoder()
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file.absoluteString) from bundle.")
        }
        return loaded
    }
    
    func encodeJSON<T: Codable>(data: T,_ file: URL) {
        let encoder = JSONEncoder()
        guard let loaded = try? encoder.encode(data) else {
            fatalError("Failed to decode \(file.absoluteString) from bundle.")
        }
        
        guard let _ = try? loaded.write(to: file, options: .atomic) else {
            return
        }
    }
}
