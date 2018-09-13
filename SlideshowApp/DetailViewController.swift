//
//  DetailViewController.swift
//  SlideshowApp
//
//  Created by 菅原駿 on 2018/09/11.
//  Copyright © 2018年 shun.sugawara. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imageNumber:Int = 1

    @IBOutlet weak var image: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        image.image = UIImage(named: "sample\(imageNumber).png")
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
