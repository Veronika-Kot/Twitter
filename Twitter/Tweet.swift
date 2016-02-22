//
//  Tweet.swift
//  Twitter
//
//  Created by Veronika Kotckovich on 2/14/16.
//  Copyright © 2016 Veronika Kotckovich. All rights reserved.
//

import UIKit
import AFNetworking

class Tweet: NSObject {
    var user: User?
    var text: String?
    var createdAtString: String?
    var createdAt: NSDate?
    var num: String
    var retweetCount: Int?
    var likeCount: Int?
    

    init(dictionary: NSDictionary) {
        user = User(dictionary: dictionary["user"] as! NSDictionary)
        text = dictionary ["text"] as? String
        createdAtString = dictionary ["created_at"] as? String
    
        let formatter = NSDateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        createdAt = formatter.dateFromString(createdAtString!)
        
        num = String(dictionary["id"]!)
        retweetCount = dictionary["retweet_count"] as? Int
        likeCount = dictionary["favorite_count"] as? Int
    }
    
    class func tweetsWithArray(array: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet] ()
        
        for dictionary in array {
            tweets.append(Tweet(dictionary: dictionary))
        }
        return tweets
    }
    
    
}


