//
//  AppBarHeaderView.swift
//  padam
//
//  Created by Srinath Dev on 16/02/23.
//

import UIKit

class AppBarHeaderView: UIView {
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "heroImage")
        return imageView
    }()

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        addSubview(heroImageView)
//
//    }

}
