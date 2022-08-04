//
//  ViewController.swift
//  template-swift-no-sb
//
//  Created by Glenn Adams on 7/30/22.
// A Swift project template for UIKit apps, no storyboards

// use verbose NSLayoutConstraint to create a horiz strip across top and bottom right box
// use concise anchor notation to make a bottom right box
import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
       super.viewDidLoad()
       self.view.backgroundColor = .systemGray
        
       let v1 = UIView(frame: CGRect(x: 100, y: 111, width: 132 	, height: 194))
        self.view.addSubview(v1)
        v1.backgroundColor = UIColor(red: 1, green: 0.4, blue: 0, alpha: 1)
        
        let v2 = UIView()
        v1.addSubview(v2)
        v2.backgroundColor = UIColor(red: 0, green: 1, blue: 0, alpha: 1)

        let v3 = UIView()
        v1.addSubview(v3)
        v3.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1)
        v2.translatesAutoresizingMaskIntoConstraints=false
        v3.translatesAutoresizingMaskIntoConstraints=false
        
        //Top horiz strip
        // stripe top
        v1.addConstraint(NSLayoutConstraint(item: v2, attribute: .top, relatedBy: .equal, toItem: v1, attribute: .top, multiplier: 1, constant: 0))
        //stripe left
        v1.addConstraint(NSLayoutConstraint(item: v2, attribute: .leading	, relatedBy: .equal, toItem: v1, attribute: .leading, multiplier: 1, constant: 0))
        // stripe right
        v1.addConstraint(NSLayoutConstraint(item: v2, attribute: .trailing, relatedBy: .equal, toItem: v1, attribute: .trailing, multiplier: 1, constant: 0))
        //stripe bottom
        v2.addConstraint(NSLayoutConstraint(item: v2, attribute: .height , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20))
        
        // bottom view is 20x20 bottom right corner
        
        v3.addConstraint(NSLayoutConstraint(item: v3, attribute: .width , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20))
        
        v3.addConstraint(NSLayoutConstraint(item: v3, attribute: .height , relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20))
        
        v1.addConstraint(NSLayoutConstraint(item: v3, attribute: .trailing, relatedBy: .equal, toItem: v1, attribute: .trailing, multiplier: 1, constant: 0))
        
        v1.addConstraint(NSLayoutConstraint(item: v3, attribute: .bottom, relatedBy: .equal, toItem: v1, attribute: .bottom, multiplier: 1, constant: 0))

        
        // add to bottom right corner
        let v4 = UIView()
        v4.backgroundColor = .yellow
        let v5 = UIView()
        v5.backgroundColor = .purple
        let subviewArr = [v4,v5]
        subviewArr.forEach {
            v1.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            v4.heightAnchor.constraint(equalToConstant: 20),
            v4.widthAnchor.constraint(equalToConstant: 20),
            v4.leadingAnchor.constraint(equalTo: v1.leadingAnchor),
            v4.bottomAnchor.constraint(equalTo: v1.bottomAnchor, constant: 0)
        ])
        
      // purple square using visual notation
        
        let viewsDict = [ "v5": v5]
        
        let vstring = "V:|-(75)-[v5(20)]" // the top and the height
        let hstring = "H:[v5(100)]|" // the width and the trailing constraint
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: vstring, metrics: .none, views: viewsDict),
            NSLayoutConstraint.constraints(withVisualFormat: hstring, metrics: .none, views: viewsDict),

            ].flatMap{$0})
        
}

        
        
        
        
        


        
        
        
        
        
        
        
        
    
}

