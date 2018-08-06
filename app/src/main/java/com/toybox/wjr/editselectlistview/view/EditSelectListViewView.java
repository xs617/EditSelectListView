package com.toybox.wjr.editselectlistview.view;

import com.toybox.wjr.editselectlistview.editselectlistviewinterface.IEditSelectListViewPresenter;
import com.toybox.wjr.editselectlistview.editselectlistviewinterface.IEditSelectListViewView;
import com.toybox.wjr.editselectlistview.presenter.ImpEditSelectListViewPresenter;

public class EditSelectListViewView implements IEditSelectListViewView{
    private final IEditSelectListViewPresenter iEditSelectListViewPresenter = new ImpEditSelectListViewPresenter(this);

}
