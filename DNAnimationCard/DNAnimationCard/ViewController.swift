//
//  ViewController.swift
//  DNAnimationCard
//
//  Created by mainone on 16/11/1.
//  Copyright © 2016年 wjn. All rights reserved.
//

import UIKit

let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

let LAYOUT_INSET = (SCREEN_WIDTH-40)/5+20
let CELL_WIDTH = (SCREEN_WIDTH-40)*3/5
let CELL_HEIGHT = SCREEN_HEIGHT*3/7

let cellIdentifier = "cellIdentifier"

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCollectionView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func createCollectionView() {
        collectionView = UICollectionView(frame: CGRect(x:0, y:100, width:SCREEN_WIDTH, height:200), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.collectionViewLayout = layout
        // 不显示水平方向的横条
        collectionView.showsHorizontalScrollIndicator = false
        // 实现代理
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DNViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.reloadData()
        self.view.addSubview(collectionView)
    }


    lazy var layout: DNFlowLayout = {
        let lo = DNFlowLayout()
        // 滚动方向 水平
        lo.scrollDirection = .horizontal
        // 最小行间距
        lo.minimumLineSpacing = 20
        // 上下左右间距
        lo.sectionInset = UIEdgeInsetsMake(0, LAYOUT_INSET, 0, LAYOUT_INSET)
        // cell大小
        lo.itemSize = CGSize(width: CELL_WIDTH, height: CELL_WIDTH)
        
        return lo
    }()
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! DNViewCell
        cell.contentView.backgroundColor = UIColor.red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}

