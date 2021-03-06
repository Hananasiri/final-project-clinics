//
//  ClinicVC.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 17/04/1443 AH.
//

import UIKit

class ClinicVC : UIViewController, UICollectionViewDelegate  , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
   // Use collecton views
    private var ClinicC: UICollectionView?

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
           UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width - 1) / 2, height: (view.frame.width - 1) / 2)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bgColor")
        title = NSLocalizedString("العيادات", comment: "")
        
      // Use auto layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 2, bottom: 90, right: 2)
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        layout.scrollDirection = .horizontal
        
        ClinicC = UICollectionView(frame: .zero,
        collectionViewLayout: layout)
        //ClinicC?.backgroundColor = #colorLiteral(red: 0.9557257295, green: 0.9008562565, blue: 0.9714898467, alpha: 1)
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
    
    // use navigation controller
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let data = clinicList[indexPath.row]
        if indexPath.row == 0 {
        let navigationController = UINavigationController(
        rootViewController: DinteraClinic()
          )
          navigationController.navigationBar.prefersLargeTitles = true
          navigationController.modalPresentationStyle = .fullScreen
          present(navigationController, animated: true, completion: nil)
        }else if indexPath.row == 1 {
          let navigationController = UINavigationController(
            rootViewController: JoyaClinic()
          )
          navigationController.navigationBar.prefersLargeTitles = true
          navigationController.modalPresentationStyle = .fullScreen
          present(navigationController, animated: true, completion: nil)
        } else if indexPath.row == 2 {
          let navigationController = UINavigationController(
            rootViewController: AlmadarClinic()
          )
          navigationController.modalPresentationStyle = .fullScreen
          navigationController.navigationBar.prefersLargeTitles = true
          present(navigationController, animated: true, completion: nil)
        } else if indexPath.row == 3 {
          let navigationController = UINavigationController(
            rootViewController: ProClinic()
          )
          navigationController.navigationBar.prefersLargeTitles = true
          navigationController.modalPresentationStyle = .fullScreen
          present(navigationController, animated: true, completion: nil)
        }
    
       }
    
    
       }
