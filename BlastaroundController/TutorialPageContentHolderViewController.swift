//
//  TutorialPageContentHolderViewController.swift
//  test0
//
//  Created by Stephen Sizensky on 12/27/16.
//  Copyright © 2016 Stephen Sizensky. All rights reserved.
//

import UIKit

class TutorialPageContentHolderViewController: UIViewController {
    
    
    @IBOutlet weak var myImageView: UIImageView!
    
    var imageFileName: String!
    var pageIndex:Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        myImageView.image = UIImage(named:imageFileName)
        
        
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

