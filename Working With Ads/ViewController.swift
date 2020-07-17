//
//  ViewController.swift
//  Working With Ads
//
//  Created by Kyle Lee on 3/24/19.
//  Copyright © 2019 Kilo Loco. All rights reserved.
//

//App ID - ca-app-pub-1306678494669379~8668789016
//Add Unit ID - ca-app-pub-1306678494669379/8368464167

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {

    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    @IBOutlet weak var bannerView: GADBannerView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        bannerView.delegate = self
        bannerView.adUnitID = "ca-app-pub-1306678494669379/8368464167"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }   
}

extension ViewController: GADBannerViewDelegate {
    /// Tells the delegate an ad request loaded an ad.
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("adViewDidReceiveAd")
    }

    /// Tells the delegate an ad request failed.
    func adView(_ bannerView: GADBannerView,
        didFailToReceiveAdWithError error: GADRequestError) {
      print("adView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    /// Tells the delegate that a full-screen view will be presented in response
    /// to the user clicking on an ad.
    func adViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("adViewWillPresentScreen")
    }

    /// Tells the delegate that the full-screen view will be dismissed.
    func adViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("adViewWillDismissScreen")
    }

    /// Tells the delegate that the full-screen view has been dismissed.
    func adViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("adViewDidDismissScreen")
    }

    /// Tells the delegate that a user click will open another app (such as
    /// the App Store), backgrounding the current app.
    func adViewWillLeaveApplication(_ bannerView: GADBannerView) {
      print("adViewWillLeaveApplication")
    }
    
}

