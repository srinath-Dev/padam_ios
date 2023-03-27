//
//  HomeViewController.swift
//  padam
//
//  Created by Srinath Dev on 11/02/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let sectionTitles : [String] = ["Treading Movies", "Popular","Treading TV", "Upcoming Movies", "Top Rated"]
    
    private let homeFeedTable: UITableView = {
        let tabel = UITableView(frame: .zero, style: .grouped)
        tabel.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
        tabel.contentInsetAdjustmentBehavior = .never
        return tabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        view.backgroundColor = .systemBackground
//        navigationController?.setNavigationBarHidden(true, animated: false)
        
        let headerView = HeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
        view.addSubview(homeFeedTable)
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        configureNavBar()
        
        homeFeedTable.tableHeaderView = headerView
        homeFeedTable.contentInsetAdjustmentBehavior = .never
        
    }
    
   private func configureNavBar(){
           var image = UIImage(named: "headerLogo")
           image = image?.withRenderingMode(.alwaysOriginal)
       let searchBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: nil, action: nil)
           searchBarButtonItem.width = 20
           navigationItem.leftBarButtonItem = searchBarButtonItem
       navigationItem.rightBarButtonItems = [
        UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
        UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
       ]
       navigationController?.navigationBar.tintColor = .white
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tabeleView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
     func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
       return sectionTitles[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else {return}
       // header
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defalutOffset = view.safeAreaInsets.top
        let offset = scrollView.contentOffset.y + defalutOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
      
    }

}
//
//extension HomeViewController: UIScrollViewDelegate {
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        navigationController?.setNavigationBarHidden(false, animated: true)
//    }
//
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        navigationController?.setNavigationBarHidden(true, animated: true)
//    }
//}
