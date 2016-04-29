//
//  ViewController.m
//  CustomTransition
//
//  Created by Huang Hongsen on 4/28/16.
//  Copyright © 2016 cn.daniel. All rights reserved.
//

#import "ViewController.h"
#import "TargetViewController.h"
#import "TransitioningDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"src view controller view will appear");
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"src view controller view did appear");
}

- (void) viewWillDisappear:(BOOL)animated
{
    NSLog(@"src view controller view will disappear");
    [super viewWillDisappear:animated];
}

- (void) viewDidDisappear:(BOOL)animated
{
    NSLog(@"src view controller view did disappear");
    [super viewDidDisappear:animated];
}

- (void) beginAppearanceTransition:(BOOL)isAppearing animated:(BOOL)animated
{
    NSLog(@"src view controller view Begin Appearance Transition");
}

- (void) endAppearanceTransition
{
    NSLog(@"src view controller view End Appearance Transition");
}

- (IBAction)transit:(id)sender {
    TargetViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TargetViewController"];
    vc.modalPresentationStyle = UIModalPresentationCustom;
    vc.transitioningDelegate = [TransitioningDelegate generalDelegate];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
