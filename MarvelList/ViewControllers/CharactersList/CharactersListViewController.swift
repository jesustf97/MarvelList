//
//  CharactersListViewController.swift
//  MarvelList
//
//  Created by Jesús Calleja Rodríguez on 05/05/2020.
//  Copyright © 2020 Jesús Calleja Rodríguez. All rights reserved.
//

import UIKit
import Alamofire

class CharactersListViewController: UIViewController {
    
    @IBOutlet weak var navController: UINavigationItem!
    @IBOutlet weak var characterTableView: UITableView!
    var characters: [CharacterInfo] = []
    var selectedItem: CharacterInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCharacters()
        showSpinner()
    }
    
    func fetchCharacters(){
        AF.request(Constants.getCharactersUrl, parameters: getRequestParams(limit: Constants.maxLimitgetCharactersRequest)).validate().responseDecodable(of: Response.self) { (response) in
        guard let apiCharactersResponse = response.value?.data
            else { self.showDialog(title: Errors.noConectionTitle, message: Errors.noConectionMessage)
                return
            }
            self.characters = apiCharactersResponse.charactersInfo
            self.characterTableView.reloadData()
            self.removeSpinner()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard let destinationVC = segue.destination as? CharacterDetailViewController else { return }
          destinationVC.character = selectedItem
    }
}

extension CharactersListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let character = characters[indexPath.row]
         let cell = tableView.dequeueReusableCell(withIdentifier: Constants.characterCellIdentifier) as! CharacterViewCell
        cell.setName(name: character.name)
         return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedItem = characters[indexPath.row]
        return indexPath
    }
}


