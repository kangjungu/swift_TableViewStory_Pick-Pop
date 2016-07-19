//
//  AttractionTableViewController+UIViewControllerPreviewing.swift
//  TableViewStory
//
//  Created by JHJG on 2016. 7. 18..
//  Copyright © 2016년 eBookFrenzy. All rights reserved.
//

import UIKit

extension AttractionTableViewController:UIViewControllerPreviewingDelegate{
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        //테이블 뷰에서 현재 선택된행을 식별하면서 시작한다. 아무런 행도 선택되지 않았다면 nil값이 반환된다.
        guard let indexPath = tableView.indexPathForRowAtPoint(location), cell = tableView.cellForRowAtIndexPath(indexPath) else{
            return nil
        }
        //만약 테이블 뷰가 현재 선택되었다면 ,이 코드는 스토리보드 파일의 AttractionDetailViewController 화면에 대한 인스턴스를 생성하려 할 것이며, 그렇지 않다면 인스턴스를 생성할 수 없게 된다.
        guard let detailViewController = storyboard?.instantiateViewControllerWithIdentifier("AttractionDetailViewController") as? AttractionDetailViewController else {
            return nil
        }
        
        //디테일 뷰 컨트롤러의 인스턴스가 생성되었다면 웹 사이트 주소들의 배열에서의 인덱스로 현재 선택된 행을 이용하여 웹 뷰에 로드할 웹 페이지 URL로 설정한다.
        detailViewController.webSite = webAddresses[indexPath.row]
        //미리보기 뷰의 크기를 600포인트 높이로 한다. 폭은 화면의 크기와 디바이스 방향에 적절한 폭을 시스템이 선택하도록 0으로 설정한다.
        detailViewController.preferredContentSize = CGSize(width: 0.0, height: 600)

        //머세드에 전달될 미리보기 콘텍스트 객체의 sourceRect 속성은 현재 선택된 테이블 행의 셀 프레임에 설정된다. 
        //이렇게 하면 테이블 뷰의 나머지 부분이 흐릿해지는 동안에 선택된 셀의 초점이 유지되도록 할것이다. 마지막으로 디테일 뷰 컨트롤러가 사용자에게 표시될 준비가 되었음을 반환한다.
        previewingContext.sourceRect = cell.frame
        return detailViewController
    }
    
    //이 메서드가 호출되면 피크 델리게이트 메서드에서 생성되었던 디테일 뷰 컨트롤러의 참조체가 전달된다. 
    //따라서 이 메서드에서 해야 할 작업은 전달받은 디테일 뷰 컨트롤러 참조체를 가지고 현재 뷰 컨트롤러의 showViewController 메소드를 호출하는것이다.
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        showViewController(viewControllerToCommit, sender: self)
    }
}