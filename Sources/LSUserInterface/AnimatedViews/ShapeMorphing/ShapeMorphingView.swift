//
//  ShapeMorphingView.swift
//  
//
//  Created by Алексей Филиппов on 12.01.2023.
//

// Apple
import UIKit
import SpriteKit

final class ShapeMorphingView: BaseView {
    // MARK: - UI
    private let skView = SKView()
    private let scene = SKScene()
    
    // MARK: - Data
    private var currentIcon: SKSpriteNode?
    private let filter = MetaBallEffectFilter()
    
    // MARK: - Overrides
    override func layoutSubviews() {
        super.layoutSubviews()
        skView.frame = bounds
    }
    
    // MARK: - BaseView
    override func setupUI() {
        addSubview(skView)
        scene.scaleMode = .resizeFill
        scene.physicsWorld.gravity = .zero
        scene.shouldEnableEffects = true
        scene.filter = filter
        skView.presentScene(scene)
        skView.allowsTransparency = true
    }
    
    override func setupColors() {
        scene.backgroundColor = .clear
        backgroundColor = .clear
    }
    
    // MARK: - Interface methods
    func setImage(_ image: UIImage,
                  duration: TimeInterval = .zero) {
        animateIconChange(image: image,
                          duration: duration)
    }
    
    // MARK: - Private methods
    private func animateIconChange(image: UIImage,
                                   duration: CGFloat) {
//        filter.oldImage = filter.inputImage
//        filter.newImage = image.getCIImage()
        
        let newIconShape = makeNode(from: image)
        newIconShape.position = CGPoint(x: bounds.midX,
                                        y: bounds.midY)
        newIconShape.alpha = 0
        scene.addChild(newIconShape)
        
        let oldIconShape = currentIcon
        currentIcon = nil
        currentIcon = newIconShape
        
        if duration == 0 {
            newIconShape.alpha = 1
            oldIconShape?.removeFromParent()
            return
        }
        let fadeDuration = duration * 0.25
        animateBlur(to: 10, duration: fadeDuration)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + fadeDuration * 0.6) { [weak self] in
            let swapDuration = duration * 0.5
            newIconShape.run(SKAction.fadeAlpha(to: 1, duration: swapDuration))
            oldIconShape?.run(SKAction.fadeAlpha(to: 0, duration: swapDuration))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + swapDuration * 0.6) { [weak self] in
                self?.animateBlur(to: 0, duration: fadeDuration)
                DispatchQueue.main.asyncAfter(deadline: .now() + fadeDuration) {
                    oldIconShape?.removeFromParent()
                }
            }
        }
    }
    
    private func animateBlur(to targetBlur: Float,
                             duration: CGFloat) {
        let from = filter.blur
        let blurFade = SKAction.customAction(withDuration: duration) { node, elapsed in
            let percent = elapsed / duration
            let difference = targetBlur - from
            let currentBlur = from + (difference * Float(percent))
            self.filter.blur = currentBlur
            self.scene.shouldEnableEffects = true
        }
        scene.run(blurFade)
    }
    
    private func makeNode(from image: UIImage) -> SKSpriteNode {
        let iconSize = bounds.size
        let texture = SKTexture(image: image.resized(within: iconSize))
        return SKSpriteNode(texture: texture,
                            size: iconSize)
    }
}

// MARK: - SwiftUI Preview
import SwiftUI
// SPM
import SnapKit

struct ShapeMorphingViewContainer_Previews: PreviewProvider {
    fileprivate class ShapeMorphingViewExample: BaseView {
        let changeButton = BaseButton(type: .system)
        let morphingView = ShapeMorphingView()
        
        override func setupUI() {
            addSubview(morphingView)
            
            addSubview(changeButton)
            changeButton.setImage(UIImage(systemName: "play.fill")!,
                                  for: .normal)
            changeButton.tintColor = .red
            changeButton.shouldDo(on: .touchUpInside) { [weak self] in
                let buttonNames: [String] = [
                    "circle.fill",
                    "heart.fill",
                    "star.fill",
                    "bell.fill",
                    "bookmark.fill",
                    "tag.fill",
                    "bolt.fill",
                    "play.fill",
                    "pause.fill",
                    "squareshape.fill",
                    "key.fill",
                    "hexagon.fill",
                    "gearshape.fill",
                    "car.fill"
                ]
                let name = buttonNames.shuffled().first!
                let image = UIImage(systemName: name)!.withTintColor(.white)
                self?.morphingView.setImage(image, duration: 0.8)
            }
        }
        
        override func setupColors() {
            backgroundColor = .magenta
        }
        
        override func setupConstraints() {
            morphingView.snp.makeConstraints { make in
                make.directionalEdges.equalToSuperview()
            }
            changeButton.snp.makeConstraints { make in
                make.bottom.equalToSuperview().inset(16)
                make.height.equalTo(88)
                make.leading.trailing.equalToSuperview().inset(8)
            }
        }
    }
    
    static var previews: some View {
        SwiftUIPreview {
            ShapeMorphingViewExample()
        }
            .previewLayout(.device)
            .edgesIgnoringSafeArea(.vertical)
    }
}
