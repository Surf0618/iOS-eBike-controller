//
//  bluetootViewController.swift
//  BlastaroundController
//
//  Created by Stephen Sizensky on 9/1/17.
//  Copyright © 2017 Stephen Sizensky. All rights reserved.
//

import UIKit
import Foundation

class BluetoothViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let list = ["George The Monkey", "Outback the roo", "Harry hippo", "Pac-Man1", "AT-AT1"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        
    {
        return(list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return(cell)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
}
