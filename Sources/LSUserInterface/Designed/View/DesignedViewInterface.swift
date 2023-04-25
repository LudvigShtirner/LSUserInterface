//
//  DesignedViewInterface.swift
//  
//
//  Created by Алексей Филиппов on 22.04.2023.
//

// Apple
import UIKit

public protocol DesignedViewInterface: UIView {
    @discardableResult
    func setParameter<T>(_ parameter: WritableKeyPath<DesignedViewParameters, T>,
                         with value: T) -> Self
}

protocol DesignedViewInterfaceInternal: DesignedViewInterface {
    var viewBehaviour: DesignedViewBehaviour { get set }
}

extension DesignedViewInterfaceInternal {
    @discardableResult
    public func setParameter<T>(_ parameter: WritableKeyPath<DesignedViewParameters, T>,
                                with value: T) -> Self {
        viewBehaviour.addParameter(parameter,
                                   with: value,
                                   for: self)
        return self
    }
}
