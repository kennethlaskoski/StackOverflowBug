//
//  SBViewController.m
//  SubtleBug
//
//  Created by Kenneth Laskoski on 08/09/13.
//  Copyright (c) 2013 Tractrix. All rights reserved.
//

#import "SBViewController.h"

const int a = 1024;
const int s = a*a;

int l(int i, int j)
{
    return i*a + j;
}

int m(int l)
{
    return l/a;
}

int n(int l)
{
    return l%a;
}

@interface SBViewController ()
{
    int data[s];
}

@property (weak, nonatomic) IBOutlet UITextField *first;
@property (weak, nonatomic) IBOutlet UITextField *second;
@property (weak, nonatomic) IBOutlet UILabel *result;

@end

@implementation SBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    for (int i = 0; i < a; ++i)
        for (int j = 0; j < a; ++j)
        {
            int k = l(i,j);
            data[k] = -k;
        }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)run:(id)sender
{
    int i = [self.first.text intValue];
    int j = [self.second.text intValue];
    if ((i < 0 || i >= a) || (j < 0 || j >= a))
        NSLog(@"undefined behavior...");
    int k = l(i,j);
    int local[s];
    local[k] = -data[k];
    NSString *output = @"placeholder...";
    output = [NSString stringWithFormat:@"%d %d %d %d %d", m(k), n(k), k, data[k], local[k]];
    NSLog(@"%@", output);
    self.result.text = output;
}

@end
