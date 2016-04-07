//
//  ViewController.swift
//  theChampSelect
//
//  Created by AndAnotherOne on 4/7/16.
//  Copyright © 2016 AndAnotherOne. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var champions = [Champion]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        let champ1 = Champion(entity: "Champion", insertIntoManagedObjectContext: <#T##NSManagedObjectContext?#>)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return champions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("ChampionCell") as? ChampionTableViewCell {
            let champion = champions[indexPath.row]
            cell.configureCell(champion)
            return cell
        } else {
            return ChampionTableViewCell()
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 150.0
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults()
        tableView.reloadData()
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = app.managedObjectContext
        let fetchRequest  = NSFetchRequest(entityName: "Champion")
        
        do {
            let results = try context.executeFetchRequest(fetchRequest)
            self.champions = results as! [Champion]
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    // Segue over to detailed view
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailsSegue" {
            if let cell = sender as? ChampionTableViewCell, row = tableView.indexPathForCell(cell)?.row, detailVC = segue.destinationViewController as? DetailedViewController {
                detailVC.champion = champions[row]
            }
        }
    }
    
    // Remove movie by swiping
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let app = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = app.managedObjectContext
            context.deleteObject(champions[indexPath.row] as NSManagedObject)
            champions.removeAtIndex(indexPath.row)
            
            do {
                try context.save()
            } catch {}
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            tableView.reloadData()
            
        }
    }
    
    // Row selection styling
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    //Status Bard Hide
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

