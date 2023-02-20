//
//  FirebaseCollectionReference.swift
//  E commerce
//
//  Created by Hammed on 20/02/2023.
//

import Foundation
import FirebaseFirestore

enum FcollectionReference :String {
    case User
    case Category
    case Items
    case Basket
}

func FirebaseReference(_ collectionReference: FcollectionReference) -> CollectionReference {
    return Firestore.firestore().collection(collectionReference.rawValue)
}
