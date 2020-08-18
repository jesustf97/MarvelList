//
//  PageViewModel.swift
//  MarvelList
//
//  Created by Jesús Calleja Rodríguez on 13/08/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//

import Foundation
import UIKit

public class PageViewModel {
    
    func getViewController(forViewController vc: UIViewController, isNextController: Bool) -> UIViewController? {
        guard let vc = vc as? OnboardingViewController else { return nil }
        var index: Int = 0
        for (location, scene) in OnboardingContent.onboardingScenes.enumerated() {
            if scene.name == vc.name {
                index = location
            }
        }
        isNextController ? (index += 1) : (index -= 1)
        if isNextController {
            if OnboardingContent.onboardingScenes.count > index {
                return createSlideViewController(fromIndex: index)
            }else{
                return nil
            }
        }else{
            if index >= 0 {
                return createSlideViewController(fromIndex: index)
            }else{
                return nil
            }
        }
    }
    
    func createSlideViewController(fromIndex index: Int) -> UIViewController {
        let screen = OnboardingContent.onboardingScenes[index]
        let viewController = UIStoryboard(name: screen.storyBoardName, bundle: nil).instantiateViewController(identifier: screen.viewControllerName)
        (viewController as? OnboardingViewController)?.name = screen.name
        (viewController as? OnboardingViewController)?.animationName = screen.animationName
        (viewController as? OnboardingViewController)?.titleText = screen.mainTitle
        return viewController
    }
    
}
