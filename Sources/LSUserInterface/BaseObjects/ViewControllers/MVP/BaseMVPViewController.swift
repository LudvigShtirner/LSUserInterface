//
//  BaseMVPViewController.swift
//  
//
//  Created by Алексей Филиппов on 19.03.2023.
//

// Apple
import UIKit

open class BaseMVPViewController<
    T: BaseMVPPresenterInput,
    U: AnyObject
>: BaseViewController {
    // MARK: - Dependencies
    public let viewInput: T
    
    // MARK: - Inits
    public init(input: T,
                output: U) {
        self.viewInput = input
        super.init(nibName: nil, bundle: nil)
        
        bindToOutput(output)
    }
    
    // MARK: - Overrides methods
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        viewInput.moduleDidLoad()
    }
    
    // MARK: - To override
    open func bindToOutput(_ output: U) {
        
    }
}
