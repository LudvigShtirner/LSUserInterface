//
//  BaseCollectionViewDataProvider.swift
//  
//
//  Created by Алексей Филиппов on 22.03.2023.
//

// Apple
import UIKit

protocol BaseCollectionViewDataProvider: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    associatedtype Model
    
    func onSelect(_ closure: @escaping (Model) -> Void)
    func onDeselect(_ closure: @escaping (Model) -> Void)
}
