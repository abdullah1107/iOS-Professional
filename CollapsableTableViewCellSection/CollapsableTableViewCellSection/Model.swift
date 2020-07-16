//
//  Model.swift
//  CollapsableTableViewCellSection
//
//  Created by Muhammad Abdullah Al Mamun on 16/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import Foundation


struct Item{
    let name:String?
    let details:String?
    
    init(name:String?, details:String?) {
        self.name    = name
        self.details = details
    }
}


struct Section{
    let sectionName:String?
    let items:[Item]?
    var collapse:Bool
    
    init(sectionName:String?, items:[Item]?, collapse:Bool = false) {
        self.sectionName = sectionName
        self.items = items
        self.collapse = collapse
    }
}

 var sectionsData = [Section(sectionName: "iPhone", items: [
    Item(name: "iPhone Xs", details: "Super Retina. In big and bigger. An all-screen design gives you a large, beautiful canvas for everything you love to do. And iPhone XS Max makes it massive, with a screen that measures 6.5 inches — our largest display ever on an iPhone."),
     Item(name: "iPhone XR", details: "All-new Liquid Retina display — the most advanced LCD in the industry. Even faster Face ID. The smartest, most powerful chip in a smartphone. And a breakthrough camera system. iPhone XR. It’s beautiful any way you look at it."),
     Item(name: "iPhone 8", details: "The iPhone 8 was received positively by critics, who noted its familiar form factor and design, improved hardware over previous 4-inch iPhone models, as well as its overall performance and battery life."),
     Item(name: "Accessories", details: "")
     ]),
 Section(sectionName: "iMac Pro", items: [
     Item(name: "MacBook", details: "Pros love iMac. So we created one just for you. It’s packed with the most powerful graphics and processors ever in a Mac, along with the most advanced storage, memory, and I/O — all behind a breathtaking Retina 5K display in a sleek, all-in-one design. For everyone from photographers to video editors to 3D animators to musicians to software developers to scientists, iMac Pro is ready to turn your biggest ideas into your greatest work."),
     Item(name: "iMac", details: "A desktop experience that draws you in and keeps you there. This is the idea behind today’s iMac. And now that idea is more powerful than ever. The new iMac is packed with all-new processors, the latest graphics technologies, innovative storage, and higher-bandwidth connectivity. And it all comes to life on the brightest and most colorful Retina display iMac has ever seen. So you get an even more immersive experience — and a scintillating new way to take it all in."),
     Item(name: "MacBook Pro", details: "Retina Display The brightest, most colorful Mac notebook display ever. The display in the MacBook Pro is the best ever in a Mac notebook."),
     Item(name: "iMac", details: "iMac combines enhanced performance with our best ever Retina display for the ultimate desktop experience in two sizes."),
     Item(name: "Mac Pro", details: "Mac Pro is equipped with pro-level graphics, storage, expansion, processing power, and memory. It's built for creativity on an epic scale."),
     Item(name: "Mac mini", details: "Mac mini is an affordable powerhouse that packs the entire Mac experience into a 7.7-inch-square frame."),
     Item(name: "OS X El Capitan", details: "The twelfth major release of OS X (now named macOS)."),
     Item(name: "Accessories", details: "")
     ]),
 Section(sectionName: "iPad", items: [
     Item(name: "iPad Pro", details: "iPad Pro delivers epic power, in 12.9-inch and a new 10.5-inch size."),
     Item(name: "iPad Air 2", details: "The second-generation iPad Air tablet computer designed, developed, and marketed by Apple Inc."),
     Item(name: "iPad mini 4", details: "iPad mini 4 puts uncompromising performance and potential in your hand."),
     Item(name: "Accessories", details: "")
     ])
]

