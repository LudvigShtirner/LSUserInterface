//
//  BaseNavigationController.swift
//
//
//  Created by Алексей Филиппов on 21.04.2024.
//

// Apple
import UIKit

open class BaseNavigationController: UINavigationController {
    // MARK: - Dependencies
    private let multiDelegate = BaseNavigationControllerDelegate()
    
    // MARK: - Data
    open override var delegate: (any UINavigationControllerDelegate)? {
        get { multiDelegate }
        set { 
            guard let newValue else { return }
            if newValue === multiDelegate { return }
            addDelegate(newValue)
        }
    }
    
    // MARK: - Life cycle
    public override init(nibName nibNameOrNil: String?,
                         bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil,
                   bundle: nibBundleOrNil)
    }
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Overrides
    open override func viewDidLoad() {
        super.viewDidLoad()
        delegate = multiDelegate
        setupUI()
        setupColors()
        setupConstraints()
    }
    
    open override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupColors()
    }
    
    // MARK: - Internal methods to override
    open func setupUI() {}
    open func setupColors() {}
    open func setupConstraints() {}
    
    // MARK: - Interface methods
    public func setBackGestureHandler(_ handler: UIGestureRecognizerDelegate) {
        interactivePopGestureRecognizer?.delegate = handler
    }
    
    public func addDelegate(_ delegate: UINavigationControllerDelegate) {
        multiDelegate.addDelegate(delegate)
    }
    
    public func removeDelegate(_ delegate: UINavigationControllerDelegate) {
        multiDelegate.removeDelegate(delegate)
    }
}

private final class BaseNavigationControllerDelegate: NSObject {
    // MARK: - Data
    private var delegates = NSHashTable<UINavigationControllerDelegate>.weakObjects()
    
    // MARK: - Interface methods
    public func addDelegate(_ delegate: UINavigationControllerDelegate) {
        delegates.add(delegate)
    }
    
    public func removeDelegate(_ delegate: UINavigationControllerDelegate) {
        delegates.remove(delegate)
    }
}

extension BaseNavigationControllerDelegate: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        delegates.allObjects.forEach {
            $0.navigationController?(navigationController,
                                     willShow: viewController,
                                     animated: animated)
        }
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController,
                              animated: Bool) {
        delegates.allObjects.forEach {
            $0.navigationController?(navigationController,
                                     didShow: viewController,
                                     animated: animated)
        }
    }
    
    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        delegates.allObjects
            .compactMap {
                $0.navigationControllerSupportedInterfaceOrientations?(navigationController)
            }
            .first ?? .portrait
    }
    
    func navigationControllerPreferredInterfaceOrientationForPresentation(_ navigationController: UINavigationController) -> UIInterfaceOrientation {
        delegates.allObjects
            .compactMap {
                $0.navigationControllerPreferredInterfaceOrientationForPresentation?(navigationController)
            }
            .first ?? .portrait
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              interactionControllerFor animationController: any UIViewControllerAnimatedTransitioning) -> (any UIViewControllerInteractiveTransitioning)? {
        delegates.allObjects
            .compactMap {
                $0.navigationController?(navigationController,
                                         interactionControllerFor: animationController)
            }
            .first
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        delegates.allObjects
            .compactMap {
                $0.navigationController?(navigationController,
                                         animationControllerFor: operation,
                                         from: fromVC,
                                         to: toVC)
            }
            .first
    }
}
