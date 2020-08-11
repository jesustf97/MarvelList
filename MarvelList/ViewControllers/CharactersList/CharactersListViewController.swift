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
            showSpinner()
            getTotalCharacters()
    }
    
    
    private func getTotalCharacters(){
        AF.request(Constants.getCharactersUrl, parameters: getRequestParams()).validate().responseDecodable(of: Response.self) { (response) in
        guard let apiCharactersResponse = response.value?.data
            else { self.showDialog(title: Errors.noConectionTitle, message: Errors.noConectionMessage)
                return
            }
            
            self.showDialog(title: Messages.loading, message: "\(Messages.fetchingCharactersDialogMessage)\(apiCharactersResponse.totalCharacters)")
            self.fetchCharacters(totalCharacters: apiCharactersResponse.totalCharacters)
        }
    }
    
    private func fetchCharacters(totalCharacters: Int){
        var offset = 0
        var requestedCharacters = 0
        while (requestedCharacters <= totalCharacters) {
        AF.request(Constants.getCharactersUrl, parameters: getRequestParams(limit: Constants.maxLimitCharactersRequest, offset: offset)).validate().responseDecodable(of: Response.self) { (response) in
        guard let apiCharactersResponse = response.value?.data
            else { self.showDialog(title: Errors.noConectionTitle, message: Errors.noConectionMessage)
                return
            }
            self.characters.append(contentsOf: apiCharactersResponse.charactersInfo)
            if(self.characters.count == totalCharacters){
                self.characterTableView.reloadData()
                self.dismiss(animated: true, completion: nil)
                self.removeSpinner()
                }
            }
            offset += Constants.maxLimitCharactersRequest
            requestedCharacters += Constants.maxLimitCharactersRequest
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


