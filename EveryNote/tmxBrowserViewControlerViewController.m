//
//  tmxBrowserViewControlerViewController.m
//  EveryNote
//
//  Created by Tomasz Mozolewski on 6/24/14.
//  Copyright (c) 2014 Tomasz Mozolewski. All rights reserved.
//

#import "tmxBrowserViewControlerViewController.h"

@interface tmxBrowserViewControlerViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *urlField;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation tmxBrowserViewControlerViewController
- (IBAction)browseTo:(id)sender {
    [_urlField resignFirstResponder];
    NSURL* url = [[NSURL alloc] initWithString:_urlField.text];
    NSURLRequest* request = [[NSURLRequest alloc] initWithURL: url];
    [_webView loadRequest: request];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [self browseTo: textField];
    return YES;
}

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
    // Do any additional setup after loading the view.
    _urlField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
