//
//  MainViewModel.swift
//  PryanikyTZ_Khryapin
//
//  Created by Vitaly Khryapin on 26.05.2022.
//

import Foundation


final class MainViewModel: AdaptedSectionViewModelType {
    
    //MARK: - Propeties
    
    var sections: [AdaptedSectionViewModelProtocol]
    var data: [DataObjects]
    var viewList: [String]
    var networkService = NetworkService()
    var mainView: MainViewProtocol?
    init(mainView: MainViewProtocol) {
        self.sections = []
        self.data = []
        self.viewList = []
        self.setupMainSection()
        self.mainView = mainView
    }
    
    //MARK: - Create MainSectionTableView + get Data
    
    func setupMainSection() {
        networkService.getObjects { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let objects):
                    self.data = objects?.data ?? []
                    self.viewList = objects?.view ?? []
                    guard let objects = objects?.view  else {return}
                    for obj in objects {
                        let section = AdaptedSectionViewModel(cells: [
                            MainTextCellViewModel(text: obj)
                        ])
                        self.sections.append(section)
                    }
                    self.mainView?.success(isHidden: true, isActive: true)
                case .failure(let error):
                    self.mainView?.failer(error: error)
                }
            }
        }
    }
    
    //MARK: - check selection section
    
    func updateMainSection(indexPath: IndexPath) {
        sections.removeAll()
        let objects = data.filter{$0.name == viewList[indexPath.section]}
        for obj in objects {
            switch obj.name {
            case "hz":
                let section = AdaptedSectionViewModel(cells: [TextCellViewModel(text: obj.name, subText: obj.data?.text)])
                sections.append(section)
            case "picture":
                createPictureSection(object: obj)
            case "selector":
                createSelector(objects: obj, selectedId: obj.data?.selectedID)
            default:
                break
            }
        }
        mainView?.success(isHidden: false, isActive: false)
    }
    
    //MARK: - create selector section
    
    func createSelector(objects:  DataObjects, selectedId: Int?) {
        sections.removeAll()
        var objectsSelector = objects
        objectsSelector.data?.selectedID = selectedId
        var section = AdaptedSectionViewModel(cells: [
            TextCellViewModel(text: objectsSelector.name, subText: selectedId != nil ? "Выбран \(selectedId!) элемент" : "Элемент не выбран")
        ])
        sections.append(section)
        
        guard let variats = objectsSelector.data?.variants else { return }
        for oneOfVariants in variats {
            if oneOfVariants.id == objectsSelector.data?.selectedID {
                section = AdaptedSectionViewModel(cells: [SelectorCellViewModel(text: oneOfVariants.text, switchIsOn: true){
                    self.createSelector(objects: objectsSelector, selectedId: nil)
                }])
            } else {
                section = AdaptedSectionViewModel(cells: [SelectorCellViewModel(text: oneOfVariants.text, switchIsOn: false){
                    self.createSelector(objects: objectsSelector, selectedId: oneOfVariants.id)
                }])
            }
            sections.append(section)
        }
        mainView?.success(isHidden: false, isActive: false)
    }
    
    //MARK: - create selector section
    
    func createPictureSection(object: DataObjects) {
        guard let url =  object.data?.url else { return }
        guard let name = object.name else { return }
        if sections.isEmpty {
            let section = AdaptedSectionViewModel(cells: [TextCellViewModel(text: name, subText: nil),
                                                          PictureCellViewModel(url: url, name: object.data?.text)])
            sections.append(section)
        } else {
            let section = AdaptedSectionViewModel(cells: [PictureCellViewModel(url: url, name: object.data?.text)])
            sections.append(section)
        }
        mainView?.success(isHidden: false, isActive: false)
    }
    
    //MARK: - ButtonBack
    
    func goToTheBack() {
        sections.removeAll()
        for obj in viewList {
            let section = AdaptedSectionViewModel(cells: [
                MainTextCellViewModel(text: obj)
            ])
            self.sections.append(section)
        }
        mainView?.success(isHidden: true, isActive: true)
    }
}
