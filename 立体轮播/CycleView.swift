//
//  CycleView.swift
//  立体轮播
//
//  Created by caimengnan on 2018/4/20.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

import UIKit

class CycleView: UIView {

    
    let totalCount = 100
    var imageArr = [String]()
    var indexArr = [NSInteger]()
    
    let itemSpace = CGFloat()
    
    //选中的回调
    var selectedCourseClosure:((Int) -> Void)?
    
    lazy var collectionView :UICollectionView = {
        
        let layout = CycleLayout()
        layout.scrollDirection = .horizontal
        let space = self.frame.size.height
        layout.sectionInset = UIEdgeInsetsMake(0, -space/2, 0, space/2)
        layout.minimumLineSpacing = -space/2
        layout.itemSize = CGSize(width: space, height: space)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CYCleCell", bundle: nil), forCellWithReuseIdentifier: "CYCleCellID")
        return collectionView
        
    }()
        
    
    var selectedIndex = 0
    var models: [String] = [String]() {
        didSet {
            if models.count < 2 {
                collectionView.isScrollEnabled = false
            }
            for _ in 0..<totalCount {
                for j in 0..<models.count {
                    indexArr.append(j)
                }
            }
            
            collectionView.scrollToItem(at: IndexPath(item: totalCount/2 * models.count, section: 0), at: .centeredHorizontally, animated: false)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.addSubview(collectionView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: -代理方法
extension CycleView:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedCourseClosure?(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return indexArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CYCleCellID", for: indexPath) as! CYCleCell
        
        cell.cycleImageView.image = UIImage(named: models[indexArr[indexPath.row]])
        
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //找到滚动停止的点对应的collectionView的indexPath
        let point =  self.convert(collectionView.center, to: collectionView)
        let index = collectionView.indexPathForItem(at: point)
        let indexpath = (index?.row ?? 0) % models.count
        
        collectionView.scrollToItem(at: IndexPath(item: totalCount/2 * models.count + indexpath, section: 0), at: .centeredHorizontally, animated: false)
    }

}
