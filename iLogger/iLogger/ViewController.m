//
//  ViewController.m
//  iLogger
//
//  Created by Rajesh on 3/23/15.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end


@interface LoggerViewController ()
@property (weak, nonatomic) IBOutlet UITextView *txtVwLogs;

@end


@implementation LoggerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.txtVwLogs setText:[[iLogger sharedLogger] getLogs]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)doneTapped:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)deleteTapped:(id)sender
{
    [[iLogger sharedLogger] deleteLogs];
    [self.txtVwLogs setText:[[iLogger sharedLogger] getLogs]];
}
@end