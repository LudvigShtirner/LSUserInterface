//
//  CollectionViewDelegatesProxy.swift
//  
//
//  Created by Алексей Филиппов on 01.04.2023.
//

// Apple
import UIKit

class CollectionViewDelegatesProxy: NSObject {
    // MARK: - Dependencies
    var cellSizeBehaviour: CollectionCellSizeBehaviour?
    var willDisplayCellBehaviour: CollectionWillDisplayCellBehaviour?
    var didSelectCellBehaviour: CollectionViewDidSelectBehaviour?
    var didScrollBehaviour: CollectionViewDidScrollBehaviour?
    
    // MARK: - Message dispatch Overriding
    override func responds(to aSelector: Selector!) -> Bool {
        switch aSelector {
        case sizeForItemSelector:
            return cellSizeBehaviour != nil
        case willDisplayCellSelector:
            return willDisplayCellBehaviour != nil
        case didSelectCellSelector:
            return didSelectCellBehaviour != nil
        case didScrollSelector:
            return didScrollBehaviour != nil
        default:
            return super.responds(to: aSelector)
        }
    }
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        switch aSelector {
        case sizeForItemSelector:
            return checkResponder(cellSizeBehaviour, for: aSelector)
        case willDisplayCellSelector:
            return checkResponder(willDisplayCellBehaviour, for: aSelector)
        case didSelectCellSelector:
            return checkResponder(didSelectCellBehaviour, for: aSelector)
        case didScrollSelector:
            return checkResponder(didScrollBehaviour, for: aSelector)
        default:
            return nil
        }
    }
    
    // MARK: - Private methods
    private func checkResponder(_ responder: AnyObject?,
                                for aSelector: Selector) -> AnyObject? {
        guard let behaviour = responder,
              behaviour.responds(to: aSelector) else {
            return nil
        }
        return behaviour
    }
    
    private var sizeForItemSelector: Selector { #selector(UICollectionViewDelegateFlowLayout.collectionView(_:layout:sizeForItemAt:)) }
    private var willDisplayCellSelector: Selector { #selector(UICollectionViewDelegate.collectionView(_:willDisplay:forItemAt:)) }
    private var didSelectCellSelector: Selector { #selector(UICollectionViewDelegate.collectionView(_:didSelectItemAt:))}
    private var didScrollSelector: Selector { #selector(UIScrollViewDelegate.scrollViewDidScroll(_:))}
}
