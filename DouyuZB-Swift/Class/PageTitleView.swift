//
//  PageTitleView.swift
//  DouyuZB-Swift
//
//  Created by Gabriella on 2017/3/15.
//  Copyright © 2017年 Gabriella. All rights reserved.
//

import UIKit

protocol PageTitleViewDelegate :class  {
    func pageTitle(_ titleView:PageTitleView,selectedIndex index  : Int)
}

private let  KNormalColor :(CGFloat,CGFloat,CGFloat) = (85,85,85)
private let  KSelectColor   :(CGFloat,CGFloat,CGFloat) = (255,128,0)


class PageTitleView: UIView {
    // 外界需要传的参数
    fileprivate var titles:[String]  //  数组
    weak var  delegate:PageTitleViewDelegate?

    fileprivate var currentIndex : Int = 0


 // MARK:-懒加载
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]()// 创建数组对象

    fileprivate lazy var ScrollView : UIScrollView = {

        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator=false
        scrollView.scrollsToTop=false;
        scrollView.bounces=false

        return scrollView

}()


    fileprivate lazy var scrollLine: UIView={
        let scrollLine = UIView()
        scrollLine.backgroundColor=UIColor.orange
        return scrollLine
        }()


 // MARK:-自定义构造函数    外界需要传的参数
    init(frame: CGRect,titles:[String]) {
        self.titles=titles
        super.init(frame: frame)

        setupUI()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


   extension PageTitleView{
    fileprivate func  setupUI(){
        addSubview(ScrollView)
        ScrollView.frame=bounds
        setTitleLabels()


    }


     // MARK:-设置scroll  title
    fileprivate func setTitleLabels(){


        for (index,title) in titles .enumerated() {
            let label=UILabel()
            label.text=title
            label.tag=index
            label.font = UIFont.systemFont(ofSize: 16.0)
            label.textColor = UIColor(R:KNormalColor.0,G:KNormalColor.1,B:KNormalColor.2)
            label.textAlignment = .center

            let  labelW:CGFloat=frame.width/CGFloat(titles.count)
            let labelH:CGFloat = frame.height
            let labelY:CGFloat = 0

            let labelX:CGFloat = labelW * CGFloat(index)
            label.frame=CGRect(x:labelX,y:labelY,width:labelW,height:labelH)
            ScrollView.addSubview(label)
            titleLabels.append(label)// label 添加到数组内


             // MARK:-label添加手势
            label.isUserInteractionEnabled = true

            let tagGes = UITapGestureRecognizer(target:self,action:#selector(self.titleLabelClick(_ :)))

            label.addGestureRecognizer(tagGes)

        }


    }

 // MARK:-setup scrollLine
    fileprivate func setupBottomLineAndScrollLine(){

        let scrollBottomLine = UIView()
        scrollBottomLine.backgroundColor=UIColor.lightGray
        let lineH:CGFloat = 0.5
        scrollBottomLine.frame=CGRect(x: 0, y: frame.height - lineH, width: frame.width, height: lineH)
        addSubview(scrollBottomLine)




    }
}

 // MARK:-Label的点击事件   textColor   Line   切换page
extension PageTitleView{
    @objc fileprivate  func titleLabelClick(_ tapGes:UITapGestureRecognizer){
        guard let currentLabel = tapGes.view as? UILabel else {return}

// 如果重复点击就返回 
        if currentLabel.tag == currentIndex {return}
// 当前选择变色
        currentLabel.textColor=UIColor(R:KSelectColor.0,G:KSelectColor.1,B:KSelectColor.2)

        //之前的颜色变为原来的颜色

        let oldLabel = titleLabels[currentIndex]
        oldLabel.textColor=UIColor(R:KNormalColor.0,G:KNormalColor.1,B:KNormalColor.2)

        //保存现在选择的值
        currentIndex=currentLabel.tag


        // Line 变化位置
        let  scrollLineX=CGFloat(currentIndex)*scrollLine.frame.width//   类型相同才能运算
        UIView.animate(withDuration: 0.15) { 
            self.ScrollView.frame.origin.x = scrollLineX
        }



    }
}

