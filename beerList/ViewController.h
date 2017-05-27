//
//  ViewController.h
//  beerList
//
//  Created by Fabricio Dos Santos Rodrigues on 26/05/17.
//  Copyright © 2017 fabricio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, weak) IBOutlet UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *json;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) NSInteger indexObj;

@end

