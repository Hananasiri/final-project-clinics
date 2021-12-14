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
    
 let serviceCollection = Firestore.firestore().collection("reservations")

    // Added - Update to Appointment:
 func addToAppointment(book: Appointment) {
     serviceCollection.document(book.bookaservice).setData([
        "bookaservice" : book.bookaservice,
        "bookadoctor" : book.bookadoctor,
        "bookatime" : book.bookatime
     ], merge: true)
     }
    
    // Listen to Appointment:
 func listenToAppointment(completion: @escaping (([Appointment]) -> Void)) {
     serviceCollection.addSnapshotListener { snapshot, error in
   if error != nil {
    return
   }
   guard let documents = snapshot?.documents else { return }
       
    var statment: Array<Appointment> = []
         // Use loops
    for document in documents {
    let data = document.data()
    let Booked = Appointment(bookaservice: (data["bookaservice"] as? String) ?? "Nothing",
    bookadoctor: (data["bookadoctor"] as? String) ?? "Nothing",
    bookatime: (data["bookatime"] as? String) ?? "Nothing")
  statment.append(Booked)
   }
   completion(statment)
  }
  }
  }

