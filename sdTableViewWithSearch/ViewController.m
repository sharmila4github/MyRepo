//
//  ViewController.m
//  sdTableViewWithSearch
//
//  Created by Felix ITs 01 on 11/03/17.
//  Copyright © 2017 Felix. All rights reserved.
//

#import "ViewController.h"
#import "myTableViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchText.delegate=self;
    self.namelist=[NSArray arrayWithObjects:@"Nilam",@"Nilesh",@"Nilambari",@"Nikita", nil];
    self.phonelist=[NSArray arrayWithObjects:@"9822409989",@"9921434581",@"2344455556",@"1234567891", nil];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.resultArray.count >0)
        return self.resultArray.count;
    else
    return self.namelist.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    myTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    //cell.contentView.backgroundColor=[UIColor clearColor];
    cell.contentView.backgroundColor=self.myTableView.backgroundColor;
    NSString *name;
    if(self.resultArray.count <=0)
    {
        name=[self.namelist objectAtIndex:indexPath.row];
    }
    else
    {
        name=[self.resultArray objectAtIndex:indexPath.row];

    }
    //cell.textLabel.text=name;

  cell.nameText.text=name;
   NSString *phone=[self.phonelist objectAtIndex:indexPath.row];
    cell.phoneText.text=phone;
    return cell;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    NSString *search=textField.text;
        if(textField==self.searchText && self.searchText.text.length>0)
    {
        NSPredicate *searchPredicate=[NSPredicate predicateWithFormat:@"SELF contains[c] %@",search];
        NSLog(@"%@",searchPredicate);
       self.resultArray=[self.namelist filteredArrayUsingPredicate:searchPredicate];
        [self.myTableView reloadData];
        NSLog(@"%@",self.resultArray);
        
    
    }
    return YES;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchAction:(id)sender {
    UITextField *textField=sender;
    
    NSString *search=textField.text;
    if(textField==self.searchText && self.searchText.text.length>0)
    {
        NSPredicate *searchPredicate=[NSPredicate predicateWithFormat:@"SELF contains[c] %@",search];
        NSLog(@"%@",searchPredicate);
        self.resultArray=[self.namelist filteredArrayUsingPredicate:searchPredicate];
        [self.myTableView reloadData];
        NSLog(@"%@",self.resultArray);
        
    }
    
    
}
@end
