//
//  OnboardingContent.swift
//  MarvelList
//
//  Created by Jesús Calleja Rodríguez on 13/08/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//

import Foundation

class OnboardingContent {
    static var onboardingScenes: [OnboardingScene] {
        var list: [OnboardingScene] = []
        list.append(OnboardingScene(name: Constants.onboardingIdFirst, mainTitle: Messages.onboarding_text_first, animationName: "hero"))
        list.append(OnboardingScene(name: Constants.onboardingIdSecond, mainTitle: Messages.onboarding_text_second, animationName: "search-bar"))
        list.append(OnboardingScene(name: Constants.onboardingIdThird, mainTitle: Messages.onboarding_text_third, animationName: "iron-man"))
        return list
    }
}
