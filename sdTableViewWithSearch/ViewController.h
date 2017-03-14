//
//  ViewController.h
//  sdTableViewWithSearch
//
//  Created by Felix ITs 01 on 11/03/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>


- (IBAction)searchAction:(id)sender;

@property NSArray *namelist;
@property NSArray *phonelist;
@property NSArray *resultArray;

@property (weak, nonatomic) IBOutlet UITextField *searchText;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;




@end

