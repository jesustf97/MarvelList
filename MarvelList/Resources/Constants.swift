//
//  Constants.swift
//  MarvelList
//
//  Created by Jesús Calleja Rodríguez on 05/05/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//

struct Constants {
    
    //Api Service
    static let getCharactersUrl = "https://gateway.marvel.com/v1/public/characters"
    static let marvelApiPublicKey = "apikey"
    static let marvelApiPublicKeyValue = "b0fb99a5f7be5649f456e2d005100a0f"
    static let marvelApiPrivateKeyValue = "131e38750f3fb92a33387fbba346639f05369546"
    static let hash = "hash"
    static let timeStamp = "ts"
    static let limit = "limit"
    static let offset = "offset"
    static let maxLimitCharactersRequest = 100
    
    //Cells ids
    static let characterCellIdentifier = "CharacterCell"
    static let comicCellIdentifier = "ComicCell"
    
    //Onboarding
    static let onboardingIdFirst = "onboardingIdFirst"
    static let onboardingIdSecond = "onboardingIdSecond"
    static let onboardingIdThird = "onboardingIdThird"
    static let onboardingFlag = "onboardingFlagUserPreferences"
    
    //Segue ids
    static let goToChatacterListSegueId = "goToChatacterList"
    
    
    
    
    
}
