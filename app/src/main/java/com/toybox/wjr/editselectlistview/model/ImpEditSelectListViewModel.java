package com.toybox.wjr.editselectlistview.model;

import com.toybox.wjr.editselectlistview.editselectlistviewinterface.IEditSelectListViewModel;
import com.toybox.wjr.editselectlistview.editselectlistviewinterface.IEditSelectListViewPresenter;

public class ImpEditSelectListViewModel implements IEditSelectListViewModel {
    private final IEditSelectListViewPresenter iEditSelectListViewPresenter;

    public ImpEditSelectListViewModel(IEditSelectListViewPresenter iEditSelectListViewPresenter) {
        this.iEditSelectListViewPresenter = iEditSelectListViewPresenter;
    }
}
