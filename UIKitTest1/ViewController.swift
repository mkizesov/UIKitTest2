//
//  ViewController.swift
//  UIKitTest1
//
//  Created by M K on 01.02.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        let damnRectangle = DamnRectangle()
        damnRectangle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(damnRectangle)
        
        NSLayoutConstraint.activate([
            damnRectangle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            damnRectangle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            damnRectangle.widthAnchor.constraint(equalToConstant: 100),
            damnRectangle.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

