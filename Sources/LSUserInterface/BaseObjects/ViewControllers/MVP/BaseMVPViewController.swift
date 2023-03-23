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
    
    // MARK: - Life Cycle
    public init(input: T,
                output: U) {
        self.viewInput = input
        super.init(nibName: nil, bundle: nil)
        
        bindToOutput(output)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
