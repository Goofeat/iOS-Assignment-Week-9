//
//  ViewController.swift
//  Assignment-Week-9
//
//  Created by Raiymbek Azharbayev on 04.11.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
    
    private let fontLight = "GillSans-Light"
    private let fontRegular = "GillSans"
    private let fontSemibold = "GillSans-SemiBold"
    private let fontBold = "GillSans-Bold"
    
    private let data = [
        Test(title: "Test competition 1", startDate: "2018-03-21", endDate: "2018-04-17", isCompleted: false, daysLeft: 27),
        Test(title: "Test competition 2", startDate: "2018-05-10", endDate: "2018-06-06", isCompleted: true),
        Test(title: "Test competition 3", startDate: "2018-07-15", endDate: "2018-08-10", isCompleted: false, daysLeft: 22),
        Test(title: "Test competition 4", startDate: "2018-09-02", endDate: "2018-09-30", isCompleted: true),
        Test(title: "Test competition 5", startDate: "2018-10-12", endDate: "2018-11-08", isCompleted: false, daysLeft: 18),
        Test(title: "Test competition 6", startDate: "2018-11-25", endDate: "2018-12-22", isCompleted: true),
        Test(title: "Test competition 7", startDate: "2019-01-14", endDate: "2019-02-10", isCompleted: false, daysLeft: 14),
        Test(title: "Test competition 8", startDate: "2019-03-01", endDate: "2019-03-29", isCompleted: false, daysLeft: 9),
        Test(title: "Test competition 9", startDate: "2019-04-09", endDate: "2019-05-06", isCompleted: false, daysLeft: 3),
        Test(title: "Test competition 10", startDate: "2019-05-21", endDate: "2019-06-17", isCompleted: true),
        Test(title: "Test competition 11", startDate: "2019-06-30", endDate: "2019-07-27", isCompleted: false, daysLeft: 20),
        Test(title: "Test competition 12", startDate: "2019-08-15", endDate: "2019-09-11", isCompleted: true),
        Test(title: "Test competition 13", startDate: "2019-09-30", endDate: "2019-10-27", isCompleted: false, daysLeft: 11),
        Test(title: "Test competition 14", startDate: "2019-11-05", endDate: "2019-12-02", isCompleted: true),
        Test(title: "Test competition 15", startDate: "2019-12-18", endDate: "2020-01-14", isCompleted: false, daysLeft: 5)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        setupUI()
    }
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        tableView.backgroundColor = backgroundColor
        tableView.separatorStyle = .none
        return tableView
    }()
}

// MARK: - TableView data source methods
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath) as! MainTableViewCell
        cell.backgroundColor = .white
        cell.selectionStyle = .none
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 15
        
        cell.configure(data[indexPath.section])
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { data.count }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = backgroundColor
        return headerView
    }
}

// MARK: TableView delegate methods
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        (view.window?.windowScene?.screen.bounds.height ?? 0) * 0.12
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        3
    }
}

// MARK: - UI setup methods
private extension ViewController {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(mainTableView)
    }
    
    func setupConstraints() {
        mainTableView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
        }
    }
}
