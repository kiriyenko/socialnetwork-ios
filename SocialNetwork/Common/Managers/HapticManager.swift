//
//  HapticManager.swift
//  SocialNetwork
//
//  Created by Taras Kiriienko on 28/11/2019.
//  Copyright © 2019 Taras Kiriienko. All rights reserved.
//

import UIKit
import Foundation

enum HapticType: String {
    case impact
    case selection
}

class HapticManager: NSObject {
    
    static let shared = HapticManager()
    
    // MARK: Methods
    
    func generateFeedback(_ type: HapticType) {
        switch type {
        case .impact:
            let impact = UIImpactFeedbackGenerator()
            impact.impactOccurred()
        case .selection:
            let selection = UISelectionFeedbackGenerator()
            selection.selectionChanged()
        }
    }
    
}
