//
//  ViewController.swift
//  CustomAnimatedProperties
//
//  Created by Sezgin Çiftci on 27.12.2021.
//


//MARK: - Check the AppDelegate and SceneDelegate just in case


import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        //setButton()
    }

    fileprivate func setButton() {
        
        let buttonOne = AnimatedButtonOne(title: "Sezgin's 1")
        view.addSubview(buttonOne)
        
        buttonOne.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        buttonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let buttonTwo = AnimatedButtonTwo(title: "Sezgin's 2")
        view.addSubview(buttonTwo)
        
        buttonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonTwo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        buttonTwo.addTarget(self, action: #selector(asdf), for: .touchUpInside)
    }

    @objc func asdf() {
        print("tapped")
    }
}

