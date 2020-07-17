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
    var interstitial: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        bannerView.delegate = self
        interstitial = createAndLoadInterstitial()
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        let request = GADRequest()
        interstitial.load(request)
    }
    

    func createAndLoadInterstitial() -> GADInterstitial {
      var interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
      interstitial.delegate = self
      interstitial.load(GADRequest())
      return interstitial
    }

    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
      interstitial = createAndLoadInterstitial()
    }
    
    @IBAction func interstialShowAd(_ sender: Any) {
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
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
    
    extension ViewController: GADInterstitialDelegate {
        /// Tells the delegate an ad request succeeded.
        func interstitialDidReceiveAd(_ ad: GADInterstitial) {
          print("interstitialDidReceiveAd")
        }

        /// Tells the delegate an ad request failed.
        func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
          print("interstitial:didFailToReceiveAdWithError: \(error.localizedDescription)")
        }

        /// Tells the delegate that an interstitial will be presented.
        func interstitialWillPresentScreen(_ ad: GADInterstitial) {
          print("interstitialWillPresentScreen")
        }

        /// Tells the delegate the interstitial is to be animated off the screen.
        func interstitialWillDismissScreen(_ ad: GADInterstitial) {
          print("interstitialWillDismissScreen")
        }

//        /// Tells the delegate the interstitial had been animated off the screen.
//        func interstitialDidDismissScreen(_ ad: GADInterstitial) {
//          print("interstitialDidDismissScreen")
//        }

        /// Tells the delegate that a user click will open another app
        /// (such as the App Store), backgrounding the current app.
        func interstitialWillLeaveApplication(_ ad: GADInterstitial) {
          print("interstitialWillLeaveApplication")
        }
    }


