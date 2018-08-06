package com.toybox.wjr.editselectlistview.presenter;

import com.toybox.wjr.editselectlistview.editselectlistviewinterface.IEditSelectListViewModel;
import com.toybox.wjr.editselectlistview.editselectlistviewinterface.IEditSelectListViewPresenter;
import com.toybox.wjr.editselectlistview.editselectlistviewinterface.IEditSelectListViewView;
import com.toybox.wjr.editselectlistview.model.ImpEditSelectListViewModel;

public class ImpEditSelectListViewPresenter implements IEditSelectListViewPresenter {
    private final IEditSelectListViewModel iEditSelectListViewModel = new ImpEditSelectListViewModel(this);
    private final IEditSelectListViewView iEditSelectListViewView;

    public ImpEditSelectListViewPresenter(IEditSelectListViewView iEditSelectListViewView) {
        this.iEditSelectListViewView = iEditSelectListViewView;
    }
}
