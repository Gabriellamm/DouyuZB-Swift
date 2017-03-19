//
//  MainTableViewC.swift
//  DouyuZB-Swift
//
//  Created by Gabriella on 2017/3/10.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

import UIKit

class MainTableViewC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

       addChildVC(storyName: "Home")
        addChildVC(storyName: "Live")
        addChildVC(storyName: "Concern")
        addChildVC(storyName: "Me")

    }


    fileprivate func addChildVC(storyName:String){
        let childVC = UIStoryboard(name:storyName,bundle:nil).instantiateInitialViewController()!
        addChildViewController(childVC)


    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


}
