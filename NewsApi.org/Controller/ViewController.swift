//
//  ViewController.swift
//  NewsApi.org
//
//  Created by Kaan İzgi on 20.01.2022.
//

import UIKit
import SDWebImage
import RealmSwift

class ViewController: UIViewController {
    @IBOutlet weak var tableViewim: UITableView!
    private var NewsArray = [News]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getNews()    
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = NewsArray[indexPath.row]
        let cell = tableViewim.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.title.text = row.title
        cell.detail.text = row.description
        cell.imageUrl.sd_setImage(with: URL(string: row.urlToImage!))
        cell.source.text = row.source.name
        //Date Formatter
        let dateString = row.publishedAt!
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "GMT")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: dateString) { cell.timesago.text = (date.formatted(date: .abbreviated, time: .omitted))}
        //
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = NewsArray[indexPath.row]
        if let url = URL(string: row.url!){
            UIApplication.shared.open(url)
        }
    }
    
}

extension ViewController {
    func getNews() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=\(App.country)&apiKey=\(App.apikey)")!
        WebServer().requestUrl(url: url,
                expecting: NewsModel.self)
                { Result in
                    switch Result {
                    case.success(let datas):
                    DispatchQueue.main.async{
                    self.NewsArray = datas.articles
                    self.tableViewim.reloadData()
                    }
                    case.failure(let error):
                    print(error)
            }
        }
    }
}



