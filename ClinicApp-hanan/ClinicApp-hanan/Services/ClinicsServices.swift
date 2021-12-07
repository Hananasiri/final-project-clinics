//
//  ClinicService.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 21/04/1443 AH.
//


import UIKit
import FirebaseFirestore


class ClinicsService {
    static let shared = ClinicsService()

    let dataCollection = Firestore.firestore().collection("data")

    func addData(data: Date) {
        dataCollection.document(data.id).setData([
            "name": data.name,
            "id": data.id
        ])
    }

    // Delete Data
    func deleteData(dataId: String) {
        dataCollection.document(dataId).delete()
    }
    
    func listenToData(completion: @escaping (([Date]) -> Void)) {

        dataCollection.addSnapshotListener { snapshot, error in
            if error != nil {
                return
            }

            guard let documents = snapshot?.documents else { return }

            var clinics: Array<Date> = []
            for document in documents {
                let data = document.data()
                let s = Date(
                    id: (data["id"] as? String) ?? "No id", name: (data["name"] as? String) ?? "No name"
                )
                clinics.append(s)
            }

            completion(clinics)
        }
        }
    func listenToDataCount(completion: @escaping ((Int) -> Void)) {
        listenToData { clinics in
            completion(clinics.count)
       }
       }
       }

