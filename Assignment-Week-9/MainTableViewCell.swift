//
//  MainTableViewCell.swift
//  Assignment-Week-9
//
//  Created by Raiymbek Azharbayev on 04.11.2023.
//

import UIKit

final class MainTableViewCell: UITableViewCell {
    
    private lazy var lineView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GillSans-Semibold", size: 22)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var dateButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(
            systemName: "clock",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18)
        ), for: .normal)
        button.imageView!.contentMode = .scaleAspectFit
        button.titleLabel!.font = UIFont(name: "GillSans", size: 16)
        button.titleLabel!.textColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        button.tintColor = .black
        return button
    }()
    
    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(
            systemName: "exclamationmark.circle.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18)
        ), for: .normal)
        button.imageView!.contentMode = .scaleAspectFit
        button.titleLabel!.font = UIFont(name: "GillSans", size: 16)
        button.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        return button
    }()
    
    private lazy var detailButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(
            systemName: "arrowtriangle.right.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18)
        ), for: .normal)
        button.imageView!.contentMode = .scaleAspectFit
        button.imageView!.tintColor = .orange
        button.setTitle(" Detail", for: .normal)
        button.titleLabel!.font = UIFont(name: "GillSans", size: 16)
        button.titleLabel!.textColor = .black
        button.backgroundColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ test: Task) {
        titleLabel.text = test.title

        dateButton.setTitle(" \(test.startDate) – \(test.endDate)", for: .normal)
        dateButton.setTitleColor(.lightGray, for: .normal)

        statusButton.setTitleColor(.black, for: .normal)
        statusButton.contentHorizontalAlignment = .left

        detailButton.setTitleColor(.black, for: .normal)
        detailButton.contentHorizontalAlignment = .left
        
        var color: UIColor
        
        switch test.status {
            case .completed:
                statusButton.setTitle(" Completed", for: .normal)
                
                color = UIColor(red: 0.28, green: 0.50, blue: 90, alpha: 1)
            case .inProgress:
                statusButton.setTitle(" \(test.daysLeft!) days left", for: .normal)
                
                switch test.daysLeft! {
                    case 1..<10:
                        color = UIColor(red: 1.00, green: 0.35, blue: 0, alpha: 1)
                    case 10..<20:
                        color = UIColor(red: 1.00, green: 0.55, blue: 0, alpha: 1)
                    default:
                        color = UIColor(red: 1.00, green: 0.75, blue: 0, alpha: 1)
                }
            case .expired:
                statusButton.setTitle(" Expired", for: .normal)
                
                color = UIColor(red: 1.00, green: 0, blue: 0, alpha: 1)
        }
        
        lineView.backgroundColor = color
        statusButton.imageView!.tintColor = color
    }
}

// MARK: - Setup UI
private extension MainTableViewCell {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(lineView)
        addSubview(titleLabel)
        addSubview(dateButton)
        addSubview(statusButton)
        addSubview(detailButton)
    }
    
    func setupConstraints() {
        lineView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(12)
            $0.top.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(lineView.snp.trailing).offset(10)
            $0.width.equalToSuperview().multipliedBy(0.8)
            $0.bottom.equalTo(dateButton.snp.top).offset(-5)
        }
        
        dateButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.centerY.equalToSuperview()
        }
        
        statusButton.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.leading)
            $0.width.equalToSuperview().multipliedBy(0.45)
            $0.top.equalTo(dateButton.snp.bottom).offset(7)
            $0.height.equalToSuperview().multipliedBy(0.25)
        }
        
        detailButton.snp.makeConstraints {
            $0.leading.equalTo(statusButton.snp.trailing).offset(5)
            $0.width.equalToSuperview().multipliedBy(0.45)
            $0.top.equalTo(dateButton.snp.bottom).offset(7)
            $0.height.equalToSuperview().multipliedBy(0.25)
        }
    }
}
