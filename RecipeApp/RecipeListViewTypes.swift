//
//  RecipeListViewTypes.swift
//  RecipeApp
//
//  Created by Lau on 16/11/2021.
//

import Foundation


struct Recipe {
    let Rid: String
    let recipeName: String
    let ingredient: String
    let step: String
    let recipeType:String
    let imageFilePath: String
}
struct CellViewModel{
    let recipeName: String
}
