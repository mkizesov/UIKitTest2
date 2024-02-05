//
//  ViewController.swift
//  UIKitTest2
//
//  Created by M K on 04.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var firstButton = DamnButton(type: .system)
    lazy var secondButton = DamnButton(type: .system)
    lazy var thirdButton = DamnButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        firstButton.setTitle("First Button", for: .normal)
        
        secondButton.setTitle("Second Medium Button", for: .normal)
        
        thirdButton.setTitle("Third", for: .normal)
        thirdButton.addTarget(self, action: #selector(openModal), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [firstButton, secondButton, thirdButton])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
        ])
    }
    
    @objc func openModal() {
        let modalViewController = ModalViewController()
        modalViewController.modalPresentationStyle = .popover
        present(modalViewController, animated: true, completion: nil)
    }
}

class ModalViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
