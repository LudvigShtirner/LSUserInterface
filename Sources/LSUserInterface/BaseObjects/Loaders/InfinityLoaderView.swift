//
//  InfinityLoaderView.swift
//
//
//  Created by Алексей Филиппов on 06.04.2024.
//

// SPM
import SupportCode
// Apple
import UIKit

public final class InfinityLoaderView: DesignedView {
    // MARK: - Data
    public var duration: CFTimeInterval = 1.0
    
    // MARK: - Proxies
    static let updateLayer: (InfinityLoaderView, Any) -> Void = { (instance, _) in
        instance.progressLayer!.setNeedsDisplay()
    }
    
    @ProxyWithAction(\.progressLayer.trackTintColor, extraAction: InfinityLoaderView.updateLayer)
    public var trackTintColor: UIColor
    
    @ProxyWithAction(\.progressLayer.progressTintColor, extraAction: InfinityLoaderView.updateLayer)
    public var progressTintColor: UIColor
    
    @ProxyWithAction(\.progressLayer.innerTintColor, extraAction: InfinityLoaderView.updateLayer)
    public var innerTintColor: UIColor?
    
    @ProxyWithAction(\.progressLayer.roundedCorners, extraAction: InfinityLoaderView.updateLayer)
    public var roundedCorners: Bool
    
    @ProxyWithAction(\.progressLayer.thicknessRatio, extraAction: InfinityLoaderView.updateLayer)
    public var thicknessRatio: CGFloat
    
    @ProxyWithAction(\.progressLayer.clockwise, extraAction: InfinityLoaderView.updateLayer)
    public var clockwise: Bool
    
    @Proxy(\.progressLayer.progress)
    public var progress: CGFloat
    
    var isAnimating: Bool {
        progressLayer.animation(forKey: AnimationKeys.animation) != nil
    }
    
    // MARK: - Life cycle
    public override init() {
        super.init(frame: .zero)
        backgroundColor = .clear
        isHidden = true
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
    public func startAnimation() {
        stopAnimation()
        addAnimation()
        isHidden = false
    }
    
    public func stopAnimation() {
        guard isAnimating else {
            return
        }
        isHidden = true
        progressLayer.removeAnimation(forKey: AnimationKeys.animation)
    }
}

// MARK: - Private methods
private extension InfinityLoaderView {
    func addAnimation() {
        let animation = CABasicAnimation(keyPath: AnimationKeys.transformRotation)
        animation.byValue = clockwise ? 2 * Double.pi : -2 * Double.pi
        animation.duration = duration
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        progressLayer.add(animation, forKey: AnimationKeys.animation)
    }
    
    struct AnimationKeys {
        static let animation = "animation"
        static let transformRotation = "transform.rotation"
        static let toValue = "toValue"
    }
}

// MARK: - SwiftUI Preview
import SwiftUI

struct InfinityLoaderViewPreviews: PreviewProvider {
    static var previews: some View {
        SwiftUIPreview {
            let view = UIView()
            view.backgroundColor = .lightGray
            
            let loader = InfinityLoaderView()
            view.addSubview(loader)
            loader.snp.makeConstraints { make in
                make.center.equalToSuperview()
                make.width.height.equalTo(50)
            }
            loader.progress = 0.7
            loader.clockwise = true
            loader.roundedCorners = false
            loader.thicknessRatio = 0.4
            
            let button = DesignedButton()
                .setTitle(.init(normalText: "LoaderView Toggle"))
                .setBorder(.fixed(width: 2, color: .init(color: .white)))
                .setCornerRadius(.fixed(8))
                .onEvent(.touchUpInside) { [weak loader] in
                    guard let loader else { return }
                    if loader.isAnimating {
                        loader.stopAnimation()
                    } else {
                        loader.startAnimation()
                    }
                }
            view.addSubview(button)
            button.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.width.equalTo(240)
                make.height.equalTo(44)
                make.top.equalTo(loader.snp.bottom).offset(16)
            }
            
            return view
        }
        .previewLayout(.fixed(width: 375, height: 44))
        .edgesIgnoringSafeArea(.vertical)
    }
}
