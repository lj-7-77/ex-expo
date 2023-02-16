//
//  DecodeManager.swift
//  Expo1900
//
//  Created by 임지연 on 2023/02/16.
//

import UIKit

final class DecodeManager: Error {
    func parse() {
        guard let asset = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }

        do {
            let decodeData = try JSONDecoder().decode(ExpositionData.self, from: asset.data)
            print(decodeData)
        } catch {
            print(error.localizedDescription)
        }
    }
}
