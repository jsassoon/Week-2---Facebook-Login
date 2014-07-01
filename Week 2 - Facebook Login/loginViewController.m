//
//  loginViewController.m
//  Week 2 - Facebook Login
//
//  Created by Josh Sassoon on 6/29/14.
//  Copyright (c) 2014 youtubeux. All rights reserved.
//

#import "loginViewController.h"
#import "homefeedViewController.h"

@interface loginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UIImageView *loginForm;

@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;

- (IBAction)onEditChange:(id)sender;

- (IBAction)userNameField:(id)sender;
- (IBAction)passwordField:(id)sender;
- (IBAction)loginButton:(id)sender;

@end

@implementation loginViewController

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
    self.loginButton.enabled = NO;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onEditChange:(id)sender {
    if ([self.usernameField.text isEqual: @""] && [self.passwordField.text isEqual: @""]) {
        self.loginButton.enabled = NO;
    } else {
        self.loginButton.enabled = YES;
        
    }
}

- (IBAction)userNameField:(id)sender {
    [self moveElementsUp];
}

- (IBAction)passwordField:(id)sender {
    [self moveElementsUp];
}

- (IBAction)loginButton:(id)sender {
    self.loginButton.enabled = NO;
    [self.loadingView startAnimating];
    [self performSelector:@selector(loginValidation) withObject:nil afterDelay:2];
}

- (void)loginValidation {
    [self.loadingView stopAnimating];
    self.loginButton.enabled = YES;
    if ([self.usernameField.text isEqual:@"email@gmail.com"])
    {
        homefeedViewController *homeVC = [[homefeedViewController alloc] init];
        UINavigationController *homeNC = [[UINavigationController alloc] initWithRootViewController:homeVC];
        homeNC.navigationItem.title = @"News Feed";
        homeNC.navigationBar.barTintColor = [UIColor colorWithRed:(59/255.0) green:(89/255.0) blue:(152/255.0) alpha:1];
        homeNC.navigationBar.translucent = NO;
        homeNC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        [self presentViewController:homeNC animated:YES completion:nil];
        

    } else {
        [self.view endEditing:YES];
        UIAlertView *errorAlert = [[UIAlertView alloc]
        initWithTitle:@"You were wrong!" message:@"blah blah blah yackadeee schmackadeee" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [errorAlert show];
        
        [self moveElementsDown];
    }

}

- (void)moveElementsDown {
    [UIView animateWithDuration:.2 animations:^{
        self.logo.frame = CGRectMake(self.logo.frame.origin.x, 140, self.logo.frame.size.width, self.logo.frame.size.height);
        
        self.loginForm.frame = CGRectMake(self.loginForm.frame.origin.x, 220, self.loginForm.frame.size.width, self.loginForm.frame.size.height);
        
        self.usernameField.frame = CGRectMake(self.usernameField.frame.origin.x, 230, self.usernameField.frame.size.width, self.usernameField.frame.size.height);
        
        self.passwordField.frame = CGRectMake(self.passwordField.frame.origin.x, 275, self.passwordField.frame.size.width, self.passwordField.frame.size.height);
        
        self.loginButton.frame = CGRectMake(self.loginButton.frame.origin.x, 330, self.loginButton.frame.size.width, self.loginButton.frame.size.height);
        
        self.loadingView.frame = CGRectMake(self.loadingView.frame.origin.x, 337, self.loadingView.frame.size.width, self.loadingView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];

}

- (void)moveElementsUp {
    [UIView animateWithDuration:.2 animations:^{
        self.logo.frame = CGRectMake(self.logo.frame.origin.x, 50, self.logo.frame.size.width, self.logo.frame.size.height);
        
        self.loginForm.frame = CGRectMake(self.loginForm.frame.origin.x, 130, self.loginForm.frame.size.width, self.loginForm.frame.size.height);
        
        self.usernameField.frame = CGRectMake(self.usernameField.frame.origin.x, 140, self.usernameField.frame.size.width, self.usernameField.frame.size.height);
        
        self.passwordField.frame = CGRectMake(self.passwordField.frame.origin.x, 185, self.passwordField.frame.size.width, self.passwordField.frame.size.height);
        
        self.loginButton.frame = CGRectMake(self.loginButton.frame.origin.x, 240, self.loginButton.frame.size.width, self.loginButton.frame.size.height);
        
        self.loadingView.frame = CGRectMake(self.loadingView.frame.origin.x, 247, self.loadingView.frame.size.width, self.loadingView.frame.size.height);
    } completion:^(BOOL finished) {
        
    }];
}

@end
