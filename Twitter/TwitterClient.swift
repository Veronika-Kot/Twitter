//
//  TwitterClient.swift
//  Twitter
//
//  Created by Veronika Kotckovich on 2/8/16.
//  Copyright © 2016 Veronika Kotckovich. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

let twitterConsumerKey = "06t8dhpuTdeBOBWBDAlV3WrNh"
let twitterConsumerSecret = "CmUEGfNqcTWlz89IGPrvjTe67ycKbcZ9h0wHdjOUtMSJJi1r9p"
let twitterBaseURL = NSURL(string: "https://api.twitter.com")

class TwitterClient: BDBOAuth1SessionManager {
    class var sharedInstance: TwitterClient {
        struct Static {
            static let instance = TwitterClient(baseURL: twitterBaseURL, consumerKey: twitterConsumerKey, consumerSecret: twitterConsumerSecret)
            
        }
        
        return Static.instance
    }
    
}
