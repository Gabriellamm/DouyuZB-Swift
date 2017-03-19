//
//  HomeViewController.swift
//  DouyuZB-Swift
//
//  Created by Gabriella on 2017/3/10.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

import UIKit


class HomeViewController: BaseViewController {

     // MARK:-属性
//    fileprivate lazy var pageTitleView:pagetitleView =

    override func viewDidLoad() {
        super.viewDidLoad()


        
        setUpUI()
        
    }




    

}

// MARK:- UI设置

extension HomeViewController{

    fileprivate  func setUpUI(){
        automaticallyAdjustsScrollViewInsets=false;

        //设置导航栏
        setUpNavigationBar()



    }


    fileprivate func setUpNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "loge")

        let size = CGSize(width:40,height:40)

        let historyItem=UIBarButtonItem(imageName:"Image_history",highImageName: "",size:size)
        let searchItem=UIBarButtonItem(imageName:"home_newSeacrhcon",highImageName: "",size:size)

        navigationItem.rightBarButtonItems=[historyItem,searchItem]



    }

}


