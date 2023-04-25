//
//  MetalShapeMorphingView.swift
//  
//
//  Created by Алексей Филиппов on 28.03.2023.
//

// Apple
import UIKit
import MetalKit

public final class MetalShapeMorphingView: BaseView {
    // MARK: - UI
    private let metalView = MTKView()
    
    // MARK: - Data
    private var currentImage: UIImage?
    private var currentTexture: MTLTexture?
    
    // MARK: - Overrides
    public override func layoutSubviews() {
        super.layoutSubviews()
        metalView.frame = bounds
        if let image = currentImage {
            setImage(image, duration: 0.3)
        }
    }
    
    // MARK: - BaseView
    public override func setupUI() {
        
    }
    
    public override func setupColors() {
        backgroundColor = .clear
    }
    
    // MARK: - Interface methods
    public func setImage(_ image: UIImage,
                         duration: TimeInterval = .zero) {
        currentImage = image
        
    }
}
