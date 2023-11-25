//
//  DesignedView.swift
//  
//
//  Created by Алексей Филиппов on 04.12.2022.
//

// Apple
import UIKit

open class DesignedView: BaseView, DesignedViewInterfaceInternal, DesignedElementInsertable {
    // MARK: - DesignedViewInterface
    var viewBehaviour = DesignedViewBehaviour()
    
    // MARK: - Inits
    public init() {
        super.init(frame: .zero)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrides
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        viewBehaviour.layoutSubviews(view: self)
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        viewBehaviour.traitCollectionDidChange(view: self)
    }
}
