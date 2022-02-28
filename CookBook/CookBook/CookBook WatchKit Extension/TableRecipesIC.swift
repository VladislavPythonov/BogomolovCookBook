//
//  InterfaceController.swift
//  CookBook WatchKit Extension
//
//  Created by Student on 31.01.2022.
//

import WatchKit
import Foundation


class TableRecipesIC: WKInterfaceController {
    
    @IBOutlet weak var table: WKInterfaceTable!

    override func awake(withContext context: Any?) {
        table.setNumberOfRows(Recipes.getRecipe().count, withRowType: "tableRow")
    
        for (index, item) in Recipes.getRecipe().enumerated() {
            let controller = table.rowController(at: index) as! RowTable
            controller.rowRecipeName.setText(item.recipeName)
            controller.rowPicture.setImageNamed(item.recipeIcon)
            
        }
    }
    
    override func willActivate() {
    
    }
    
    override func didDeactivate() {

    }

    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        return Recipes.getRecipe()[rowIndex]
    }
    
}
