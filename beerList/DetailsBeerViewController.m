//
//  DetailsBeerViewController.m
//  beerList
//
//  Created by Fabricio Dos Santos Rodrigues on 26/05/17.
//  Copyright © 2017 fabricio. All rights reserved.
//

#import "DetailsBeerViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface DetailsBeerViewController ()

@end

@implementation DetailsBeerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",self.receiveDetails);
    NSLog(@"%@",self.receiveScale);
    NSLog(@"%@",self.receiveImage);
    NSLog(@"%@",self.receiveTag);
    NSLog(@"%@",self.receiveTeor);
    NSLog(@"%@",self.receiveName);
    
    self.labelName.text = self.receiveName;
    self.labelTag.text = self.receiveTag;
    self.labelTeor.text = self.receiveTeor;
    self.labelScale.text = self.receiveScale;
    self.textViewDescription.text = self.receiveDetails;
    self.textViewDescription.layer.cornerRadius = 1;
    self.imageBeer.backgroundColor = [UIColor whiteColor];
    self.imageBeer.layer.cornerRadius = 5;
    
    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: self.receiveImage]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.imageBeer.image = [UIImage imageWithData:data];
            
        });
        
    });
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
