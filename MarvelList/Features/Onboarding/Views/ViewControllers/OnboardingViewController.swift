//
//  OnboardingViewController.swift
//  MarvelList
//
//  Created by Jesús Calleja Rodríguez on 13/08/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//

import UIKit
import Lottie


class OnboardingViewController: UIViewController {

    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    private let preferences = UserDefaults.standard
    private let backgroundLayer = Colors().gl
    var name: String?
    var animationName: String?
    var titleText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        self.checkUserPreferences()
    }
    
    private func checkUserPreferences(){

        guard let isUser = preferences.object(forKey: Constants.onboardingFlag) as? Bool else {
            return
        }
        
        if(isUser) {
            goToMain(self)
        }
    }
    
    private func disableOnboarding(){
        preferences.set(true, forKey: Constants.onboardingFlag)
    }
    
    private func configureUI(){
        createGradient()
        titleLabel.text = titleText
        animationView.animation = Animation.named(animationName ?? "hero")
        animationView.loopMode = .loop
        animationView.backgroundBehavior = .pauseAndRestore
        UIViewController.styleFilledButton(self.startButton)
    }
    
    private func createGradient() {
        backgroundLayer?.frame = self.view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
    }
    
    private func enableStartButton(){
        self.startButton.isHidden = false
    }

    @IBAction func goToMain(_ sender: Any) {
            self.disableOnboarding()
             performSegue(withIdentifier: Constants.goToChatacterListSegueId, sender: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(name! == Constants.onboardingIdThird){
            self.enableStartButton()
        }
        animationView.play()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        animationView.stop()
    }
    
}
