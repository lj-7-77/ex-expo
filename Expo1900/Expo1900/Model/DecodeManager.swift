//
//  DecodeManager.swift
//  Expo1900
//
//  Created by 임지연 on 2023/02/16.
//

import UIKit

final class DecodeManager: Error {
    func parse() -> IntroExpositionData? {
        guard let asset = NSDataAsset(name: "exposition_universelle_1900") else {
            return nil
        }
        
        guard let decodeData = try? JSONDecoder().decode(
            IntroExpositionData.self,
            from: asset.data
        ) else {
            return nil
        }
        return decodeData
    }
}
