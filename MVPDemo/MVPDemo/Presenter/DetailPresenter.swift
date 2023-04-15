//
//  DetailPresenter.swift
//  MVPDemo
//
//  Created by Natalia Pashkova on 14.04.2023.
//

import Foundation

protocol DetailPresenterProtocol { }

class DetailPresenter:DetailPresenterProtocol  {
    weak var view: DetailViewController?

    init(view: DetailViewController) {
        self.view = view
    }
}
