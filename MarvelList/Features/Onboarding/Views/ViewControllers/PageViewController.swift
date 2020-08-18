//
//  PageViewController.swift
//  MarvelList
//
//  Created by Jesús Calleja Rodríguez on 13/08/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var viewModel = PageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageControl()
        self.dataSource = self
        self.delegate = self
        setViewControllers([viewModel.createSlideViewController(fromIndex: 0)], direction: .forward, animated: true)
    }
    
    func setupPageControl(){
        UIPageControl.appearance(whenContainedInInstancesOf: [PageViewController.self]).currentPageIndicatorTintColor =  UIColor.onboardingTextColor
        UIPageControl.appearance(whenContainedInInstancesOf: [PageViewController.self]).pageIndicatorTintColor = UIColor.onboardingPageTintColor
        UIPageControl.appearance(whenContainedInInstancesOf: [PageViewController.self]).backgroundColor = UIColor.white
                UIPageControl.appearance(whenContainedInInstancesOf: [PageViewController.self]).backgroundColor = UIColor.black
    }
}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return OnboardingContent.onboardingScenes.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        var index: Int = 0
        for (location, scene) in OnboardingContent.onboardingScenes.enumerated() {
            if let vc = pageViewController.children.first as? OnboardingViewController, vc.name == scene.name {
                index = location
            }
        }
        return index
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        viewModel.getViewController(forViewController: viewController, isNextController: false)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        viewModel.getViewController(forViewController: viewController, isNextController: true)
    }
    
    
}
