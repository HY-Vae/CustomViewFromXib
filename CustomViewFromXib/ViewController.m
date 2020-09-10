//
//  ViewController.m
//  CustomViewFromXib
//
//  Created by iMac on 2020/9/10.
//  Copyright © 2020 iMac. All rights reserved.
//

#import "ViewController.h"
#import "MyCustomView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MyCustomView *myView;

@property (strong, nonatomic) MyCustomView *myCodeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupView];
    
}

- (void)setupView {
    
    self.myCodeView = [[MyCustomView alloc] init];
    self.myCodeView.frame = CGRectMake(0, 0, 200, 200);
    self.myCodeView.center = self.view.center;
    self.myCodeView.myLabel.text = @"哈哈哈哈";
    [self.view addSubview:self.myCodeView];
    
}

@end
