//
//  HKPermissionsViewController.swift
//  FinalProjApp
//
//  Created by Student on 5/3/17.
//  Copyright © 2017 shp. All rights reserved.
//

import Foundation
import UIKit
import HealthKit

class permissionsForHK: UIViewController {

    let healthStore: HKHealthStore? = {
        if HKHealthStore.isHealthDataAvailable() {
            return HKHealthStore()
        } else {
            return nil
        }
    }()
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let dateOfBirthCharacteristic = HKCharacteristicType.characteristicType(
            forIdentifier: HKCharacteristicTypeIdentifier.dateOfBirth)
        
        let biologicalSexCharacteristic = HKCharacteristicType.characteristicType(
            forIdentifier: HKCharacteristicTypeIdentifier.biologicalSex)
        
        let bloodTypeCharacteristic = HKCharacteristicType.characteristicType(
            forIdentifier: HKCharacteristicTypeIdentifier.bloodType)
        
        let dataTypesToRead = NSSet(objects: dateOfBirthCharacteristic, biologicalSexCharacteristic, bloodTypeCharacteristic)

        healthStore?.requestAuthorization(toShare: nil, read: (dataTypesToRead as! Set<HKObjectType>), completion: { (success, error) -> Void in
            if success {
                print("success")
            } else {
                print(error)
            }
        
            
        
        })

    }
    




}
