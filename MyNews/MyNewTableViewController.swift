//
//  MyNewTableViewController.swift
//  MyNews
//
//  Created by xiu on 12/24/16.
//  Copyright © 2016 svuca. All rights reserved.
//

import UIKit

class MyNewTableViewController: UITableViewController {
    
    var newsURL: String!
    var newArrayList = [News]()
    
    class News{
        var title = ""
        var pic = ""
        var url = ""
    }
   
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
     
 
        let url = NSURL(string: "https://newsapi.org/v1/articles?source="+newsURL+"&sortBy=latest&apiKey=21505cfb178f435eab94a144cd8e81e2")
           print(url)
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
 
            print(url)
            do {
            let jsonDictionary =  try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
            
            if let newsArray = jsonDictionary["articles"] as? NSArray {
                
                for item in newsArray {
                    
                    let tempNew = News()
                    tempNew.pic = item["urlToImage"] as!String;
                    tempNew.title = item["title"] as!String;
                    tempNew.url = item["url"] as!String;
                    print(item["title"] as!String)
                    self.newArrayList.append(tempNew);
                                    }
            }
                
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.tableView.reloadData();
                });
                
          
                
            }catch {
                print("bad things happened")
            } 
            
        }
        
        task.resume()
        
        
    
 
        

        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
      return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newArrayList.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let myWebViewController = self.storyboard?.instantiateViewControllerWithIdentifier("myWebViewController") as?
        WebViewController;
        myWebViewController?.newsDetalURL = newArrayList[indexPath.row].url;
        self.navigationController?.pushViewController(myWebViewController!, animated: true)
    }
    


    override func  tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
       return 80
    }
    
    
    func imageWithImage(image:UIImage,scaledToSize newSize:CGSize)->UIImage{
        
        UIGraphicsBeginImageContext( newSize )
        image.drawInRect(CGRect(x: 0,y: 0,width: newSize.width,height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage.imageWithRenderingMode(.AlwaysTemplate)
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     let cell  = UITableViewCell()
        
        
        
    let url = NSURL(string:newArrayList[indexPath.row].pic)
     let data = NSData(contentsOfURL:url!)
        
//        let cellImg : UIImageView = UIImageView(frame: CGRectMake(5, 5, 50, 50))
//        cellImg.image = UIImage(data:data!)
  
      cell.imageView?.image = UIImage(data:data!)

     cell.textLabel?.text = newArrayList[indexPath.row].title
     return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
