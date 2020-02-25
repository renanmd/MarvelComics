//
//  CharactersTableViewController.swift
//  MarvelComicsAPI
//
//  Created by Renan Diniz on 23/02/20.
//  Copyright © 2020 RMD Goup. All rights reserved.
//

import UIKit

struct Characters {
    var name : String
    var description : String
    var image : String
}

class CharactersTableViewController: UITableViewController {

    var characterInfo = [
        Characters(name: "Wolvrine", description: "Badass", image: "Wolverine"),
        Characters(name: "Venom", description: "Symbiote", image: "Venom"),
        Characters(name: "IronMan", description: "Billioniare", image: "IronMan")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MarvelService.getCharacters { characters in
            print(characters?.last?.name)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characterInfo.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Marvel Universe"
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)

        let character = characterInfo[indexPath.row]
        cell.textLabel?.text = character.name
        cell.detailTextLabel?.text = character.description
        cell.imageView?.image = UIImage(named: character.image)

        return cell
    }

}
