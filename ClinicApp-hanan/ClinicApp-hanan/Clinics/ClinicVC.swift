//
//  ClinicVC.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 17/04/1443 AH.
//

import UIKit

class ClinicVC : UIViewController, UICollectionViewDelegate  , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
   
    private var ClinicC: UICollectionView?

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 210, height: 240)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
      // Use auto layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: 150,
                                 height: 210)
        ClinicC = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        
        
        guard let ClinicC = ClinicC else {
            return
        }
        
        ClinicC.register(ClinicCell.self, forCellWithReuseIdentifier: ClinicCell.identifier)
        ClinicC.dataSource = self
        ClinicC.delegate = self
        view.addSubview(ClinicC)
        ClinicC.frame = view.bounds

    }
    

        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return clinicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = ClinicC?.dequeueReusableCell(withReuseIdentifier: ClinicCell.identifier, for: indexPath) as! ClinicCell
        
        cell.setCell(card: clinicList[indexPath.row])
            
              return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = clinicList[indexPath.row]
        if indexPath.row == 0 {
          let navigationController = UINavigationController(
            rootViewController: ClinicDentera()
          )
          navigationController.navigationBar.prefersLargeTitles = true
          navigationController.modalPresentationStyle = .fullScreen
          present(navigationController, animated: true, completion: nil)
        }else if indexPath.row == 1 {
          let navigationController = UINavigationController(
            rootViewController: ClinicJoya()
          )
          navigationController.navigationBar.prefersLargeTitles = true
          navigationController.modalPresentationStyle = .fullScreen
          present(navigationController, animated: true, completion: nil)
        } else if indexPath.row == 2 {
          let navigationController = UINavigationController(
            rootViewController: ClinicBro()
          )
          navigationController.modalPresentationStyle = .fullScreen
          navigationController.navigationBar.prefersLargeTitles = true
          present(navigationController, animated: true, completion: nil)
        } else if indexPath.row == 3 {
          let navigationController = UINavigationController(
            rootViewController: ClinicAbuHathrah()
          )
          navigationController.navigationBar.prefersLargeTitles = true
          navigationController.modalPresentationStyle = .fullScreen
          present(navigationController, animated: true, completion: nil)
        }
    
       }
       }
