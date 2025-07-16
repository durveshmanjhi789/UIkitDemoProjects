//
//  BannerAdsVC.swift
//  DemoProject
//
//  Created by clavax on 09/02/23.

import GoogleMobileAds
import Foundation
import UIKit
import BubbleShowCase

class BannerAdsVC:UIViewController,GADBannerViewDelegate,GADFullScreenContentDelegate{
    
    var bannerView: GADBannerView!
    private var rewardedAdHelper = RewardedAdHelper()
    private var interstitial: GADInterstitialAd?
    
    @IBOutlet weak var showRewardedBtn: UIButton!
    @IBOutlet weak var showAdBtn: UIButton!
    @IBOutlet weak var backbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        addBannerViewToView(bannerView)
        bannerView.backgroundColor = .secondarySystemBackground
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        
        loadInterstitial()
        enableShowcase()
    }
    
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      loadInterstitial()
    }
    
    func loadInterstitial() {
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                                    request: request,
                          completionHandler: { [self] ad, error in
                            if let error = error {
                              print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                              return
                            }
                            interstitial = ad
                            interstitial?.fullScreenContentDelegate = self
                          }
        )
    }
    
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
      bannerView.alpha = 0
      UIView.animate(withDuration: 1, animations: {
        bannerView.alpha = 1
      })
    }

    func addBannerViewToView(_ bannerView: GADBannerView) {
       bannerView.translatesAutoresizingMaskIntoConstraints = false
       view.addSubview(bannerView)
       view.addConstraints(
         [NSLayoutConstraint(item: bannerView,
                             attribute: .bottom,
                             relatedBy: .equal,
                             toItem: bottomLayoutGuide,
                             attribute: .top,
                             multiplier: 1,
                             constant: 0),
          NSLayoutConstraint(item: bannerView,
                             attribute: .centerX,
                             relatedBy: .equal,
                             toItem: view,
                             attribute: .centerX,
                             multiplier: 1,
                             constant: 0)
         ])
      }

    //Bubbel show case
    
    func enableShowcase() {
        
        let inviteShowCase: BubbleShowCase! = BubbleShowCase(target: backbtn, arrowDirection: .left, label: "")
        inviteShowCase.titleText = ""
        inviteShowCase.descriptionText = "Click to this button and get back to your home page.."

        let whobetShowCase: BubbleShowCase! = BubbleShowCase(target: showRewardedBtn, arrowDirection: .down, label: "")
        whobetShowCase.titleText = ""
        whobetShowCase.descriptionText = "Click button to show Rewarded Ad here .. Under the Development Its not working right now.."
        inviteShowCase.concat(bubbleShowCase: whobetShowCase)
        
        let iBetShowCase: BubbleShowCase! = BubbleShowCase(target: showAdBtn, arrowDirection: .up, label: "")
        iBetShowCase.titleText = ""
        iBetShowCase.descriptionText = "Click button to show Interstial Ad here"
        whobetShowCase.concat(bubbleShowCase: iBetShowCase)
        inviteShowCase.show()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func showRewardedButton(_ sender: Any) {
        rewardedAdHelper.showRewardedAd(viewController: self)

    }
    
    @IBAction func showAdButton(_ sender: Any) {
        if interstitial != nil {
            interstitial!.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }
    
}
