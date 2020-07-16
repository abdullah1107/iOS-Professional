//
//  model.swift
//  ExpandingTableViewCell + Programiticially
//
//  Created by Muhammad Abdullah Al Mamun on 13/7/20.
//  Copyright © 2020 Muhammad Abdullah Al Mamun. All rights reserved.
//

import Foundation
import UIKit

struct CellProperty{
    
    let label:String?
    let image:UIImage?
    
    init(label:String?, image:UIImage?) {
        self.label = label
        self.image = image
    }
}

let property =
    [CellProperty(label: "Bangladesh in Bengali: বাংলাদেশ, pronounced officially the People's Republic of Bangladesh, is a country in South Asia. It is the eighth-most populous country in the world, with a population exceeding 162 million people.[15] In terms of land mass, Bangladesh ranks 92nd, spanning 148,460 square kilometres (57,320 sq mi), making it one of the most densely-populated countries in the world. Bangladesh shares land borders with India to the west, north, and east, Myanmar to the southeast, and the Bay of Bengal to the south. It is narrowly separated from Nepal and Bhutan by the Siliguri Corridor, and from China by Sikkim, in the north, respectively. Dhaka, the capital and largest city, is the nation's economic, political and cultural hub. Chittagong, the largest sea port, is the second-largest city. The longest sea-beach of the world and the largest mangrove forest The Sundarbans is included under Bangladesh", image: UIImage(named: "bangladesh")),
     CellProperty(label: "India, officially the Republic of India  is a country in South Asia. It is the second-most populous country, the seventh-largest country by area, and the most populous democracy in the world. Bounded by the Indian Ocean on the south, the Arabian Sea on the southwest, and the Bay of Bengal on the southeast, it shares land borders with Pakistan to the west;[f] China, Nepal, and Bhutan to the north; and Bangladesh and Myanmar to the east. In the Indian Ocean, India is in the vicinity of Sri Lanka and the Maldives; its Andaman and Nicobar Islands share a maritime border with Thailand and Indonesia.", image: UIImage(named: "india")),
     CellProperty(label: "Pakistan, officially the Islamic Republic of Pakistan,[d] is a country in South Asia. It is the world's fifth-most populous country with a population exceeding 212.2 million. It is the 33rd-largest country by area, spanning 881,913 square kilometres (340,509 square miles). Pakistan has a 1,046-kilometre (650-mile) coastline along the Arabian Sea and Gulf of Oman in the south and is bordered by India to the east, Afghanistan to the west, Iran to the southwest, and China to the northeast. It is separated narrowly from Tajikistan by Afghanistan's Wakhan Corridor in the northwest, and also shares a maritime border with Oman", image: UIImage(named: "pakistan"))]
