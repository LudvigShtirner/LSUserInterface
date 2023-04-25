//
//  ShapeMorphingView.swift
//  
//
//  Created by Алексей Филиппов on 12.01.2023.
//

// Apple
import UIKit
import SpriteKit

public final class ShapeMorphingView: BaseView {
    // MARK: - UI
    private let skView = SKView()
    private let scene = SKScene()
    
    // MARK: - Data
    private var currentImage: UIImage?
    private var currentIcon: SKSpriteNode?
    private let filter = MetaBallEffectFilter()
    
    // MARK: - Overrides
    public override func layoutSubviews() {
        super.layoutSubviews()
        skView.frame = bounds
        if let image = currentImage {
            setImage(image, duration: 0.3)
        }
    }
    
    // MARK: - BaseView
    public override func setupUI() {
        scene.scaleMode = .resizeFill
        scene.physicsWorld.gravity = .zero
        scene.shouldEnableEffects = true
        scene.filter = filter
        
        addSubview(skView)
        skView.presentScene(scene)
        skView.allowsTransparency = true
    }
    
    public override func setupColors() {
        scene.backgroundColor = .clear
        backgroundColor = .clear
    }
    
    // MARK: - Interface methods
    public func setImage(_ image: UIImage,
                         duration: TimeInterval = .zero) {
        currentImage = image
        animateIconChange(image: image,
                          duration: duration)
    }
    
    // MARK: - Private methods
    private func animateIconChange(image: UIImage,
                                   duration: CGFloat) {
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
