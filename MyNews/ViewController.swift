//
//  ViewController.swift
//  MyNews
//
//  Created by xiu on 12/24/16.
//  Copyright © 2016 svuca. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func goUSATodayNews(sender: AnyObject) {
        goToTableView("usa-today");
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    @IBAction func goToBBC(sender: AnyObject) {
    
        goToTableView("bbc-news");
    
    }
    @IBAction func goToCNN(sender: AnyObject) {
        goToTableView("cnn");
        
    }

    @IBAction func gotoABCNews(sender: AnyObject) {
    goToTableView("abc-news-au");
    }
    
    func goToTableView(url:String){
        let mapViewControllerObj = self.storyboard?.instantiateViewControllerWithIdentifier("MyNewTableViewController") as? MyNewTableViewController;
        mapViewControllerObj?.newsURL = url
        self.navigationController?.pushViewController(mapViewControllerObj!, animated: true)
        

    
    }
    


}

