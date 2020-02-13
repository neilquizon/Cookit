//
//  RecipeDetailsViewController.swift
//  Cookit
//
//  Created by Neil Quizon on 2020-02-13.
//  Copyright © 2020 Neil Quizon. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var recipe: Recipe?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // the title of the view is set to the title from the recipe
        
        self.title = recipe?.title
        
        if let url = URL(string: recipe!.imageURL),
            let data = try? Data(contentsOf: url)
        {
            imageView.image = UIImage(data:data)
        }

        // Do any additional setup after loading the view.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipe?.steps.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stepCell", for: indexPath)
           
           cell.textLabel?.text = recipe?.steps[indexPath.row]
           
           return cell
    }
    
    


}


