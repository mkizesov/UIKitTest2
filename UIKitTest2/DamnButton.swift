//
//  DamnButton.swift
//  UIKitTest2
//
//  Created by M K on 04.02.2024.
//

import UIKit

class DamnButton: UIButton {
    let damnBgColor: UIColor = .systemBlue
    let damnBgColorDimmed: UIColor = .systemGray2
    
    let damnTitleColor: UIColor = .white
    let damnTitleColorDimmed: UIColor = .systemGray3
    
    let damnSymbolConfig: UIImage.SymbolConfiguration = UIImage.SymbolConfiguration(paletteColors: [.white])
    let damnSymbolConfigDimmed = UIImage.SymbolConfiguration(paletteColors: [.systemGray3])
    
    let buttonImage = UIImage(systemName: "arrow.right.circle.fill")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureButton()
    }
    
    private func configureButton() {
        startAnimatingPressActions()
        var config = UIButton.Configuration.plain()
        var background = UIButton.Configuration.plain().background
        background.backgroundColor = damnBgColor
        background.backgroundColorTransformer = nil
        config.background = background
        config.baseForegroundColor = damnTitleColor
        config.image = buttonImage
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.preferredSymbolConfigurationForImage = damnSymbolConfig
        config.titleAlignment = .leading
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        self.configuration = config
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        if tintAdjustmentMode == .dimmed {
            configuration?.background.backgroundColor = damnBgColorDimmed
            setTitleColor(damnTitleColorDimmed, for: .normal)
//          using `setTitle` like a hack to trigger title color re-render.
//          Really didn't find how to solve this with configuration foregroundColor without dimming this color
            setTitle(title(for: .normal), for: .normal)
            configuration?.preferredSymbolConfigurationForImage = damnSymbolConfigDimmed
        } else {
            configuration?.background.backgroundColor = damnBgColor
            titleLabel?.tintColor = .cyan
            setTitleColor(damnTitleColor, for: .normal)
            setTitle(title(for: .normal), for: .normal)
            configuration?.preferredSymbolConfigurationForImage = damnSymbolConfig
        }
    }
    
    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown])
        addTarget(self, action: #selector(animateUp), for: [.touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    @objc func animateDown() {
        self.animate(transform: CGAffineTransform.identity.scaledBy(x: 0.35, y: 0.35))
    }
    
    @objc func animateUp() {
        animate(transform: .identity)
    }
    
    private func animate(transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 0,
                       options: [.allowUserInteraction, .beginFromCurrentState],
                       animations: {
            self.transform = transform
        }, completion: nil)
    }
}
