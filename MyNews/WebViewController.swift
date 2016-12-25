//
//  WebViewController.swift
//  MyNews
//
//  Created by xiu on 12/24/16.
//  Copyright © 2016 svuca. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    var newsDetalURL: String!
    
    @IBOutlet weak var myWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL (string: newsDetalURL);
        print(url);
        let requestObj = NSURLRequest(URL: url!);
        myWebView.loadRequest(requestObj);

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
