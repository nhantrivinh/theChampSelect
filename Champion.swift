//
//  Champion.swift
//  theChampSelect
//
//  Created by AndAnotherOne on 4/7/16.
//  Copyright © 2016 AndAnotherOne. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Champion: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    func setChampionImage(img: UIImage) {
        let nsData = UIImagePNGRepresentation(img)
        self.image = nsData
    }
    
    func getChampionImage() -> UIImage {
        if let img = UIImage(data: self.image!) {
            return img
        } else {
            return UIImage()
        }
    }
    
    

}
