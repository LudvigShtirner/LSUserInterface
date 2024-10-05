//
//  ProgressBar.swift
//
//
//  Created by Алексей Филиппов on 01.05.2024.
//

// SPM
import SupportCode
import SnapKit
// Apple
import UIKit

public final class ProgressBar: DesignedView {
    // MARK: - UI
    private let fillView = DesignedView()
    
    // MARK: - Data
    private var progress = CGFloat.zero
    
    // MARK: - Overrides
    public override func setupUI() {
        addSubview(fillView)
    }
    
    public override func setupConstraints() {
        fillView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(progress)
        }
    }
    
    // MARK: - Interface methods
    public func updateFillColor(_ fillColor: ColorMap) {
        fillView.useBackgroundColor(fillColor)
    }
    
    public func updateProgress(_ progress: CGFloat,
                               animated: Bool) {
        if Thread.isMainThread == false {
            fatalError("Бля")
        }
        self.progress = progress
        if animated {
            updateProgressAnimated()
        } else {
            updateProgress()
        }
    }
}

private extension ProgressBar {
    func updateProgressAnimated() {
        ls.animation
            .constraints { [weak self] in
                self?.updateProgress()
            }
            .execute(duration: 0.2,
                     options: [.beginFromCurrentState, .curveEaseInOut])
    }
    
    func updateProgress() {
        fillView.snp.remakeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(progress)
        }
    }
}

// MARK: - SwiftUI Preview
import SwiftUI

struct ProgressBarPreviews: PreviewProvider {
    static var previews: some View {
        SwiftUIPreview {
            var progress = CGFloat.zero
            let progressBar = ProgressBar().apply {
                $0.useBackgroundColor(.init(color: .lightGray))
                $0.useCornerRadius(.fixed(8))
                $0.clipsToBounds = true
                $0.updateFillColor(.init(color: .red))
                $0.updateProgress(0.01, animated: false)
            }
                
            let button = DesignedButton().apply {
                $0.useTitle(normalText: "Increment")
                $0.useTitleColor(.init(normal: .init(color: .white)))
                $0.useBackgroundColors(.init(normal: .init(color: .magenta),
                                             highlighted: .init(color: .magenta.withAlphaComponent(0.5))))
                $0.useCornerRadius(.fixed(8))
                $0.clipsToBounds = true
            }
            
            let container = DesignedView()
            container.addSubview(progressBar)
            container.addSubview(button)
            button.onEvent(.touchUpInside) { [weak progressBar] in
                progress += 0.1
                if progress > 1 {
                    progress = .zero
                }
                progressBar?.updateProgress(progress, animated: true)
            }
            
            progressBar.snp.makeConstraints { make in
                make.top.leading.trailing.equalToSuperview()
                make.height.equalTo(30)
            }
            button.snp.makeConstraints { make in
                make.top.equalTo(progressBar.snp.bottom).offset(16)
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(44)
                make.bottom.equalToSuperview()
            }
            
            return CenteredContainer(content: container,
                                     width: .fixed(300))
        }
        .previewLayout(.fixed(width: 375, height: 44))
        .edgesIgnoringSafeArea(.vertical)
    }
}
