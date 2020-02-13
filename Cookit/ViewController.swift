//
//  ViewController.swift
//  Cookit
//
//  Created by Neil Quizon on 2020-02-13.
//  Copyright © 2020 Neil Quizon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    

    @IBOutlet weak var recipeTableView: UITableView!
    
    let recipes = [Recipe(title: "Brownies",
                          steps: ["brownie step 1", "brownie step 2", "brownie step 3"],
                   imageURL: "https://images.pexels.com/photos/45202/brownie-dessert-cake-sweet-45202.jpeg"),
                   
                   Recipe(title: "chocolate chip cookies",
                          steps: ["cookies1", "cookies2", "cookies3"],
                          imageURL: "https://images.pexels.com/photos/830894/pexels-photo-830894.jpeg"),
                            
                   Recipe(title: "banana bread",
                            steps: ["step 1 banana", "step 1 banana"],
                    imageURL: "https://images.pexels.com/photos/230325/pexels-photo-230325.jpeg")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
         If the destination controller can be cast as a RecipeDetailViewController,
         and if I can get the index of the tapped row, pass the selected recipe
         variable in RecipeDetailsViewController
         */
        
       if let RecipeDetailsViewController = segue.destination as? RecipeDetailsViewController,
           let index = recipeTableView.indexPathForSelectedRow?.row
       {
          RecipeDetailsViewController.recipe = recipes[index]
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recipeTableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath)
        
        let recipe = recipes[indexPath.row]
        
        if let url = URL(string: recipe.imageURL),
                let data = try? Data(contentsOf: url)
        {
            cell.imageView?.image = UIImage(data: data)
        }
        
        cell.textLabel?.text = recipes[indexPath.row].title
        
        return cell
       }
    
    


}

