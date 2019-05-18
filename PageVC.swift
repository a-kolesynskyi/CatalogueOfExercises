//
//  PageVC.swift
//  
//
//  Created by Antony Kolesynskyi on 5/11/19.
//

import UIKit

var pageType = 0
var currentIndex = 0

class PageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    @IBAction func settingsAction(_ sender: Any) {
        performSegue(withIdentifier: "settings", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        if let vc = self.pageViewController(for: pageType) {
        setViewControllers([vc], direction: .forward, animated: true, completion: nil)
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            willTransitionTo pendingViewControllers: [UIViewController]) {
        if let itemController = pendingViewControllers[0] as? CatalogueVC {
        pageType = itemController.indexOfPage
        print("page index = \(pageType)")
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed {
            currentIndex = pageType
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? CatalogueVC)?.indexOfPage ?? 0) - 1
        return self.pageViewController(for: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = ((viewController as? CatalogueVC)?.indexOfPage ?? 0) + 1
        return self.pageViewController(for: index)
    }
    
    func pageViewController(for index: Int) -> CatalogueVC? {
        
        if index < 0 {
            return nil
        }
        if index >= 4 {
            return nil
        }
        
    let catalogue = CatalogueData()
    let vc = storyboard?.instantiateViewController(withIdentifier: "catalogueID") as! CatalogueVC
        vc.arrayOfExercises = catalogue.fullExercisesArray[index]
        vc.arrayOfDescription = catalogue.fullArrayOfDescription[index]
        vc.arrayOfColors = catalogue.fullArrayOfColors[index]
        vc.indexOfPage = index
        return vc
    }

}
