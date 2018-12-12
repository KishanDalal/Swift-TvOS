//
//  LocationViewController.swift
//  IOSApp
//
//  Created by Xcode User on 2018-12-11.
//  Copyright © 2018 Kish. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation

class LocationViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var nextDayButton: UIButton!
    
    var locationManager = CLLocationManager()
    var currentLocation : CLLocation?
    
    let cityData = CityDetails()
    
    
    var avPlayer:AVPlayer!
    var avPlayerLayer:AVPlayerLayer!
    
    // Play the video (the background)
    func initVideoBackground()
    {
        avPlayer = AVPlayer(playerItem: preparePlayerItem(withIcon: Icon.snow))
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = .none
        
        avPlayerLayer.frame = view.layer.bounds
        view.backgroundColor = .clear
        view.layer.insertSublayer(avPlayerLayer, at: 0)
        
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidEachEnd(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem)
        
    }
    
    // Get the mp4
    func preparePlayerItem(withIcon icon:Icon) -> AVPlayerItem
    {
        return AVPlayerItem(url: Bundle.main.url(forResource: icon.rawValue, withExtension: "mp4")!)
    }
    
    @objc func playerItemDidEachEnd(notification:Notification)
    {
        let playerItem = notification.object as! AVPlayerItem
        //playerItem.seek(to: kCMTimeZero)
        playerItem.seek(to: kCMTimeZero, completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initVideoBackground()
       
       // Format Date
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .long
        
        let currentDateTime1 = Date()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "EEEE"
        
        nextDayButton.setTitle(formatter1.string(from: currentDateTime1), for: .normal)
        locationLabel.text = cityData.city
        tempLabel.text = cityData.summary
        dateLabel.text =  formatter.string(from: currentDateTime)
    }
    

    
        
 // Play and Pause to improve performance when leaving the screen
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avPlayer.play()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.pause()
    }
    
    @IBAction func nextDay(_ sender: Any) {
        
        // Alert Box is here!
        let alertController = UIAlertController(title: "Welcome! ", message: "Merry Christmas HooHooHoo", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
   
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


