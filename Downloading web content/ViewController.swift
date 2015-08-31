//
//  ViewController.swift
//  Downloading web content
//
//  Created by Julio Ahuactzin on 30/08/15.
//  Copyright (c) 2015 Julio Ahuactzin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    @IBOutlet var urlItem: UITextField!
    
    @IBAction func sendUrl(sender: AnyObject) {
        let url = NSURL(string: urlItem.text)
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in
            if error == nil {
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                println(urlContent)
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                    self.webView.loadHTMLString(urlContent! as String, baseURL: nil)
                }
                
            }
            
            
        }
        
        task.resume()

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://www.stackoverflow.com")
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in
            if error == nil {
                var urlContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                println(urlContent)
                
                dispatch_async(dispatch_get_main_queue()) {
                
                    self.webView.loadHTMLString(urlContent! as String, baseURL: nil)
                }
                
            }
            
            
        }
        
        task.resume()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

