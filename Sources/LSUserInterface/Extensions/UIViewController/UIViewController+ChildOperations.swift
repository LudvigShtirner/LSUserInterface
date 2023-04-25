//
//  UIViewController+ChildOperations.swift
//  SupportCode
//
//  Created by Алексей Филиппов on 05.01.2021.
//

// SPM
import SnapKit
// Apple
import UIKit

extension UIViewController {
    /// Связать контроллер как дочерний
    /// - Parameters:
    ///   - viewController: дочернее отображение
    ///   - container: контейнер для дочернего объекта
    public func embedViewController(_ viewController: UIViewController,
                                    into container: UIView) {
        loadViewIfNeeded()
        
        addChild(viewController)
        container.addSubview(viewController.view)
        
        container.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
        
        viewController.didMove(toParent: self)
    }
}
