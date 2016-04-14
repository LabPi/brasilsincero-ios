//
//  RankingHelper.swift
//  SherlockHolmes
//
//  Created by Daniely Botelho on 4/8/16.
//  Copyright © 2016 BrasilSincero. All rights reserved.
//

import UIKit
import ExpandingMenu

class RankingHelper: NSObject {
    
    static func buildRankingButton(viewController: UIViewController, rankingProtocol: RankingProtocol) {
        
        
        let menuButtonSize: CGSize = CGSize(width: 64.0, height: 64.0)
        let menuButton = ExpandingMenuButton(frame: CGRect(origin: CGPointZero, size: menuButtonSize), centerImage: UIImage(named: "ranking_floating_button")!, centerHighlightedImage: UIImage(named: "ranking_floating_button")!)
        menuButton.center = CGPointMake(viewController.view.bounds.width - 60.0, viewController.view.bounds.height - 130.0)
        viewController.view.addSubview(menuButton)
        
        let item1 = ExpandingMenuItem(size: menuButtonSize, title: "Ranking Nacional", image: UIImage(named: "ranking_nacional")!, highlightedImage: UIImage(named: "ranking_nacional")!, backgroundImage: UIImage(named: "ranking_nacional"), backgroundHighlightedImage: UIImage(named: "ranking_nacional")) { () -> Void in
            rankingProtocol.updateListWithRanking(Constants.RANKING_NATIONAL)
        }
        
        let item2 = ExpandingMenuItem(size: menuButtonSize, title: "Ranking Regional", image: UIImage(named: "ranking_regional")!, highlightedImage: UIImage(named: "ranking_regional")!, backgroundImage: UIImage(named: "ranking_regional"), backgroundHighlightedImage: UIImage(named: "ranking_regional")) { () -> Void in
            rankingProtocol.updateListWithRanking(Constants.RANKING_REGIONAL)
        }
        
        let item3 = ExpandingMenuItem(size: menuButtonSize, title: "Ranking Estadual", image: UIImage(named: "ranking_estadual")!, highlightedImage: UIImage(named: "ranking_estadual")!, backgroundImage: UIImage(named: "ranking_estadual"), backgroundHighlightedImage: UIImage(named: "ranking_estadual")) { () -> Void in
            rankingProtocol.updateListWithRanking(Constants.RANKING_STATE)
        }
        
        menuButton.addMenuItems([item1, item2, item3])
    }
}
