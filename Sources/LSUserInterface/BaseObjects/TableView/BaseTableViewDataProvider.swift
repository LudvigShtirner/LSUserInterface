//
//  BaseTableViewDataProvider.swift
//  
//
//  Created by Алексей Филиппов on 22.02.2023.
//

// Apple
import UIKit

protocol BaseTableViewDataProvider: UITableViewDataSource, UITableViewDelegate {
    associatedtype Model
    
    func onSelect(_ closure: @escaping (Model) -> Void)
    func onDeselect(_ closure: @escaping (Model) -> Void)
}
