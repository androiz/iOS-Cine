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
    
    var str_titulo:String = ""
    var str_img:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.titulo.text = self.str_titulo
        let url_img = NSURL(string: str_img )
        let data_img = NSData(contentsOfURL: url_img!)
        self.image.image = UIImage(data: data_img!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
