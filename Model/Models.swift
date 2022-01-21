//
//  News.swift
//  NewsApi.org
//
//  Created by Kaan İzgi on 20.01.2022.
//

import Foundation

struct NewsModel : Codable {
    var articles:[News]
}

struct News: Codable {
    var author: String?
    var title: String?
    var urlToImage: String?
    var url:String?
    var publishedAt:String?
    var content: String?
    var description:String?
    var source:source
}
struct source:Codable{
    var id:String?
    var name:String?
}


