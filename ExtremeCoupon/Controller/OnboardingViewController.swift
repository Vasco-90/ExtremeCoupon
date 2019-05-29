//
//  OnboardingViewController.swift
//  ExtremeCoupon
//
//  Created by Christian Dobrovolny on 22.05.19.
//  Copyright © 2019 Christian Dobrovolny. All rights reserved.
//

import UIKit
import paper_onboarding

class OnboardingViewController: UIViewController {
    @IBOutlet weak var onboardingView: OnboardingView!
    @IBOutlet weak var registerButton: RoundedButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.dataSource = self
        onboardingView.delegate = self
    }
    @IBAction func registerButtonTapped(_ sender: RoundedButton) {
        
        UserDefaults.standard.set(true, forKey: "onboardingCompleted")
            }
}

extension OnboardingViewController: PaperOnboardingDataSource, PaperOnboardingDelegate {
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        let infoImage = UIImage(named: "question")!
//        let profileImage = UIImage(named: "Profile")!
        let warningImage = UIImage(named: "information")!
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 20)!
        let descriptionFont = UIFont(name: "AvenirNext-Regular", size: 13)!
//        let backgroundOne = UIColor(displayP3Red: 249/255, green: 202/255, blue: 167/255, alpha: 1)
//        let backgroundTwo = UIColor(displayP3Red: 168/255, green: 230/255, blue: 207/255, alpha: 1)
//        let backgroundThree = UIColor(displayP3Red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        
        
        let backgroundOne = UIColor(named: "brown")!
        let backgroundTwo = UIColor(named: "darkorange")!
        let backgroundThree = UIColor(named: "accent-color")!
//        let backgroundThree = UIColor.white
        
        
        let descriptionOne = "ExtremeCoupon ist eine App die dir effektiv beim Sammeln von Payback-Punkten hilft und Dich damit beim sparen unterstützt. Du hast die Möglichkeit vorhandene Coupons zu verwenden oder selbst Coupons für Dich und die Community zu erstellen."
        let desctiptionThree = "ExtremeCoupon ist keine offizielle App von Payback. Die hier angebotenen Coupons stammen aus der Payback Community.\n Obwohl wir alle veröffentlichten Coupons mit bestem Wissen und Gewissen überprüfen, können wir Dir keine Garantie für deren Gültigkeit geben, jedoch entwickeln auch wir uns ständig weiter und hoffen Dir mit unserer Arbeit beim Punkte sammeln und Sparen eine Hilfe zu sein."
        
        
        
        return [
            OnboardingItemInfo(informationImage: infoImage, title: "Was ist ExtremeCoupon", description: descriptionOne, pageIcon: UIImage(), color: backgroundOne, titleColor: UIColor.black, descriptionColor: UIColor.black, titleFont: titleFont, descriptionFont: descriptionFont, descriptionLabelPadding: 20.0, titleLabelPadding: 0.0),
            OnboardingItemInfo(informationImage: infoImage, title: "Registrierung notwendig", description: "Die Registrierung ist notwendig um den vollen Umfang der App zu nutzen. Selbstverständlich hast Du auch die Möglichkeit dir erstmal die App gemütlich als Anonymer Nutzer anzuschauen", pageIcon: UIImage(), color: backgroundTwo, titleColor: UIColor.black, descriptionColor: UIColor.black, titleFont: titleFont, descriptionFont: descriptionFont, descriptionLabelPadding: 20.0, titleLabelPadding: 0.0),
            OnboardingItemInfo(informationImage: warningImage, title: "Ein letzter Hinweis", description: desctiptionThree, pageIcon: UIImage(), color: backgroundThree, titleColor: UIColor.black, descriptionColor: UIColor.black, titleFont: titleFont, descriptionFont: descriptionFont, descriptionLabelPadding: 20.0, titleLabelPadding: 0)
            ][index]
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 1 {
            if self.registerButton.alpha == 1 {
                UIView.animate(withDuration: 0.2) {
                    self.registerButton.alpha = 0
                }
            }
            
        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            UIView.animate(withDuration: 0.4) {
                self.registerButton.alpha = 1
            }
        }
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index _: Int) {
        item.descriptionLabel?.textAlignment = .justified
    }
}
