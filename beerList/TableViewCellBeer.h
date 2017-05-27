//
//  TableViewCellBeer.h
//  beerList
//
//  Created by Fabricio Dos Santos Rodrigues on 26/05/17.
//  Copyright © 2017 fabricio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCellBeer : UITableViewCell

@property(nonatomic, weak) IBOutlet UILabel *labelName, *labelTeor;
@property(nonatomic, weak) IBOutlet UIImageView *imageBeer;

@end
