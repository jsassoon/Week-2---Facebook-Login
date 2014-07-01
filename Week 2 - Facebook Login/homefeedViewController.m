//
//  homefeedViewController.m
//  Week 2 - Facebook Login
//
//  Created by Josh Sassoon on 6/29/14.
//  Copyright (c) 2014 youtubeux. All rights reserved.
//

#import "homefeedViewController.h"

@interface homefeedViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityLoader;
@property (weak, nonatomic) IBOutlet UIScrollView *feedscrollView;
@property (weak, nonatomic) IBOutlet UIImageView *feedView;

@end

@implementation homefeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    UIImage *leftButtonImage = [[UIImage imageNamed:@"navbarSearch"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(onLeftButton)];
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.leftBarButtonItem = leftButton;
    
    // Configure the right button
    UIImage *rightButtonImage = [[UIImage imageNamed:@"navbarMessages"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(onRightButton)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    [self.activityLoader startAnimating];
    [self performSelector:@selector(showFeed) withObject:nil afterDelay:2];
    self.feedscrollView.hidden = YES;
    
    self.feedscrollView.contentSize = CGSizeMake(320, 1025);
}

- (void) showFeed {
    [self.activityLoader stopAnimating];
    self.activityLoader.hidden = YES;
    self.feedscrollView.hidden = NO;
    [UIView animateWithDuration:.5 animations:^{
        self.feedscrollView.frame = CGRectMake(self.feedscrollView.frame.origin.x, 45, self.feedscrollView.frame.size.width, self.feedscrollView.frame.size.height);
    } completion:^(BOOL finished) {
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
