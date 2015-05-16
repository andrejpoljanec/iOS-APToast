//
//  ViewController.m
//  APToastSampleProject
//
//  Created by Andrej Poljanec on 5/16/15.
//  Copyright (c) 2015 Andrej Poljanec. All rights reserved.
//

#import "ViewController.h"
#import "APToast.h"

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

- (IBAction)showToastAction:(id)sender {
    [[[APToast alloc] initWithParent:self.view message:@"This is a toast notification.\nThis is a toast notification."] show];
}

@end
