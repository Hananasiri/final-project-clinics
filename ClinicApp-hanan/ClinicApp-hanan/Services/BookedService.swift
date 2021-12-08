//
//  BookedService.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 04/05/1443 AH.
//

import UIKit
import FirebaseFirestore


class FavoriteService {
    
 static let shared = FavoriteService()
    
 let favoriteCollection = Firestore.firestore().collection("Favorite")
    
    
 func addToprofile(book: Mawaid) {
     favoriteCollection.document(book.booked).setData([
        "booked" : book.booked,
        "booked2" : book.booked2,
        "booked3" : book.booked3
  ])
 }
    
 func listenToMawaid(completion: @escaping (([Mawaid]) -> Void)) {
   favoriteCollection.addSnapshotListener { snapshot, error in
   if error != nil {
    return
   }
   guard let documents = snapshot?.documents else { return }
       
   var favorite: Array<Mawaid> = []
   for document in documents {
    let data = document.data()
    let fBook = Mawaid(booked: (data["booked"] as? String) ?? "Nothing",
                       booked2: (data["booked2"] as? String) ?? "Nothing",
                       booked3: (data["booked3"] as? String) ?? "Nothing")
       

   
     favorite.append(fBook)
   }
   completion(favorite)
  }
 }
}

