//
//  CustomHeaderView.swift
//  CollectionsV2
//
//  Created by Rodion Chykerenda on 18.03.2021.
//

import UIKit

protocol CustomHeaderViewDelegate: class {
    func customHeaderViewDelegate(_ sender: CustomHeaderView, didTapOn section: Int)
    func customHeaderViewDelegate(_ sender: CustomHeaderView, didTapOnAdd section: Int)
}

class CustomHeaderView: UITableViewHeaderFooterView {
    //MARK: - Outlets
    private var addButton: UIButton!
    
    private var nameLabel: UILabel!
    
    //MARK: - Public Properties
    weak var delegate: CustomHeaderViewDelegate?
    
    static let reuseIdentifier: String = String(describing: self)
    
    var sectionIndex = Int()
    
    //MARK: - Private Properties
    private var tapGestureRecognizer = UITapGestureRecognizer()
    
    //MARK: - LifeCycle Methods
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        tapGestureRecognizer.addTarget(self, action: #selector(handleTapOnSection(_:)))
        contentView.addGestureRecognizer(tapGestureRecognizer)
        
        nameLabel = UILabel()
        contentView.addSubview(nameLabel)
        
        addButton = UIButton()
        addButton.setTitle("Add", for: .normal)
        addButton.setTitleColor(.link, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)
        contentView.addSubview(addButton)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        addButton.widthAnchor.constraint(equalToConstant: 60.0).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
        addButton.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        addButton.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func update(name: String, index: Int) {
        nameLabel.text = name
        sectionIndex = index
    }
    
    //MARK: - Actions
    @objc func handleTapOnSection(_ tapGestureRecognizer: UITapGestureRecognizer) {
        delegate?.customHeaderViewDelegate(self, didTapOn: sectionIndex)
    }
    
    @objc func addButtonTapped(_ sender: UIButton) {
        delegate?.customHeaderViewDelegate(self, didTapOnAdd: sectionIndex)
    }
}
