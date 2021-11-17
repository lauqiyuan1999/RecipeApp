//
//  RecipeDetail.swift
//  RecipeApp
//
//  Created by Lau on 16/11/2021.
//

import UIKit
//import Firebase

class RecipeDetailViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var stepLabel: UITextView!
    @IBOutlet weak var recipeTypeLabel: UILabel!
    
    
//    @Published var list = [Recipe]()
//    let db = Firestore.firestore()
    var db = DBHelper()
    
    var image = UIImage()
    var name = ""
    var recipeID: String=""
    var singleRecipe = Recipe(Rid: "", recipeName: "", ingredient: "", step: "", recipeType: "", imageFilePath: "")
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    var imageFilePath: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepLabel.isEditable = false
        label.text = "\(name)"
        ingredientLabel.text = "\(singleRecipe.ingredient)"
        stepLabel.text = "\(singleRecipe.step)"
        recipeTypeLabel.text = "\(singleRecipe.recipeType)"
        //rename the image between image and image view
        recipeImg.image = load(fileName: imageFilePath)
    }
    

    @IBAction func OnclickEdit(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "ModifyRecipeViewController") as? ModifyRecipeViewController
        
        vc?.modifyRecipe = self.singleRecipe
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    private func load(fileName: String) -> UIImage? {
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        }
        return nil
    }
    
    @IBAction func OnClickDelete(_ sender: Any) {
        let alert = UIAlertController(title: "Delete Confirmation", message: "Would you like to delete selected recipes?", preferredStyle: UIAlertController.Style.alert)

        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Delete", style: UIAlertAction.Style.default,handler: {_ in
            _ = self.navigationController?.popViewController(animated: true)
            
            self.db.deleteRecipe(id: self.recipeID)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
    

}
