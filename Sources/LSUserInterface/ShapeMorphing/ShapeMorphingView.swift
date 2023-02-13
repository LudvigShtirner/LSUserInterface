//
//  ShapeMorphingView.swift
//  
//
//  Created by Алексей Филиппов on 12.01.2023.
//

// SPM
import SupportCode
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
        let newIconShape = makeNode(from: image.withTintColor(.white))
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
        
        DispatchQueue.callOnMainQueueWithDelay(fadeDuration * 0.6) { [weak self] in
            let swapDuration = duration * 0.5
            newIconShape.run(SKAction.fadeAlpha(to: 1, duration: swapDuration))
            oldIconShape?.run(SKAction.fadeAlpha(to: 0, duration: swapDuration))
            
            DispatchQueue.callOnMainQueueWithDelay(swapDuration * 0.6) { [weak self] in
                self?.animateBlur(to: 0, duration: fadeDuration)
                DispatchQueue.callOnMainQueueWithDelay(fadeDuration) {
                    oldIconShape?.removeFromParent()
                }
            }
        }
    }
    
    private func animateBlur(to targetBlur: CGFloat,
                             duration: CGFloat) {
        let from = CGFloat(filter.blurFilter.radius)
        let blurFade = SKAction.customAction(withDuration: duration) { node, elapsed in
            let percent = elapsed / CGFloat(duration)
            let difference = targetBlur - from
            let currentBlur = from + (difference * percent)
            self.filter.blurFilter.setValue(currentBlur, forKey: kCIInputRadiusKey)
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

struct ShapeMorphingViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ShapeMorphingView {
        let view = ShapeMorphingView()
        return view
    }
    
    func updateUIView(_ uiView: ShapeMorphingView, context: Context) {
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
        let image = UIImage(systemName: name)!
        uiView.setImage(image, duration: 0.8)
    }
}

struct ShapeMorphingViewContainer_Previews: PreviewProvider {
    static var previews: some View {
        ShapeMorphingViewContainer()
            .previewLayout(.device)
            .edgesIgnoringSafeArea(.vertical)
    }
}
