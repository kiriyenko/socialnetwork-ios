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
    case success
    case error
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
        case .success:
            let success = UINotificationFeedbackGenerator()
            success.notificationOccurred(.success)
        case .error:
            let error = UINotificationFeedbackGenerator()
            error.notificationOccurred(.error)
        }
    }
    
}
