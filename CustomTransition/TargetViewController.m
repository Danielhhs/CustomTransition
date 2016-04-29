//
//  TargetViewController.m
//  CustomTransition
//
//  Created by Huang Hongsen on 4/28/16.
//  Copyright © 2016 cn.daniel. All rights reserved.
//

#import "TargetViewController.h"

@interface TargetViewController ()

@end

@implementation TargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"1.jpg"];
    [self.view addSubview:imageView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [button setTitle:@"Backward" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(handleDismiss) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view.
}

- (void) handleDismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"dst view controller view will appear");
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"dst view controller view did appear");
}

- (void) viewWillDisappear:(BOOL)animated
{
    NSLog(@"dst view controller view will disappear");
    [super viewWillDisappear:animated];
}

- (void) viewDidDisappear:(BOOL)animated
{
    NSLog(@"dst view controller view did disappear");
    [super viewDidDisappear:animated];
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
