//
//  BlurView.swift
//  
//
//  Created by Алексей Филиппов on 05.06.2023.
//

// SPM
import SnapKit
// Apple
import UIKit

public final class BlurView: DesignedView {
    // MARK: - UI
    private let effectView = UIVisualEffectView()
    
    // MARK: - Data
    private let effect: UIBlurEffect
    
    // MARK: - Inits
    public init(effect: UIBlurEffect) {
        self.effect = effect
        super.init(frame: .zero)
    }
    
    // MARK: - Overrides
    public override func setupUI() {
        addSubview(effectView)
        effectView.effect = effect
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        effectView.frame = bounds
    }
}

// MARK: - SwiftUI Preview
import SwiftUI

struct BlurViewPreviews: PreviewProvider {
    static var previews: some View {
        SwiftUIPreview {
            let view = UIImageView()
            view.image = UIImage(systemName: "swift")
            view.tintColor = .red
            
            let blurView = BlurView(effect: UIBlurEffect(style: .light))
            
            view.addSubview(blurView)
            blurView.snp.makeConstraints { make in
                make.directionalEdges.equalToSuperview()
            }
            return view
        }
        .previewLayout(.fixed(width: 375, height: 44))
        .edgesIgnoringSafeArea(.vertical)
    }
}
