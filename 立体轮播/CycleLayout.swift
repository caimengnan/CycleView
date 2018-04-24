//
//  CycleLayout.swift
//  立体轮播
//
//  Created by caimengnan on 2018/4/20.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit

class CycleLayout: UICollectionViewFlowLayout {
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0.0, width: self.collectionView!.bounds.size.width, height: self.collectionView!.bounds.size.height)
        
        //目标区域中包含的cell
        let attrArray = super.layoutAttributesForElements(in: targetRect) as! [UICollectionViewLayoutAttributes]
        //collectionView落在屏幕重点的x坐标
        let horizontalCenterX = proposedContentOffset.x + (self.collectionView?.frame.height ?? 0)/2
        var offsetAdjustment = CGFloat(MAXFLOAT)
        for layoutAttributes in attrArray {
            
            let itemHorizontalCenterX = layoutAttributes.center.x
            //找出离中心店最近的
            if (abs(itemHorizontalCenterX-horizontalCenterX) < abs(offsetAdjustment)) {
                offsetAdjustment = itemHorizontalCenterX - horizontalCenterX
            }
        }
        
        //返回collectionView最终停留的位置
        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
        
    }

    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let itemHeight = self.collectionView?.frame.height ?? 0
        let array = super.layoutAttributesForElements(in: rect)
        let centerX = self.collectionView!.contentOffset.x + itemHeight/2
        print(self.collectionView?.contentOffset.x ?? 0)
        
        for attributes in array! {
            let value = attributes.center.x - centerX
            let delta = abs(value)
            //设置缩放比例
            let scale = 1 - delta/(4*itemHeight)
    
            //设置缩放比例
            attributes.transform = CGAffineTransform.init(scaleX: scale, y: scale)
            //层次关系
            attributes.zIndex = Int(1 - abs(delta))
            
            //向左移动，最前面的item停止一段距离
            if value <= 0{
                if delta >= 0 && delta <= itemHeight
                {
                    attributes.center.x = centerX
                    attributes.alpha = (delta > 10) ? (1 - delta/(itemHeight/4)) : 1
                    //设置缩放比例
                    attributes.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                    print(attributes.alpha)
                } else {
                    attributes.alpha = 0
                }
            }
            
        }
        
        return array
    }
    
    
    //当collectionView的显示范围发生改变的时候，是否重新fa'sheng布局
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}
