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
    
    private let data = AppRepository.shared.testList

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
