//
//  LSCollectionViewSectionModel.swift
//
//
//  Created by Алексей Филиппов on 28.07.2024.
//

// Apple
import UIKit

public protocol LSCollectionViewSectionModel: Hashable {
    associatedtype CellModel: LSCollectionViewCellModel
    var models: [CellModel] { get }
    
    var sectionId: String { get }
    
    var insets: UIEdgeInsets { get }
    var itemSpacing: CGFloat { get }
    var lineSpacing: CGFloat { get }
    
    var headerSize: CGSize { get }
    var footerSize: CGSize { get }
}
