//: Playground - noun: a place where people can play

import PlaygroundSupport
import UIKit
import LayoutKit

let container = UIView(frame: CGRect(500))
container.backgroundColor = .white

PlaygroundPage.current.liveView = container


let view1 = PlaygroundView()
let view2 = PlaygroundView()
let view3 = PlaygroundView()
let view4 = PlaygroundView()


container.addSubview(view1)
container.addSubview(view2)
container.addSubview(view3)
container.addSubview(view4)


view1.layout.size(width: 450, height: 300)
view1.layout.center(in: container)

view2.layout.size(150)
view2.layout.corner(view1.top.inside + 20, view1.left.inside + 20)

view3.layout.height(50)
view3.layout.fill(view2.bottom.outside + 10)

view4.layout.width(100)
view4.layout.fill(view1.right.inside)