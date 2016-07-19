//
//  AttractionDetailViewController.swift
//  TableViewStory
//
//  Created by Neil Smyth on 8/28/15.
//  Copyright © 2015 eBookFrenzy. All rights reserved.
//

import UIKit

class AttractionDetailViewController: UIViewController {

    var webSite: String?

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let address = webSite {
            print(address)
            let webURL = NSURL(string: address)
            let urlRequest = NSURLRequest(URL: webURL!)
            webView.loadRequest(urlRequest)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //픽 앤 팝 미리보기 액션 아이템
    override func previewActionItems() -> [UIPreviewActionItem] {
        let action1 = UIPreviewAction(title: "Action One", style: .Destructive) { (previewAction, viewController) in
            print("Action One Selected")
        }
        let action2 = UIPreviewAction(title: "Action Two", style: .Selected) { (previewAction, viewController) in
            print("Action Two Selected")
        }
        let groupAction1 = UIPreviewAction(title: "Group Action One", style: .Default) { (previewAction, viewController) in
            print("Group Action One Selected")
        }
        let groupAction2 = UIPreviewAction(title: "Group Action Two", style: .Default) { (previewAction, viewController) in
            print("Group Action Two Selected")
        }
        
        return [action1,action2,groupAction1,groupAction2]
    }


}
