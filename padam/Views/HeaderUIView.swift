//
//  HeaderUIView.swift
//  padam
//
//  Created by Srinath Dev on 12/02/23.
//

import UIKit

class HeaderUIView: UIView {

    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "headerImage")
        return imageView
    }()
    
    private let logoLabel: UIImageView = {
        
        let imageView = UIImageView()
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.image = UIImage(named: "padamLogo")
        
    
        return imageView
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.layer.cornerRadius = 5
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.tintColor = UIColor.black
       
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    private let infoButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Info", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "info.circle"), for: .normal)
        button.tintColor = UIColor.white
       
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    private let listButton: UIButton = {
        let button = UIButton()
        button.setTitle(" My List", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        button.tintColor = UIColor.white
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addGradient()
        addSubview(listButton)
        addSubview(playButton)
        addSubview(infoButton)
        addSubview(logoLabel)
        applyContraints()
    }
    
    private func applyContraints() {
        
        let playButtonContraints = [

            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            playButton.widthAnchor.constraint(equalToConstant: 110),
            playButton.heightAnchor.constraint(equalToConstant: 40),
            playButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ]
        
        let infoButtonConstraints = [
            
            infoButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            infoButton.widthAnchor.constraint(equalToConstant: 110),
            infoButton.rightAnchor.constraint(equalTo: self.rightAnchor)
        ]
        
        let listButtonConstraints = [
            
            listButton.leftAnchor.constraint(equalTo: self.leftAnchor),
            listButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            listButton.widthAnchor.constraint(equalToConstant: 110),
        ]
        
        
        NSLayoutConstraint.activate(playButtonContraints)
        NSLayoutConstraint.activate(infoButtonConstraints)
        NSLayoutConstraint.activate(listButtonConstraints)
        
    }
    
    
    
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
        let frame  = CGRect(x: 10, y: 50, width: 45, height: 65)
        logoLabel.frame = frame
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    

}

