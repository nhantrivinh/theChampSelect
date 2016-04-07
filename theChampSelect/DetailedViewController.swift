//
//  DetailedViewController.swift
//  theChampSelect
//
//  Created by AndAnotherOne on 4/7/16.
//  Copyright © 2016 AndAnotherOne. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    
    @IBOutlet weak var champ_Image: UIImageView!
    @IBOutlet weak var champ_Name: UILabel!
    @IBOutlet weak var champ_Desc: UILabel!
    
    var champion: Champion?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.champ_Image.image = champion?.getChampionImage()
        self.champ_Image.layer.cornerRadius = champ_Image.frame.size.width/2
        self.champ_Name.text = champion?.name
        self.champ_Desc.text = champion?.howToWin
        self.champ_Image.clipsToBounds = true
        self.champ_Image.layer.borderWidth = 5
        self.champ_Image.layer.borderColor = UIColor.whiteColor().CGColor
        self.champ_Image.layer.shadowColor = UIColor(red: 157.0 / 255.0, green: 157.0 / 255.0, blue: 157.0 / 255.0, alpha: 0.5).CGColor
        self.champ_Image.layer.shadowOpacity = 0.8
        self.champ_Image.layer.shadowRadius = 5.0
        self.champ_Image.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        
    }
    
    @IBAction func backBtnTapped(sender: UIButton!) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    

}
