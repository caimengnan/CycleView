//
//  ViewController.swift
//  立体轮播
//
//  Created by caimengnan on 2018/4/20.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cycleView = CycleView(frame: CGRect(x: 10, y: 100, width: SCREEN_WIDTH-20, height: 150))
        cycleView.backgroundColor = UIColor.clear
        cycleView.models = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"]
        view.addSubview(cycleView)
        
        cycleView.selectedCourseClosure = {
            index in
            
            print("点击了第\(index)个cell")
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



