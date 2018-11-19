//
//  SWIFTMVVMView.swift
//  架构模式学习
//
//  Created by mo2323 on 2018/11/19.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

import UIKit

class SWIFTMVVMView: UIView {

    /** @brief 名称 */
    var nameLabel: UILabel!
    
    /** @brief 防御力 */
    var defensesLabel: UILabel!
    
    /** @brief 攻击力 */
    var aggressivityLabel: UILabel!
    
    /** @brief 血量 */
    var bloodVolumeLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubViews();
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initSubViews() {
        
        nameLabel = UILabel(frame: CGRect(x: 0, y: 20, width: self.frame.size.width, height: 20));
        nameLabel.textColor = UIColor.red;
        nameLabel.textAlignment = NSTextAlignment.center;
        self.addSubview(nameLabel);
        
        bloodVolumeLabel = UILabel(frame: CGRect(x: 10, y: nameLabel.frame.maxY + 10, width: self.frame.size.width - 10, height: 20));
        bloodVolumeLabel.textColor = UIColor.red;
        self.addSubview(bloodVolumeLabel);
        
        aggressivityLabel = UILabel(frame: CGRect(x: 10, y: bloodVolumeLabel.frame.maxY + 10, width: self.frame.size.width - 10, height: 20));
        aggressivityLabel.textColor = UIColor.red;
        self.addSubview(aggressivityLabel);
        
        defensesLabel = UILabel(frame: CGRect(x: 10, y: aggressivityLabel.frame.maxY + 10, width: self.frame.size.width - 10, height: 20));
        defensesLabel.textColor = UIColor.red;
        self.addSubview(defensesLabel);
        
    }

}
