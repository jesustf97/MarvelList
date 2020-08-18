//
//  CharacterDetailViewController.swift
//  MarvelList
//
//  Created by Jesús Calleja Rodríguez on 05/05/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//

import UIKit
import Alamofire

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet weak var comicsLabel: UILabel!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    @IBOutlet weak var comicTableView: UITableView!
    @IBOutlet weak var characterImage: UIImageView!
    private var comics: [Comic] = []
    private let backgroundLayer = Colors().gl
    var character: CharacterInfo?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showSpinner()
        initUI()
    }
    
    private func initUI(){
        createGradient()
        fetchCharacterImage()
        characterNameLabel.text = self.character?.name
        if((self.character?.description.isEmpty)!){
            characterDescriptionLabel.text = Errors.emptyDescriptionMessage
        } else {
        characterDescriptionLabel.text = self.character?.description
        }
        if(!(character?.comics.items.isEmpty)!){
            initComicList()
        } else {
            self.comicsLabel.removeFromSuperview()
        }
    }
    
    private func createGradient() {
        backgroundLayer?.frame = self.view.frame
        view.layer.insertSublayer(backgroundLayer!, at: 0)
    }
    
    private func fetchCharacterImage(){
        let imageUrl = getUrl(image: character!.urlImage)
        AF.request(imageUrl, parameters:
                getRequestParams(limit: 0)).responseData { (response) in
                    guard let apiCharacterImageResponse = response.data
                        else {self.showDialog(title: Errors.noConectionTitle, message: Errors.noConectionMessage)
                            return }
                    if let characterImage = UIImage(data: apiCharacterImageResponse){
                    let imageResized = self.resizeImage(image: characterImage, targetSize: CGSize(width: 380, height: 380))
                    self.characterImage.image = imageResized
                    self.removeSpinner()
                }
            }
        }
    
    private func initComicList() {
        comics = character!.comics.items
        self.comicTableView.reloadData()
    }
}


extension CharacterDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comic = comics[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.comicCellIdentifier) as! ComicViewCell
        cell.setName(name: comic.name)
         return cell
    }
}
