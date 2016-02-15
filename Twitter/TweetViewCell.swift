//
//  TweetViewCell.swift
//  Twitter
//
//  Created by Veronika Kotckovich on 2/14/16.
//  Copyright © 2016 Veronika Kotckovich. All rights reserved.
//

import UIKit

class TweetViewCell: UITableViewCell {

    @IBOutlet weak var retweet: UILabel!
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var retweetImage: UIImageView!
    
    
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var favorImage: UIImageView!
    @IBOutlet weak var screenname: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var textTweetLabebel: UILabel!
   
    var id: String = ""
    @IBOutlet weak var like: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    var tweet: Tweet! {
        didSet {
            
            textTweetLabebel.text = tweet.text
            retweet.text = String(tweet.retweetCount!)

            name.text = tweet.user!.name
            screenname.text = "@\(tweet.user!.screenname!)"
            
            profilePicture.setImageWithURL(tweet.user!.profileImageUrl!)
            
            //date.text = calculateTimeStamp(tweet.createdAt!.timeIntervalSinceNow)
            //date.text = calculateTimeStamp(tweet.createdAt!.timeIntervalSinceNow)
           
            id = tweet.num
            likeLabel.text = String(tweet.likeCount!)
            
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
