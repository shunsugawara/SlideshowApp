//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 菅原駿 on 2018/09/11.
//  Copyright © 2018年 shun.sugawara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var autoButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    

    var timer : Timer!
    var image : UIImage?
    var imageNumber:Int = 1
    var lastImageNumber:Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //画像タップでshowDetailViewを呼び出す
        let tapImageView = UITapGestureRecognizer(target: self, action: #selector(self.showDetailView))
        imageView.addGestureRecognizer(tapImageView)
        imageView.isUserInteractionEnabled = true
        
        imageView.image =  UIImage(named: "sample1.png")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backButton(_ sender: Any) {
        if(imageNumber == 1){
            imageNumber = lastImageNumber
        }else{
            imageNumber -= 1
        }
        imageView.image = UIImage(named: "sample\(imageNumber).png")
        
    }
    
    @IBAction func autoButton(_ sender: Any) {

        if self.timer == nil {
            backButton.isEnabled = false
            nextButton.isEnabled = false
            autoButton.setTitle("停止", for:.normal)

            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)

        }else{
            backButton.isEnabled = true
            nextButton.isEnabled = true
            autoButton.setTitle("再生", for:.normal)

            self.timer.invalidate()
            self.timer = nil
        }
        
    }
    
    @IBAction func nextButton(_ sender: Any) {
        nextImage()
    }
    
    //segue
    @objc func showDetailView(){
        if self.timer != nil{
            backButton.isEnabled = true
            nextButton.isEnabled = true
            autoButton.setTitle("再生", for:.normal)
            
            self.timer.invalidate()
            self.timer = nil
        }
        
        self.performSegue(withIdentifier: "showDetailSegue", sender: nil)
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController:DetailViewController = segue.destination as! DetailViewController
        detailViewController.imageNumber = imageNumber
    }
    
    @objc func updateTimer(_ timer:Timer){
        nextImage()
    }
    private func nextImage(){
        if(imageNumber == lastImageNumber){
            imageNumber = 1
        }else{
            imageNumber += 1
        }
        imageView.image = UIImage(named: "sample\(imageNumber).png")
    }
    
}

