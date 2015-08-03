//
//  ViewController.m
//  AlbumPicker
//
//  Created by okwei on 15/7/23.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

#import "ViewController.h"
#import "LSYNavigationController.h"
#import "LSYAlbumCatalog.h"
@interface ViewController ()<LSYAlbumCatalogDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
 
}
- (IBAction)enterAlbum:(id)sender {
    LSYAlbumCatalog *albumCatalog = [[LSYAlbumCatalog alloc] init];
    albumCatalog.delegate = self;
    LSYNavigationController *navigation = [[LSYNavigationController alloc] initWithRootViewController:albumCatalog];
    albumCatalog.maximumNumberOfSelectionMedia = 5;
    [self presentViewController:navigation animated:YES completion:^{
        
    }];
}
-(void)AlbumDidFinishPick:(NSArray *)assets
{
    NSLog(@"%@",assets);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
