//
//  BookedService.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 04/05/1443 AH.
//

import UIKit
import FirebaseFirestore


class ReservitionsService {
    
 static let shared = ReservitionsService()
    
 let favoriteCollection = Firestore.firestore().collection("reservations")
    
    
 func addToprofile(book: Mawaid) {
     favoriteCollection.document(book.bookaservice).setData([
        "bookaservice" : book.bookaservice,
        "bookadoctor" : book.bookadoctor,
        "bookatime" : book.bookatime
  ])
 }
    
 func listenToMawaid(completion: @escaping (([Mawaid]) -> Void)) {
   favoriteCollection.addSnapshotListener { snapshot, error in
   if error != nil {
    return
   }
   guard let documents = snapshot?.documents else { return }
       
    var statment: Array<Mawaid> = []
    for document in documents {
    let data = document.data()
    let Booked = Mawaid(bookaservice: (data["bookaservice"] as? String) ?? "Nothing",
                          bookadoctor: (data["bookadoctor"] as? String) ?? "Nothing",
                          bookatime: (data["bookatime"] as? String) ?? "Nothing")
       

   
  statment.append(Booked)
   }
   completion(statment)
  }
  }
  }

