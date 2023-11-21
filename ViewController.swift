//
//  ViewController.swift
//  NewsProject
//
//  Created by Berkay Kargili on 19.11.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    private var newsTabelViewModel : NewsTableViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        let url = URL(string:"https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        
        WebService().newsDownload(url: url!) { news in
            if let news = news {
                self.newsTabelViewModel = NewsTableViewModel(newsList: news)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTabelViewModel == nil ? 0 : self.newsTabelViewModel!.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        let newsViewModel = self.newsTabelViewModel?.newsAtIndexPath(indexPath.row)
        cell.titleLabel.text = newsViewModel!.title
        cell.storyLabel.text = newsViewModel!.story
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

