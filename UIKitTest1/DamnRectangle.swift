//
//  DamnRectangle.swift
//  UIKitTest1
//
//  Created by M K on 01.02.2024.
//

import UIKit

class DamnRectangle: UIView {
    private let gradientLayer = CAGradientLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 10)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 5
        
        gradientLayer.masksToBounds = true
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.colors = [UIColor.systemTeal.cgColor, UIColor.red.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}
