//
//  ViewController.swift
//  superHeroJSON
//
//  Created by sun on 26/4/2562 BE.
//  Copyright © 2562 sun. All rights reserved.
//

import UIKit

struct DataArray:Decodable {
    
    let name:String
    let team:String
    let imageurl:String
    
}

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.heroArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CellHeroTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellHeroTableViewCell
        
        cell.nameLabel.text = heroArray[indexPath.row].name
        cell.teamLabel.text = heroArray[indexPath.row].team
        
        if let imageURL = URL(string: heroArray[indexPath.row].imageurl) {
            
            DispatchQueue.global().async {
                
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        
                        cell.imageUrl.image = image
                        
                    }
                }
            }
            
        }
        

        return cell
        
        
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GetDataJSON()
    }
    
    var heroArray = [DataArray]()
    
    func GetDataJSON() {
        let url = URL(string: "https://simplifiedcoding.net/demos/marvel/")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do{
                
                if error == nil {
                    
                    self.heroArray = try JSONDecoder().decode([DataArray].self, from: data!)
                    for arr in self.heroArray {
                        
                        print("HERO NAME ==>> \(arr.name)")
                        print("HERO TEAM ==>> \(arr.team)")
                        print("HERO IMAGEURL  ==>> \(arr.imageurl)")
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    }
                    
                } else {
                    
                }
                
            }catch let myError{
                
                print(myError)
                print("Have Error")
                
            }
        }.resume()
        
    }


}

