import Foundation
import UIKit
import LayoutKit

public class PlaygroundView: UIView { }

var playgroundViews: [PlaygroundView] = []

var playgroundViewColors: [UIColor] = [
    UIColor(red: 0.96, green: 0.63, blue: 0.36, alpha: 1),
    UIColor(red: 0.96, green: 0.42, blue: 0.35, alpha: 1),
    UIColor(red: 0.87, green: 0.30, blue: 0.35, alpha: 1),
    UIColor(red: 0.65, green: 0.24, blue: 0.34, alpha: 1)
]

public extension PlaygroundView {
    convenience init() {
        self.init(frame: CGRect.zero)
        
        let color = playgroundViewColors[playgroundViews.count % playgroundViewColors.count].withAlphaComponent(0.5)
        
        self.backgroundColor = color
        
        let numberLabel = UILabel()
        addSubview(numberLabel)
        numberLabel.textAlignment = .center
        numberLabel.textColor = color
        numberLabel.clipsToBounds = true
        numberLabel.backgroundColor = .white
        numberLabel.font = .systemFont(ofSize: 12)
        numberLabel.layer.cornerRadius = 10
        numberLabel.text = "\(playgroundViews.count + 1)"
        
        numberLabel.layout.size(20)
        numberLabel.layout.center(in: self)
        
        playgroundViews.append(self)
    }
}
