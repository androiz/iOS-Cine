//
//  PeliculasCollectionViewController.swift
//  Cine
//
//  Created by Andrés Rojano Ruiz on 22/11/15.
//  Copyright © 2015 Andrés Rojano Ruiz. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class PeliculasCollectionViewController: UICollectionViewController {
    
    var dataJSON: NSArray = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        let urlString = "https://demo4791082.mockable.io/peliculas"
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)
        
        
        let task = session.dataTaskWithURL(url!) {
            (data:NSData?, response:NSURLResponse?, error:NSError?) in
            
            do {
                self.dataJSON = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSArray
                dispatch_async(dispatch_get_main_queue()) {
                    self.collectionView!.reloadData()
                }
            } catch let caught as NSError {
                print("error")
            }
        }
        
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    func load_image(urlString:String, cell:PeliculaCollectionViewCell)
    {
        let imgURL: NSURL = NSURL(string: urlString)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request){
            (data, response, error) -> Void in
            
            if (error == nil && data != nil)
            {
                func display_image()
                {
                    cell.imagen?.image = UIImage(data: data!)
                }
                
                dispatch_async(dispatch_get_main_queue(), display_image)
            }
            
        }
        
        task.resume()
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.dataJSON.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let reuseIdentifier = "PeliculaCollectionViewCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PeliculaCollectionViewCell
        
        if(dataJSON.count != 0){
            cell.nombre?.text = self.dataJSON[indexPath.row]["title"] as? String
            let urlPath = self.dataJSON[indexPath.row]["url"] as! String
            let url = NSURL(string: urlPath )
            let data = NSData(contentsOfURL: url!)
            let img = UIImage(data: data!)
            cell.imagen?.image = img
        }else{
            cell.nombre?.text = "asdasd"
            let url = NSURL(string: "http://img.desmotivaciones.es/201303/dfgjggjhkjl.jpg" )
            let data = NSData(contentsOfURL: url!)
            let img = UIImage(data: data!)
            cell.imagen?.image = img
        }
    
        return cell
    }
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
