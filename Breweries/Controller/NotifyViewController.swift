//
//  NotifyViewController.swift
//  Breweries
//
//  Created by Admin on 8/28/18.
//  Copyright © 2018 MobileAppsCompany. All rights reserved.
//

import UIKit
import UserNotifications
import FlatUIKit
import CoreText
import Kingfisher


class NotifyViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var notifyButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        img.image = UIImage(named: "niceBeer")
        
        let url = URL(string: "https://vignette.wikia.nocookie.net/uncyclopedia/images/2/25/Pilsner_urquell_beer.jpg/revision/latest?cb=20090820160153")!
        img.kf.setImage(with: url)
        notifyButton.backgroundColor = UIColor.blendedColor(withForegroundColor: UIColor.tangerine(), backgroundColor: UIColor.pomegranate(), percentBlend: 0.65)
//        notifyButton.image(for: .selected)
//      Tried to impliment the FlatUIKit here but kinda (4 years old btw)
//      looks like it belongs in a .h file or maybe its obj - C code???
        //////////////////////////////////////////////////////
//        notifyButton.backgroundColor = [UIColor turquois];
//        notifyButton.shadowColor = [UIColor greenSeaColor];
//        notifyButton.shadowHeight = 3.0f;
//        notifyButton.cornerRadius = 6.0f;
//        notifyButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
//        [notifyButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
//        [notifyButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
        /////////////////////////////////////////////////////////
    }

    @IBAction func pushNotifyButton(_ sender: Any) {
        // message content
        let content = UNMutableNotificationContent()
        content.title = "**\"BEER TIME FELLAS\"**!"
        content.subtitle = "Drink up? Of Course"
        content.body = "JUG,-> JUG,-> JUG,->> JUUUUG!!!!!"
        content.badge = 99
        content.sound = UNNotificationSound.default()
        
        
        
        // trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 8,
                                                        repeats: false)
        
        // request with unique identifier
        let requestIdentifier = "Brewer"
        let request = UNNotificationRequest(identifier: requestIdentifier,
                                            content: content, trigger: trigger)
        
        // add request to notification center
        UNUserNotificationCenter.current().add(request,
                                               withCompletionHandler: { (error) in
                                                // Handle error
        })
    }
    
}
