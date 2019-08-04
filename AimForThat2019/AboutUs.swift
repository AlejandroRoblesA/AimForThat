//
//  AboutUs.swift
//  AimForThat2019
//
//  Created by Alejandro on 5/8/19.
//  Copyright © 2019 ONCLICKMX11. All rights reserved.
//

import UIKit

class AboutUs: UIViewController {

    //@IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var wView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "AimForThat", withExtension: "html"){
            print(url)
        }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func  backPressed(){
        dismiss(animated: true, completion: nil)
    }
}
