//
//  Category.swift
//  E commerce
//
//  Created by Hammed on 20/02/2023.
//

import Foundation
import UIKit


class Category {
    var id :String
    var name:String
    var image: UIImage?
    var imageName: String?
    
    init(_name: String, _imageName: String) {
        id = ""
        name = _name
        imageName = _imageName
        image = UIImage(named: _imageName)
    }
    
    
    init(_dictionary:NSDictionary) {
        id = _dictionary[Constants.OBJECTID] as! String
        name = _dictionary[Constants.NAME] as! String
        image = UIImage(named: _dictionary[Constants.IMAGENAME] as? String ?? "")
    }
}

//MARK: download category

func downloadCategories(completion: @escaping (_ categoryArray:[Category]) -> Void) {
    var categoryArray : [Category] = []
    
    FirebaseReference(.Category).getDocuments { snapshot, error in
        guard let snapshot = snapshot else {
            completion(categoryArray)
            return
        }
        if !snapshot.isEmpty {
            for categoryDict in snapshot.documents{
                categoryArray.append(Category(_dictionary: categoryDict.data() as NSDictionary))
            }

        }
        completion(categoryArray)
    }
}

//MARK: save category function

func saveCategory(_ category:Category) {
    let id = UUID().uuidString
    category.id = id
    
    FirebaseReference(.Category).document(id).setData(categoryDictionaryFrom(category) as! [String : Any])
}

//MARK: helper

func categoryDictionaryFrom (_ category: Category) -> NSDictionary{
    
    
    return NSDictionary(objects: [category.id,category.name,category.imageName], forKeys: [Constants.OBJECTID as NSCopying,Constants.NAME as NSCopying,Constants.IMAGENAME as NSCopying])
}

// use only one time

//func createCategorySet (){
//    
//    let womenCloth = Category(_name: "Women's Clothing & Accessories", _imageName: "womenCloth")
//    let footWear = Category(_name: "Footwear", _imageName: "footWear")
//    let electronics = Category(_name: "Electronics", _imageName: "electronics")
//    let menClothing = Category(_name: "Men's Clothing & Accessories", _imageName: "menCloth")
//    let health = Category(_name: "Health & Beauty", _imageName: "health")
//    let baby = Category(_name: "Baby Stuff", _imageName: "baby")
//    let home = Category(_name: "Home & Kitchen", _imageName: "home")
//    let car = Category(_name: "Automobiles & Motorcycles", _imageName: "car")
//    let luggage = Category(_name: "Luggage & bags", _imageName: "luggage")
//    let jewelery = Category(_name: "Jewelery", _imageName: "jewelery")
//    let hobby = Category(_name: "hobby, Sport, Traveling", _imageName: "hobby")
//    let pet = Category(_name: "Pet products", _imageName: "pet")
//    let industry = Category(_name: "Industry & Business", _imageName: "industry")
//    let garden = Category(_name: "Garden Supplies", _imageName: "garden")
//    let camera = Category(_name: "Camera & Optics", _imageName: "camera")
//    
//    
//    let arrayOfctegories = [womenCloth,footWear,electronics,menClothing,health,baby,home,car,luggage,jewelery,hobby,pet,industry,garden,camera]
//
//    for category in arrayOfctegories {
//        saveCategory(category)
//    }
//    
//}
