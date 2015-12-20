//
//  DetailViewController.swift
//  Cine
//
//  Created by Andrés Rojano Ruiz on 6/12/15.
//  Copyright © 2015 Andrés Rojano Ruiz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titulo:UILabel!
    @IBOutlet weak var image:UIImageView!
    @IBOutlet weak var sinopsis:UILabel!
    
    var str_titulo:String = ""
    var str_img:String = ""
    var str_sinopsis:String = ""
    
    var film:NSDictionary = [:]
    
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.titulo.text = self.str_titulo
        let url_img = NSURL(string: str_img )
        let data_img = NSData(contentsOfURL: url_img!)
        self.image.image = UIImage(data: data_img!)
        self.sinopsis.text = self.str_sinopsis
        
        scrollView.contentSize.height = 630
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if let vc = segue.destinationViewController as? SesionesTableViewController {
            vc.film = self.film as Dictionary
        }
    }

}
