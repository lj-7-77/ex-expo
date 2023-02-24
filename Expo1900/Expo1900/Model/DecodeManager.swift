//
//  DecodeManager.swift
//  Expo1900
//
//  Created by 임지연 on 2023/02/16.
//

import UIKit

final class DecodeManager: Error {
    func parse<T: Decodable>(file: String) -> T? {
        guard let asset = NSDataAsset(name: file) else {
            return nil
        }
        
        guard let decodeData =
                try? JSONDecoder().decode(T.self, from: asset.data) else {
            return nil
        }
        return decodeData
    }
}
