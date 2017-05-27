//
//  ViewController.m
//  beerList
//
//  Created by Fabricio Dos Santos Rodrigues on 26/05/17.
//  Copyright © 2017 fabricio. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCellBeer.h"
#import "DetailsBeerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self LoadData:@"https://api.punkapi.com/v2/beers"];
    
}

-(void)LoadData: (NSString *)url {
    NSURL *urlRequest = [NSURL URLWithString:url];
    
    NSData *data = [NSData dataWithContentsOfURL: urlRequest];
    self.json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.json.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  60;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Lista de cervejas";
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    static NSString *cellIdentifier = @"CellIdentifier";
    
    TableViewCellBeer *cell = (TableViewCellBeer *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.labelName.text = [NSString stringWithFormat:@"%@",[self.json[indexPath.row] objectForKey:@"name"]];
    cell.labelTeor.text = [NSString stringWithFormat:@"Teor alcoólico: %@",[self.json[indexPath.row] objectForKey:@"abv"]];

    
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: [self.json[indexPath.row] objectForKey:@"image_url"]]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            if (cell.imageBeer.image == nil) {
                cell.imageBeer.image = [UIImage imageWithData: data];
            }
            
        });
        
    });
  
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.indexObj =  indexPath.row;
    
    self.name = [self.json[indexPath.row]objectForKey:@"name"];
    [self performSegueWithIdentifier:@"segueDetails" sender:self];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"segueDetails"]) {
        
        DetailsBeerViewController *vc = (DetailsBeerViewController *)segue.destinationViewController;
        vc.receiveName = [NSString stringWithFormat:@"%@",[self.json[self.indexObj] objectForKey:@"name"]];
        vc.receiveTeor = [NSString stringWithFormat:@"Teor alcoólico: %@",[self.json[self.indexObj] objectForKey:@"abv"]];
        vc.receiveTag = [NSString stringWithFormat:@"Tagline: %@",[self.json[self.indexObj] objectForKey:@"tagline"]];
        vc.receiveImage = [NSString stringWithFormat:@"%@",[self.json[self.indexObj] objectForKey:@"image_url"]];
        vc.receiveScale = [NSString stringWithFormat:@"Escala de amargor: %@",[self.json[self.indexObj] objectForKey:@"ibu"]];
        vc.receiveDetails = [NSString stringWithFormat:@"%@",[self.json[self.indexObj] objectForKey:@"description"]];

   }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
