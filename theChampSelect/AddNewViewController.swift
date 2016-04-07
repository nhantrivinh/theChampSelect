//
//  AddNewViewController.swift
//  theChampSelect
//
//  Created by AndAnotherOne on 4/7/16.
//  Copyright © 2016 AndAnotherOne. All rights reserved.
//

import UIKit
import CoreData

class AddNewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var howToCruise: UITextField!
    @IBOutlet weak var champ_image: UIImageView!
    @IBOutlet weak var lbl_error_rpt: UILabel!
    @IBOutlet weak var addImage_btn: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        champ_image.layer.cornerRadius = champ_image.frame.size.width/2
        champ_image.clipsToBounds = true
        addImage_btn.layer.cornerRadius = addImage_btn.frame.size.width/2
        champ_image.clipsToBounds = true
    }
    
//    override func viewDidAppear(animated: Bool) {
//        return true
//    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        champ_image.image = image
        addImage_btn.setTitle("", forState: .Normal)
        addImage_btn.backgroundColor = UIColor.clearColor()
    }
    

    @IBAction func backBtnTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addImage(sender: UIButton) {
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    

    @IBAction func createOnPressed(sender: AnyObject) {
        if let title = nameTf.text where title != "", let image = champ_image.image where image != "", let desc = howToCruise.text where desc != "" {
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            let entity = NSEntityDescription.entityForName("Champion", inManagedObjectContext: context)!
            let champion = Champion(entity: entity, insertIntoManagedObjectContext: context)
            
            champion.name = title
            champion.howToWin = desc
            champion.setChampionImage(image)
            context.insertObject(champion)
            
            do {
                try context.save()
            } catch {
                print("Could not save recipe")
            }
            
            lbl_error_rpt.text = ""
            
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            lbl_error_rpt.text = "Incomplete Data"
        }
    }

    }

