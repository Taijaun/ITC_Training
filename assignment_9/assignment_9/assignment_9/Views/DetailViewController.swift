//
//  DetailViewController.swift
//  assignment_9
//
//  Created by Taijaun Pitt on 13/04/2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var labelFruitName: UILabel!
    
    @IBOutlet weak var labelFamilyName: UILabel!
    
    @IBOutlet weak var labelOrderName: UILabel!
    
    @IBOutlet weak var labelGenusOrder: UILabel!
    
    @IBOutlet weak var labelCarbs: UILabel!
    
    @IBOutlet weak var labelProtein: UILabel!
    
    @IBOutlet weak var labelFat: UILabel!
    
    @IBOutlet weak var labelCalories: UILabel!
    
    @IBOutlet weak var labelSugar: UILabel!
    
    var fruit: Fruit?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let fruit = fruit else {return}

        labelFruitName.text = fruit.name
        labelFamilyName.text = "Family: \(fruit.family)"
        labelOrderName.text = "Order: \(fruit.order)"
        labelGenusOrder.text = "Genus: \(fruit.genus)"
        labelCarbs.text = "Carbs: \(fruit.nutritions.carbohydrates)"
        labelProtein.text = "Protein: \(fruit.nutritions.protein)"
        labelFat.text = "Fat: \(fruit.nutritions.fat)"
        labelCalories.text = "Calories: \(fruit.nutritions.calories)"
        labelSugar.text = "Sugar: \(fruit.nutritions.sugar)"
        
    }
    

    

}
