//
//  RewardedAdHelper.swift
//  TestApp
//
//  Created by chelsea on 21/02/22.

import GoogleMobileAds

class RewardedAdHelper : NSObject, GADFullScreenContentDelegate {
    private var rewardedAd : GADRewardedAd?
    static let vc = BannerAdsVC()
    func loadRewardedAd() {
      let request = GADRequest()
      GADRewardedAd.load(withAdUnitID:"ca-app-pub-3940256099942544/1712485313",
                         request: request,
                         completionHandler: { [self] ad, error in
        if let error = error {
            
            let options = GADServerSideVerificationOptions()
            options.customRewardString = "SAMPLE_CUSTOM_DATA_STRING"
            rewardedAd?.serverSideVerificationOptions = options

          print("Failed to load rewarded ad with error: \(error.localizedDescription)")
          return
        }
        rewardedAd = ad
        print("Rewarded ad loaded.")
          rewardedAd?.fullScreenContentDelegate = self

      }
      )
    }
        
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        loadRewardedAd()
    }
    
    func showRewardedAd(viewController: UIViewController) {
        if rewardedAd != nil {
            rewardedAd!.present(fromRootViewController: viewController, userDidEarnRewardHandler: {
                let reward = self.rewardedAd!.adReward
                print("\(reward.amount) \(reward.type)")
            })
        } else {
            print("RewardedAd wasn't ready")
        }
    }
    
    func show() {
      if let ad = rewardedAd {
          ad.present(fromRootViewController: RewardedAdHelper.vc) {
          let reward = ad.adReward
          print("Reward received with currency \(reward.amount), amount \(reward.amount.doubleValue)")
          // TODO: Reward the user.
        }
      } else {
        print("Ad wasn't ready")
      }
    }
}
