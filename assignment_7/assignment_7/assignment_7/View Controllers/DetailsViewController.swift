//
//  DetailsViewController.swift
//  assignment_7
//
//  Created by Taijaun Pitt on 07/04/2023.
//

import UIKit

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var labelFruitName: UILabel!
    
    @IBOutlet weak var labelGenus: UILabel!
    
    @IBOutlet weak var labelFamily: UILabel!
    
    @IBOutlet weak var labelOrder: UILabel!
    
    @IBOutlet weak var labelCarbohydrates: UILabel!
    
    @IBOutlet weak var labelProtein: UILabel!
    
    
    @IBOutlet weak var labelFat: UILabel!
    
    @IBOutlet weak var labelCalories: UILabel!
    
    
    @IBOutlet weak var labelSugar: UILabel!
    

    var fruit: Fruit?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelFruitName.text = fruit?.name
        labelGenus.text = fruit?.genus
        labelFamily.text = fruit?.family
        labelOrder.text = fruit?.order
        labelCarbohydrates.text = "Carbs: \(fruit?.nutritions.carbohydrates ?? 0)"
        labelProtein.text = "Protein: \(fruit?.nutritions.protein ?? 0)"
        labelFat.text = "Fat: \(fruit?.nutritions.fat ?? 0)"
        labelCalories.text = "Calories: \(fruit?.nutritions.calories ?? 0)"
        labelSugar.text = "Sugar: \(fruit?.nutritions.sugar ?? 0)"
    }
    
    

}
