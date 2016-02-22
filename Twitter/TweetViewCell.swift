//
//  TweetViewCell.swift
//  Twitter
//
//  Created by Veronika Kotckovich on 2/14/16.
//  Copyright © 2016 Veronika Kotckovich. All rights reserved.
//

import UIKit
import AFNetworking

class TweetViewCell: UITableViewCell {

    @IBOutlet weak var retweet: UILabel!
    

    @IBOutlet weak var date: UILabel!
    
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    
    
    @IBOutlet weak var likeButton: UIButton!

    @IBOutlet weak var retwieButton: UIButton!
    
    
    @IBOutlet weak var screenname: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var textTweetLabebel: UILabel!
   
    var id: String = ""
    @IBOutlet weak var like: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
//        var defaults = NSUserDefaults.standardUserDefaults()
//        
//        if (defaults.objectForKey("OnLike") != nil) {
//            self.likeButton.setImage(UIImage(named: "like"), forState: UIControlState.Normal)
//                self.likeLabel.text = String(self.tweet.likeCount! + 1)
//                defaults.setBool(true, forKey: "OnLike")
//        }
        // Initialization code
    }
    
    @IBAction func onLike(sender: AnyObject) {
        
//        var defaults = NSUserDefaults.standardUserDefaults()
        
        TwitterClient.sharedInstance.likeTweet(Int(id)!, params: nil, completion: {(error) -> () in
            self.likeButton.setImage(UIImage(named: "like"), forState: UIControlState.Normal)
        self.likeLabel.text = String(self.tweet.likeCount! + 1)
 //           defaults.setBool(true, forKey: "OnLike")
            
        })
    }
    
    @IBAction func OnRetwite(sender: AnyObject) {
        TwitterClient.sharedInstance.retweet(Int(id)!, params: nil, completion: {(error) -> () in
        self.retwieButton.setImage(UIImage(named: "retweet"), forState: UIControlState.Normal)
//
        self.retweet.text = String(self.tweet.retweetCount! + 1)
      })
        
        
        
    }
    
    
    
    var tweet: Tweet! {
        didSet {
            
            textTweetLabebel.text = tweet.text
            retweet.text = String(tweet.retweetCount!)

            name.text = tweet.user!.name
            screenname.text = "@\(tweet.user!.screenname!)"
            
            print(tweet.user!.profileImageUrl!)
            
            profilePicture.setImageWithURL(tweet.user!.profileImageUrl!)

            //date.text = calculateTimeStamp(tweet.createdAt!.timeIntervalSinceNow)
            date.text = calculateTimeStamp(tweet.createdAt!.timeIntervalSinceNow) + " ago"
           
            id = tweet.num
            likeLabel.text = String(tweet.likeCount!)
             date.sizeToFit()
            
        }
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func calculateTimeStamp(timeTweetPostedAgo: NSTimeInterval) -> String {
        // Turn timeTweetPostedAgo into seconds, minutes, hours, days, or years
        var rawTime = Int(timeTweetPostedAgo)
        var time: Int = 0
        var timeChar = ""
        
        rawTime = rawTime * (-1)
        
        if (rawTime <= 60) { // SECONDS
            time = rawTime
            timeChar = "s"
        } else if ((rawTime/60) <= 60) { // MINUTES
            time = rawTime/60
            timeChar = "m"
        } else if (rawTime/60/60 <= 24) { // HOURS
            time = rawTime/60/60
            timeChar = "h"
        } else if (rawTime/60/60/24 <= 365) { // DAYS
            time = rawTime/60/60/24
            timeChar = "d"
        } else if (rawTime/(3153600) <= 1) { // YEARS
            time = rawTime/60/60/24/365
            timeChar = "y"
        }
        
        return "\(time)\(timeChar)"
    }

}
