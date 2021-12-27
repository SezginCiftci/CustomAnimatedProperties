//
//  ViewPropertyAnimator.swift
//  CustomAnimatedProperties
//
//  Created by Sezgin Çiftci on 27.12.2021.
//

//MARK: - Check the AppDelegate and SceneDelegate just in case

import UIKit

class ViewPropertyAnimator: UIViewController {
    

    let animatorOne = UIViewPropertyAnimator(duration: 1, curve: .linear, animations: nil)
    
    let box = UIView()
    var animatorTwo: UIViewPropertyAnimator!
    var boxWidthAnchor: NSLayoutConstraint!
    
    fileprivate var imageView: UIImageView = UIImageView(image: UIImage(named: "woman"))
    fileprivate var blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .prominent))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setTheImageWithSlider()
        setUpSlider()

        //changeBoxColorWithSlider()
        //changeViewColorWithSlider()
    }
    
    //Image Size and Blur Effect Changes with Slider
    
    fileprivate func setTheImageWithSlider() {
        
        view.addSubview(imageView)
        view.addSubview(blurView)
        imageView.frame = view.frame
        imageView.contentMode = .scaleToFill
        blurView.frame = view.frame
        
        self.blurView.alpha = 0.5

        animatorOne.addAnimations {
            self.blurView.alpha = 1
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
        
            
    }
    
    fileprivate func setUpSlider() {
        
        let slider = UISlider()
        view?.addSubview(slider)
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        slider.widthAnchor.constraint(equalToConstant: view.frame.width - 150).isActive = true
        
        slider.addTarget(self, action: #selector(handleSliderForBlur), for: .allEvents)
    }
    
    @objc fileprivate func handleSliderForBlur(slide: UISlider) {
        print(slide.value)
        animatorOne.fractionComplete = CGFloat(slide.value)
    }
    
    //Box Color and Width Changes with Slider
    
    fileprivate func changeBoxColorWithSlider() {
        
        view.addSubview(box)
        
        box.translatesAutoresizingMaskIntoConstraints = false
        boxWidthAnchor = box.widthAnchor.constraint(equalToConstant: 100)
        boxWidthAnchor.isActive = true
        box.heightAnchor.constraint(equalToConstant: 100).isActive = true
        box.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        box.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        box.backgroundColor = .red
        
        let slider = UISlider()
        view?.addSubview(slider)
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        slider.widthAnchor.constraint(equalToConstant: view.frame.width - 150).isActive = true
        
        slider.addTarget(self, action: #selector(handleSliderChangesTwo), for: .allEvents)

    }
    @objc fileprivate func handleSliderChangesTwo(slide: UISlider) {
        print(slide.value)
        boxWidthAnchor.constant = 100 + CGFloat(slide.value * 100)
        animatorTwo = UIViewPropertyAnimator(duration: 2, dampingRatio: 0.5, animations: {
            self.view.layoutIfNeeded()
            self.box.backgroundColor = .blue
        })
        animatorTwo.startAnimation()
    }
    
    //View Color Changes with Slider
    
    fileprivate func changeViewColorWithSlider() {
        view.backgroundColor = .red
        
        animatorOne.addAnimations {
            self.view.backgroundColor = .white
        }
        
        let slider = UISlider()
        view?.addSubview(slider)
        
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        slider.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        slider.widthAnchor.constraint(equalToConstant: view.frame.width - 150).isActive = true
        
        slider.addTarget(self, action: #selector(handleSliderChanges), for: .allEvents)

    }
    
    @objc fileprivate func handleSliderChanges(slide: UISlider) {
        print(slide.value)
        animatorOne.fractionComplete = CGFloat(slide.value)
    }

}
