//
//  LSCollectionViewCellModel.swift
//
//
//  Created by Алексей Филиппов on 28.07.2024.
//

// SPM
import SupportCode
// Apple
import UIKit

public protocol LSCollectionViewCellModel: Identifiable, Hashable where ID == String {
    func makeCell(collectionView: UICollectionView,
                  indexPath: IndexPath) -> BaseCollectionViewCell
    
    var highlightable: Highlightable { get }
    var selectable: Selectable { get }
    
    var performPrimaryAction: VoidBlock? { get }
    
    var willDisplayAction: VoidBlock? { get }
    var didEndDisplayAction: VoidBlock? { get }
    
    var isEditable: Bool { get }
    
    var exampleCell: BaseCollectionViewCell { get }
}

public enum Highlightable {
    case no
    case yes(highlightAction: VoidBlock,
             unhighlightAction: VoidBlock?)
    
    var value: Bool {
        switch self {
        case .no: return false
        case .yes: return true
        }
    }
    
    var highlightAction: VoidBlock? {
        switch self {
        case .no: return nil
        case .yes(let highlightAction, _): return highlightAction
        }
    }
    
    var unhighlightAction: VoidBlock? {
        switch self {
        case .no: return nil
        case .yes(_, let unhighlightAction): return unhighlightAction
        }
    }
}

public enum Selectable {
    case no
    case yes(selectAction: VoidBlock,
             deselectAction: VoidBlock?)
    
    var value: Bool {
        switch self {
        case .no: return false
        case .yes: return true
        }
    }
    
    var selectAction: VoidBlock? {
        switch self {
        case .no: return nil
        case .yes(let selectAction, _): return selectAction
        }
    }
    
    var deselectAction: VoidBlock? {
        switch self {
        case .no: return nil
        case .yes(_, let deselectAction): return deselectAction
        }
    }
}
