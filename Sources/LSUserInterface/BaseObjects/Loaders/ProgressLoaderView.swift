//
//  ProgressLoaderView.swift
//  
//
//  Created by Алексей Филиппов on 07.04.2024.
//

// SPM
import SupportCode
// Apple
import UIKit

public final class ProgressLoaderView: DesignedView {
    // MARK: - Data
    private var progressTimer: ProgressTimer?
    
    // MARK: - Proxies
    private static let updateLayer: (ProgressLoaderView, Any) -> Void = { (instance, _) in instance.progressLayer!.setNeedsDisplay() }
    
    @ProxyWithAction(\.progressLayer.trackTintColor, extraAction: ProgressLoaderView.updateLayer)
    public var trackTintColor: UIColor
    
    @ProxyWithAction(\.progressLayer.progressTintColor, extraAction: ProgressLoaderView.updateLayer)
    public var progressTintColor: UIColor
    
    @ProxyWithAction(\.progressLayer.innerTintColor, extraAction: ProgressLoaderView.updateLayer)
    public var innerTintColor: UIColor?
    
    @ProxyWithAction(\.progressLayer.roundedCorners, extraAction: ProgressLoaderView.updateLayer)
    public var roundedCorners: Bool
    
    @ProxyWithAction(\.progressLayer.thicknessRatio, extraAction: ProgressLoaderView.updateLayer)
    public var thicknessRatio: CGFloat
    
    @ProxyWithAction(\.progressLayer.clockwise, extraAction: ProgressLoaderView.updateLayer)
    public var clockwise: Bool
    
    public var progress: CGFloat { progressLayer.progress }
    
    var isAnimating: Bool {
        progressLayer.animation(forKey: AnimationKeys.progress) != nil
    }
    
    // MARK: - Life cycle
    public override init() {
        super.init(frame: .zero)
        backgroundColor = .clear
    }
    
    // MARK: - Overrides
    private var progressLayer: ProgressLayer! { layer as? ProgressLayer }
    public override class var layerClass: AnyClass { ProgressLayer.self }
    
    public override func didMoveToWindow() {
        super.didMoveToWindow()
        
        guard let window else { return }
        progressLayer.contentsScale = window.screen.scale
        progressLayer.setNeedsDisplay()
    }
    
    // MARK: - Interface methods
    public func updateProgress(_ progress: CGFloat,
                               animated: Animation = .none) {
        let pinnedProgress = progress.inRange(min: 0, max: 1)
        switch animated {
        case .none:
            progressLayer.removeAnimation(forKey: AnimationKeys.progress)
            progressLayer.progress = pinnedProgress
            progressLayer.setNeedsDisplay()
        case .has(let duration):
            animate(pinnedProgress,
                    duration: duration,
                    completion: nil)
        case .hasWithCompletion(let duration, let completion):
            animate(pinnedProgress,
                    duration: duration,
                    completion: completion)
        }
    }
    
    // MARK: - Subtypes
    public enum Animation {
        case none
        case has(duration: CFTimeInterval)
        case hasWithCompletion(duration: CFTimeInterval, completion: VoidBlock)
    }
}

// MARK: - Private methods
private extension ProgressLoaderView {
    func animate(_ pinnedProgress: CGFloat,
                 duration: CFTimeInterval,
                 completion: VoidBlock?) {
        let animationDuration: CFTimeInterval = {
            if duration > .zero { return duration }
            return CFTimeInterval(abs(max(progress - self.progress, 0.3)))
        }()
        
        progressTimer?.invalidate()
        
        let currentProgress = progressLayer.progress
        progressTimer = ProgressTimer(updateStep: 0.03,
                                      finishTime: animationDuration)
        progressTimer?.configureAndStart { [weak self] progress in
            self?.progressLayer.progress = (pinnedProgress - currentProgress) * progress + currentProgress
            self?.progressLayer.setNeedsDisplay()
            if progress.isAlmostEqual(to: 1) {
                self?.progressTimer?.invalidate()
                completion?()
            }
        }
    }
    
    func callCompletionIfHas(animation: CAAnimation) {
        let value = animation.value(forKey: AnimationKeys.completionBlock)
        guard let block = value as? VoidBlock else {
            return
        }
        block()
    }
    
    struct AnimationKeys {
        static let progress = "progress"
        static let completionBlock = "completionBlock"
        static let toValue = "toValue"
    }
}

// MARK: - Animation Delegate
extension ProgressLoaderView: CAAnimationDelegate {
    public func animationDidStop(_ animation: CAAnimation,
                                 finished flag: Bool) {
        guard flag else {
            return
        }
        progressLayer.removeAnimation(forKey: AnimationKeys.progress)
        let completedValue = animation.value(forKey: AnimationKeys.toValue)
        if let completedValue = completedValue as? CGFloat {
            if progressLayer.progress.isAlmostEqual(to: completedValue) {
                progressLayer.progress = completedValue
            }
        }
        callCompletionIfHas(animation: animation)
    }
}

// MARK: - SwiftUI Preview
import SwiftUI

struct ProgressLoaderViewPreviews: PreviewProvider {
    static var previews: some View {
        SwiftUIPreview {
            let view = UIView()
            view.backgroundColor = .lightGray
            
            let progress = Self.progress
            
            view.addSubview(progress)
            progress.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.width.height.equalTo(50)
            }
            
            let button = Self.button
                .onEvent(.touchUpInside) { [weak progress] in
                    guard let progress else { return }
                    var newProgress = progress.progress + 0.1
                    newProgress = newProgress > 1.0 ? .zero : newProgress
                    progress.updateProgress(newProgress,
                                            animated: .has(duration: 0.3))
                }
            view.addSubview(button)
            button.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalTo(240)
                make.height.equalTo(44)
                make.top.equalTo(progress.snp.bottom).offset(16)
            }
            return view
        }
        .previewLayout(.fixed(width: 375, height: 44))
        .edgesIgnoringSafeArea(.vertical)
    }
    
    static private var progress: ProgressLoaderView {
        let progress = ProgressLoaderView()
        progress.clockwise = true
        progress.roundedCorners = false
        progress.thicknessRatio = 0.4
        return progress
    }
    
    static private var button: DesignedButton {
        DesignedButton()
            .usingTitle(.init(normalText: "ProgressView update"))
            .usingBorder(.fixed(width: 2, color: .init(color: .white)))
            .usingCornerRadius(.fixed(8))
    }
}
