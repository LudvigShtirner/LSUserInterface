//
//  BaseNavigationController.swift
//
//
//  Created by Алексей Филиппов on 21.04.2024.
//

// Apple
import UIKit

final class BaseNavigationController: UINavigationController {
    func setBackGestureHandler(_ handler: UIGestureRecognizerDelegate) {
        interactivePopGestureRecognizer?.delegate = handler
    }
}
