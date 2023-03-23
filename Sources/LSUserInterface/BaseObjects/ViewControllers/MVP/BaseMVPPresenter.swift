//
//  BaseMVPPresenter.swift
//  
//
//  Created by Алексей Филиппов on 19.03.2023.
//

// Apple
import Foundation

public protocol BaseMVPPresenter: AnyObject {
    // MARK: - Typealiases
    associatedtype MVPInput: BaseMVPPresenterInput
    associatedtype MVPOutput
    associatedtype MVPCoordinatorInteractor
    
    // MARK: - Interfaces
    var input: MVPInput { get }
    var output: MVPOutput { get }
    var coordinatorInteractor: MVPCoordinatorInteractor { get }
}

public protocol BaseMVPPresenterInput: AnyObject {
    func moduleDidLoad()
}
