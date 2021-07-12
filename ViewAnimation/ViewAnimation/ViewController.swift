//
//  ViewController.swift
//  ViewAnimation
//
//  Created by Tejaswini MR on 29/05/21.
//

import UIKit

class ViewController: UIViewController {

    let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    @IBOutlet var FirstView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        FirstView.backgroundColor = .white
        myView.backgroundColor = .black
        myView.center = FirstView.center
        view.addSubview(myView)
        myView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        myView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(roundCorner(_:))))
        myView.addGestureRecognizer(UISwipeGestureRecognizer(target: self, action: #selector(zoomAnimat)))
        FirstView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(roundCorner(_:))))
       
    }
    @objc func roundCorner(_ recogniser:UITapGestureRecognizer){
        switch recogniser.state{
            case .ended:
                if let view = recogniser.view  {
                    UIView.transition(with: view, duration: 0.7, options: .allowAnimatedContent) {
                        view.layer.cornerRadius = 50
                    } completion: { _ in
                        UIView.transition(with: view, duration: 0.7, options: .curveEaseInOut) {
                            view.layer.cornerRadius = 0
                        }

                    }

                }
        default:
            break
        
        }
    }
    @objc func zoomAnimat(){
        UIView.transition(with: self.myView, duration: 0.7, options: .beginFromCurrentState) {
            self.myView.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
            self.myView.center = self.view.center
        } completion: { done in
            if done{
                UIView.transition(with: self.myView, duration: 0.7, options: .beginFromCurrentState) {
                    self.myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
                    self.myView.center = self.view.center
                } completion: { done in
                    if done,self.myView.backgroundColor == .black {
                        self.myView.backgroundColor = .systemBlue
                    } else {
                        self.myView.backgroundColor = .black

                    }
                }

            }
        }

    }


}

