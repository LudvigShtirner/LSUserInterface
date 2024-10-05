//
//  LSCollectionViewDataSource.swift
//
//
//  Created by Алексей Филиппов on 28.07.2024.
//

// Apple
import UIKit

protocol LSCollectionViewDataSource {
    var isEmpty: Bool { get }
    
    func reloadAll(with snapshot: LSCollectionViewSnapshot)
    func reloadCell(with model: any LSCollectionViewCellModel)
}

final class LSCollectionViewDataSourceBase: NSObject {
    // MARK: - Dependencies
    private let cellSizeDefiner: LSCollectionViewCellSizeDefiner
    
    // MARK: - Data
    private var dataSource: UICollectionViewDiffableDataSource<LSCollectionViewSectionModelErased, LSCollectionViewCellModelErased>!
    private var currentSnapshot = NSDiffableDataSourceSnapshot<LSCollectionViewSectionModelErased, LSCollectionViewCellModelErased>()
    
    private let cellSizeType: CollectionCellSizeType
    
    private var snapshot = LSCollectionViewSnapshot(sections: [])
    private var sections: [any LSCollectionViewSectionModel] { snapshot.sections }
    
    // MARK: - Inits
    init(collectionView: UICollectionView,
         cellSizeType: CollectionCellSizeType,
         layoutType: CollectionViewLayoutType) {
        self.cellSizeType = cellSizeType
        self.cellSizeDefiner = LSCollectionViewCellSizeDefiner(collectionView: collectionView,
                                                               cellSizeType: cellSizeType,
                                                               layoutType: layoutType)
        super.init()
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView,
                                                        cellProvider: { [weak self] (collectionView, indexPath, item) in
            guard let self, let model = getModel(for: indexPath) else {
                return nil
            }
            return model.makeCell(collectionView: collectionView,
                                  indexPath: indexPath)
        })
        collectionView.dataSource = dataSource
        collectionView.delegate = self
        dataSource.apply(currentSnapshot)
    }
}

// MARK: - LSCollectionViewDataSource
extension LSCollectionViewDataSourceBase: LSCollectionViewDataSource {
    var isEmpty: Bool { snapshot.isEmpty }
    
    func reloadAll(with snapshot: LSCollectionViewSnapshot) {
        self.snapshot = snapshot
        currentSnapshot = NSDiffableDataSourceSnapshot<LSCollectionViewSectionModelErased, LSCollectionViewCellModelErased>()
        let sections = snapshot.sections.map {
            LSCollectionViewSectionModelErased(id: $0.sectionId,
                                               models: $0.models)
        }
        currentSnapshot.appendSections(sections)
        for section in sections {
            let models = section.models.map {
                LSCollectionViewCellModelErased(model: $0)
            }
            currentSnapshot.appendItems(models, toSection: section)
        }
        dataSource.apply(currentSnapshot)
    }
    
    func reloadCell(with model: any LSCollectionViewCellModel) {
        let model = LSCollectionViewCellModelErased(model: model)
        currentSnapshot.reloadItems([model])
        dataSource.apply(currentSnapshot)
    }
}

// MARK: - Private methods
private extension LSCollectionViewDataSourceBase {
    func getModel(for indexPath: IndexPath) -> (any LSCollectionViewCellModel)? {
        sections[safe: indexPath.section]?
            .models[safe: indexPath.item]
    }
}

// MARK: - UICollectionViewDelegate
extension LSCollectionViewDataSourceBase: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        getModel(for: indexPath)?.selectable.value ?? true
    }

    func collectionView(_ collectionView: UICollectionView,
                        didHighlightItemAt indexPath: IndexPath) {
        getModel(for: indexPath)?.highlightable.highlightAction?()
    }

    func collectionView(_ collectionView: UICollectionView, 
                        didUnhighlightItemAt indexPath: IndexPath) {
        getModel(for: indexPath)?.highlightable.unhighlightAction?()
    }

    func collectionView(_ collectionView: UICollectionView,
                        shouldSelectItemAt indexPath: IndexPath) -> Bool {
        getModel(for: indexPath)?.selectable.value ?? true
    }

    func collectionView(_ collectionView: UICollectionView,
                        shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        getModel(for: indexPath)?.selectable.value ?? true
    }

    func collectionView(_ collectionView: UICollectionView, 
                        didSelectItemAt indexPath: IndexPath) {
        getModel(for: indexPath)?.selectable.selectAction?()
    }

    func collectionView(_ collectionView: UICollectionView,
                        didDeselectItemAt indexPath: IndexPath) {
        getModel(for: indexPath)?.selectable.deselectAction?()
    }
    
    @available(iOS 16.0, *)
    func collectionView(_ collectionView: UICollectionView,
                        canPerformPrimaryActionForItemAt indexPath: IndexPath) -> Bool {
        getModel(for: indexPath)?.performPrimaryAction != nil
    }
    
    @available(iOS 16.0, *)
    func collectionView(_ collectionView: UICollectionView,
                        performPrimaryActionForItemAt indexPath: IndexPath) {
        getModel(for: indexPath)?.performPrimaryAction?()
    }

    func collectionView(_ collectionView: UICollectionView, 
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        getModel(for: indexPath)?.willDisplayAction?()
    }

    func collectionView(_ collectionView: UICollectionView,
                        willDisplaySupplementaryView view: UICollectionReusableView,
                        forElementKind elementKind: String,
                        at indexPath: IndexPath) {
        #warning("No implementations")
    }

    func collectionView(_ collectionView: UICollectionView,
                        didEndDisplaying cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        getModel(for: indexPath)?.didEndDisplayAction?()
    }

    func collectionView(_ collectionView: UICollectionView,
                        didEndDisplayingSupplementaryView view: UICollectionReusableView,
                        forElementOfKind elementKind: String,
                        at indexPath: IndexPath) {
#warning("No implementations")
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        transitionLayoutForOldLayout fromLayout: UICollectionViewLayout,
                        newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
#warning("No implementations")
        return UICollectionViewTransitionLayout(currentLayout: fromLayout,
                                                nextLayout: toLayout)
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        canFocusItemAt indexPath: IndexPath) -> Bool {
#warning("No implementations")
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool {
#warning("No implementations")
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        didUpdateFocusIn context: UICollectionViewFocusUpdateContext,
                        with coordinator: UIFocusAnimationCoordinator) {
#warning("No implementations")
    }
    
    func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath? {
#warning("No implementations")
        return nil
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        selectionFollowsFocusForItemAt indexPath: IndexPath) -> Bool {
#warning("No implementations")
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        targetIndexPathForMoveOfItemFromOriginalIndexPath originalIndexPath: IndexPath,
                        atCurrentIndexPath currentIndexPath: IndexPath,
                        toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
#warning("No implementations")
        return proposedIndexPath
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
#warning("No implementations")
        return proposedContentOffset
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        canEditItemAt indexPath: IndexPath) -> Bool {
        getModel(for: indexPath)?.isEditable ?? true
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        shouldSpringLoadItemAt indexPath: IndexPath,
                        with context: any UISpringLoadedInteractionContext) -> Bool {
#warning("No implementations")
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
#warning("No implementations")
        return false
    }

    func collectionView(_ collectionView: UICollectionView,
                        didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
#warning("No implementations")
    }

    func collectionViewDidEndMultipleSelectionInteraction(_ collectionView: UICollectionView) {
#warning("No implementations")
    }
    
    @available(iOS 16, *)
    func collectionView(_ collectionView: UICollectionView,
                        contextMenuConfigurationForItemsAt indexPaths: [IndexPath],
                        point: CGPoint) -> UIContextMenuConfiguration? {
#warning("No implementations")
        return nil
    }
    
    @available(iOS 16, *)
    func collectionView(_ collectionView: UICollectionView,
                        contextMenuConfiguration configuration: UIContextMenuConfiguration,
                        highlightPreviewForItemAt indexPath: IndexPath) -> UITargetedPreview? {
#warning("No implementations")
        return nil
    }
    
    @available(iOS 16, *)
    func collectionView(_ collectionView: UICollectionView,
                        contextMenuConfiguration configuration: UIContextMenuConfiguration,
                        dismissalPreviewForItemAt indexPath: IndexPath) -> UITargetedPreview? {
#warning("No implementations")
        return nil
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration,
                        animator: any UIContextMenuInteractionCommitAnimating) {
#warning("No implementations")
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                        willDisplayContextMenu configuration: UIContextMenuConfiguration,
                        animator: (any UIContextMenuInteractionAnimating)?) {
#warning("No implementations")
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willEndContextMenuInteraction configuration: UIContextMenuConfiguration,
                        animator: (any UIContextMenuInteractionAnimating)?) {
#warning("No implementations")
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        sceneActivationConfigurationForItemAt indexPath: IndexPath,
                        point: CGPoint) -> UIWindowScene.ActivationConfiguration? {
#warning("No implementations")
        return nil
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        contextMenuConfigurationForItemAt indexPath: IndexPath,
                        point: CGPoint) -> UIContextMenuConfiguration? {
#warning("No implementations")
        return nil
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
#warning("No implementations")
        return nil
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
#warning("No implementations")
        return nil
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension LSCollectionViewDataSourceBase: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let section = sections[safe: indexPath.section],
              let model = getModel(for: indexPath) else {
            return .zero
        }
        return cellSizeDefiner.defineSize(indexPath: indexPath,
                                          section: section,
                                          model: model)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let model = sections[section]
        return model.insets
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        let model = sections[section]
        return model.lineSpacing
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        let model = sections[section]
        return model.itemSpacing
    }

    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        let model = sections[section]
        return model.headerSize
    }

    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForFooterInSection section: Int) -> CGSize {
        let model = sections[section]
        return model.footerSize
    }
}
