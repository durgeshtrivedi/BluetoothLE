//
//  ViewController.swift
//  PeripheralBLE
//
//  Created by durgesh on 21/08/19.
//  Copyright © 2019 All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet var label: UILabel!

    // MARK: - Lifecyle
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

    // MARK: - Properties
    var manager: BluetoothManager?

    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear(animated)

        self.manager = BluetoothManager(delegate: self)

    }

}

// MARK: - BlueEar
extension ViewController: BlueEar {

    func didStartConfiguration() { self.label.text = "Start configuration 🎛" }

    func didStartAdvertising() { self.label.text = "Start advertising 📻" }

    func didSendData() { self.label.text = "Did send data ⬆️" }

    func didReceiveData() { self.label.text = "Did received data ⬇️" }
    
    func showMessage (data : String) {toastMessage(data)}

}

extension UIViewController {
    func toastMessage(_ message: String){
        guard let window = UIApplication.shared.keyWindow else {return}
        let messageLbl = UILabel()
        messageLbl.text = message
        messageLbl.textAlignment = .center
        messageLbl.font = UIFont.systemFont(ofSize: 12)
        messageLbl.textColor = .white
        messageLbl.backgroundColor = UIColor(white: 234, alpha: 0.5)
        
        let textSize:CGSize = messageLbl.intrinsicContentSize
        let labelWidth = min(textSize.width, window.frame.width - 40)
        
        messageLbl.frame = CGRect(x: 20, y: window.frame.height/2, width: labelWidth + 100, height: textSize.height + 100)
        messageLbl.center.x = window.center.x
        messageLbl.layer.cornerRadius = messageLbl.frame.height/2
        messageLbl.layer.masksToBounds = true
        window.addSubview(messageLbl)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            UIView.animate(withDuration: 5, animations: {
                messageLbl.alpha = 0
            }) { (_) in
                messageLbl.removeFromSuperview()
            }
        }
    }}
