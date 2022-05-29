//
//  AdaptedTableView.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 26.05.2022.
//

import UIKit



class AdaptedTableView: UITableView {
    
    
// MARK: - Public properties
    
    var viewModel: AdaptedSectionViewModelType?
    var cellFactory: AdaptedCellFactoryProtocol? {
        didSet {
            cellFactory?.cellTypes.forEach({ $0.register(self)})
        }
    }
    
// MARK: - Public methods
    func setup() {
        self.dataSource = self
        self.delegate = self
    }
    
}

// MARK: - UITableViewDataSource

extension AdaptedTableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.sections.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.sections[section].cells.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cellFactory = cellFactory,
            let cellViewModel = viewModel?.sections[indexPath.section].cells[indexPath.row]
        else {
            return UITableViewCell()
        }
        
        return cellFactory.generateCell(viewModel: cellViewModel, tableView: tableView, for: indexPath)
    }
}

// MARK: - UITableViewDelegate

extension AdaptedTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.updateMainSection(indexPath: indexPath)
    }
}

