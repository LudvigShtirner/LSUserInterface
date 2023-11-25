//
//  UILabel+TextImage.swift
//  
//
//  Created by Алексей Филиппов on 26.05.2023.
//

// Apple
import UIKit

extension UILabel {
    func makeTextImage(with size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        let text = text ?? ""
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font as Any,
            .foregroundColor: textColor as Any
        ]
        let textSize = text.size(withAttributes: attributes)
        let point = CGPoint(x: (size.width - textSize.width) / 2.0,
                            y: (size.height - textSize.height) / 2.0)
        text.draw(at: point, withAttributes: attributes)
        
        let textImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return textImage
    }
}

// MARK: - SwiftUI Preview
import SwiftUI

struct UILabelPreviews: PreviewProvider {
    static var previews: some View {
        SwiftUIPreview {
            let label = UILabel()
            label.text = "Some text"
            label.font = .systemFont(ofSize: 48)
            label.textColor = .red
            
            let size = label.text!.size(withAttributes: [.font: label.font as Any])
            
            let imageView = UIButton()
            imageView.setImage(label.makeTextImage(with: size), for: .normal)
            return imageView
        }
        .previewLayout(.fixed(width: 375, height: 120))
        .edgesIgnoringSafeArea(.vertical)
    }
}
