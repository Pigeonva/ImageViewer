//
//  ViewController.swift
//  ImageViewer
//
//  Created by Артур Фомин on 21.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var firstImageView: UIImageView!
    
    //MARK: - let/var
    
    let imagesArray = [UIImage(named: "1"),
                       UIImage(named: "2"),
                       UIImage(named: "3"),
                       UIImage(named: "4"),
                       UIImage(named: "5"),
                       UIImage(named: "6"),
                       UIImage(named: "7"),
                       UIImage(named: "8"),
                       UIImage(named: "9"),
                       UIImage(named: "10")]
    var index = 0
    var secondImageView = UIImageView()
    
    //MARK: - Lifecycle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstImageView.image = imagesArray[index]
    }
    
    //MARK: - IBActions
    
    @IBAction func leftButtonPressed(_ sender: UIButton) {

        if index == 0 {
            index = imagesArray.count - 1
            leftMove()
        } else {
            index -= 1
            leftMove()
        }
    }
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        
        if index < imagesArray.count - 1 {
            index += 1
            self.rightMove()
        } else {
            index = 0
            self.rightMove()
        }
    }
    
    //MARK: - flow functions
    
    private func rightMove() {
        view.addSubview(secondImageView)
        secondImageView.frame = CGRect(x: firstImageView.frame.width, y: firstImageView.frame.origin.y, width: firstImageView.frame.width, height: firstImageView.frame.height)
        secondImageView.image = imagesArray[index]
        UIView.animate(withDuration: 0.3) {
            self.secondImageView.frame.origin.x -= self.firstImageView.frame.width
        } completion: { _ in
            self.firstImageView.image = self.secondImageView.image
            self.secondImageView.removeFromSuperview()
        }
    }
    
    private func leftMove() {
        view.addSubview(secondImageView)
        secondImageView.frame = CGRect(x: firstImageView.frame.origin.x, y: firstImageView.frame.origin.y, width: firstImageView.frame.width, height: firstImageView.frame.height)
        secondImageView.image = firstImageView.image
        firstImageView.image = imagesArray[index]
        UIView.animate(withDuration: 0.3) {
            self.secondImageView.frame.origin.x -= self.firstImageView.frame.width
        } completion: { _ in
            self.secondImageView.removeFromSuperview()
        }
    }
}

