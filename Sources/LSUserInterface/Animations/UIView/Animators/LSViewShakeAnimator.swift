//
//  LSViewShakeAnimator.swift
//
//
//  Created by Алексей Филиппов on 23.11.2023.
//

// SPM
import SupportCode
// Apple
import UIKit

struct LSViewShakeAnimator: LSKeyFrameAnimator {
    // MARK: - Data
    private let view: UIView
    private let shakeSteps: [ShakeStep]
    private let completion: BoolBlock?
    
    // MARK: - Inits
    init(view: UIView,
         shakeSteps: [ShakeStep],
         completion: BoolBlock?) {
        self.view = view
        self.shakeSteps = shakeSteps
        self.completion = completion
    }
    
    // MARK: - LSAnimator
    var key: String { "position.x" }
    
    func alreadyAtFinishState() -> Bool {
        return false
    }
    
    func preaction() {
        view.layer.removeAnimation(forKey: key)
    }
    
    func runAnimation(_ animation: CAKeyframeAnimation) {
        animation.values = shakeSteps.map(\.value)
        animation.keyTimes = shakeSteps.map { NSNumber(floatLiteral: $0.keyTime) }
        view.layer.add(animation, forKey: key)
    }
    
    func completeAnimation(success: Bool) {
        completion?(success)
    }
}

public struct ShakeStep {
    // MARK: - Data
    let value: CGFloat
    let keyTime: TimeInterval
    
    // MARK: - Inits
    public init(value: CGFloat,
                keyTime: TimeInterval) {
        self.value = value
        self.keyTime = keyTime.inRange(min: .zero, max: 1.0)
    }
}

// MARK: - SwiftUI Preview
import SwiftUI
import SnapKit

struct LSViewShakeAnimatorPreviews: PreviewProvider {
    static var previews: some View {
        SwiftUIPreview {
            let view = UIView()
            let button = DesignedButton()
                .insert(into: view)
                .setParameter(\.titleSet, with: TitleSet(normalText: "Shake"))
                .setParameter(\.titleColor, with: ColorSet(normal: ColorMap(color: .white)))
                .setParameter(\.backgroundImageSet, with: ImageSet(normalImage: UIColor.magenta.image()))
                .setParameter(\.cornerRadius, with: .circled)
                .setParameter(\.font, with: UIFont.systemFont(ofSize: 24, weight: .bold))
                .setParameter(\.clipsToBounds, with: true)
                
            button.onEvent(.touchUpInside) { [weak button] in
                button?.animation.shake(shakeSteps: [
                    ShakeStep(value: -7, keyTime: 0.2),
                    ShakeStep(value: 7, keyTime: 0.4),
                    ShakeStep(value: -3, keyTime: 0.6),
                    ShakeStep(value: 3, keyTime: 0.8),
                ], completion: { [weak button] finished in
                    let image = finished ? UIColor.blue.image() : UIColor.red.image()
                    button?.setParameter(\.backgroundImageSet, with: ImageSet(normalImage: image))
                })
                .execute()
            }
            
            button.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(32)
                make.height.equalTo(64)
            }
            
            return view
        }
        .previewLayout(.fixed(width: 375, height: 44))
        .edgesIgnoringSafeArea(.vertical)
    }
}
