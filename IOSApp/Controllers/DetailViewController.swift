//
//  DetailViewController.swift
//  IOSApp
//
//  Created by Xcode User on 2018-12-11.
//  Copyright © 2018 Kish. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController, AVAudioPlayerDelegate {

    //var avPlayer : AVAudioPlayer!
    var player : AVPlayer?
    
    @IBOutlet var Artist : UILabel!
    @IBOutlet var Name : UILabel!
    @IBOutlet var Genre : UILabel!
    var urlString : String!
    
    // Get data to details view
    func updateSong(getData : GetData, select: Int)
    {
        let rowData = (getData.dbData?[select])! as NSDictionary
        self.Artist.text = rowData["Artist"] as? String
        self.Name.text = rowData["Name"] as? String
        self.Genre.text = rowData["Genre"] as? String
        
        urlString = rowData["Song"] as? String
      
    }
    
  
    var audioPlayer = AVAudioPlayer()
    var count = 0;
    // On Button Click Play song
    @IBAction func PlaySound(_ sender: UIButton) {
        
        do{
           // let urlString = "http://dalalkis.dev.fast.sheridanc.on.ca/myApp/music/RISE.mp3"
            // Default so it doesn't crash, when song not selected
            var url = URL(string: "http://dalalkis.dev.fast.sheridanc.on.ca/myApp/music/RISE.mp3")
            url = URL(string: urlString)
            player = AVPlayer(url: url!)
            // This is to start and stop the music
            if(count == 0)
            {
                player?.play()
                count = count + 1;
            }
            else
            {
                player?.pause()
                count = 0;
            }
        }
        catch
        {
            print("caught: \(error)")
        }
        
    }
    
  
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "music1.png")!)
        // Do any additional setup after loading the view.
        
        // Set background image 
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "music1.png")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        backgroundImage.alpha = 0.6
        self.view.insertSubview(backgroundImage, at: 0)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
