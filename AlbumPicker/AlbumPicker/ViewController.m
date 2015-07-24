//
//  ViewController.m
//  AlbumPicker
//
//  Created by okwei on 15/7/23.
//  Copyright (c) 2015年 okwei. All rights reserved.
//

#import "ViewController.h"
#import "LSYAlbumPicker.h"
#import "LSYNavigationController.h"
#import "LSYAlbumCatalog.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
 
}
- (IBAction)enterAlbum:(id)sender {
    LSYNavigationController *navigation = [[LSYNavigationController alloc] initWithRootViewController:[[LSYAlbumCatalog alloc] init]];
    [navigation pushViewController:[[LSYAlbumPicker alloc] init] animated:NO];
    [self presentViewController:navigation animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
