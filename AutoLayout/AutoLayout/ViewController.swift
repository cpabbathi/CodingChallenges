//
//  ViewController.swift
//  AutoLayout
//
//  Created by Chaithra Pabbathi on 3/29/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var strings = ["Bitwise XOR Operator",
                    "The bitwise XOR operator, or “exclusive OR operator” (^), compares the bits of two numbers. The operator returns a new number whose bits are set to 1 where the input bits are different and are set to 0 where the input bits are the same",
                    "Bitwise Left and Right Shift Operators",
                    "The bitwise left shift operator (<<) and bitwise right shift operator (>>) move all bits in a number to the left or the right by a certain number of places, according to the rules defined below"]
    var index = 1
    
    var imageNames = ["one", "two"]
    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNextIndex()
        label.layer.borderWidth = 4
        label.layer.borderColor = UIColor.red.cgColor
        
        setNextImage()
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.red.cgColor
    }

    @IBAction func getNextLabel(_ sender: Any) {
        setNextIndex()
    }
    
    @IBAction func getNextImage(_ sender: Any) {
        setNextImage()
    }
    
    func setNextIndex() {
        label.text = strings[index]
        index += 1
        
        if index >= strings.count {
            index = 0
        }
        
        label.sizeToFit()
    }
    
    func setNextImage() {
        imageView.image = UIImage(named: imageNames[imageIndex])
        imageIndex += 1
        
        if imageIndex >= imageNames.count {
            imageIndex = 0
        }
    }
}

