//
//  DetailsBeerViewController.h
//  beerList
//
//  Created by Fabricio Dos Santos Rodrigues on 26/05/17.
//  Copyright © 2017 fabricio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsBeerViewController : UIViewController


@property(nonatomic, weak)IBOutlet UILabel *labelName,  *labelTag, *labelTeor, *labelScale;
@property(nonatomic, weak)IBOutlet UITextView *textViewDescription;
@property(nonatomic, weak)IBOutlet UIImageView *imageBeer;
@property(nonatomic,strong)NSString *receiveName, *receiveImage, *receiveDetails, *receiveTag, *receiveTeor, *receiveScale;


@end
