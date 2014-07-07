//
//  NUBViewController.m
//  WebView
//
//  Created by Nicky Advokaat on 07/07/14.
//  Copyright (c) 2014 Nubis. All rights reserved.
//

#import "NUBViewController.h"
#import "WebView+Debug.h"

@interface NUBViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *addressBar;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation NUBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.webView setDelegate:self];
    
    [self.addressBar setDelegate:self];
    
    
}

- (void) setAddress:(NSString *) urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [self setAddress:[NSString stringWithFormat:@"http://www.%@",self.addressBar.text]];
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)buttonPressed:(id)sender {
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    [self.webView reload];
}

@end
