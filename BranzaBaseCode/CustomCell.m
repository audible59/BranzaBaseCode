//
//  CustomCell.m
//  BranzaBaseCode
//
//  Created by Kevin E. Rafferty II on 11/24/12.
//  Copyright (c) 2012 Branza. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize leftLabel  = _leftLabel;
@synthesize rightLabel = _rightLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if(self)
    {
        //left side
        self.leftLabel                 = [[UILabel alloc] init];
        self.leftLabel.frame           = CGRectMake(80, 30, 100, 20);
        self.leftLabel.font            = [UIFont boldSystemFontOfSize:14];
        self.leftLabel.backgroundColor = [UIColor clearColor];
        
        // right side
        self.rightLabel                 = [[UILabel alloc] init];
        self.rightLabel.frame           = CGRectMake(200, 30, 100, 20);
        self.rightLabel.font            = [UIFont boldSystemFontOfSize:12];
        self.rightLabel.backgroundColor = [UIColor clearColor];
        
        // add the left and right labels
        [self.contentView addSubview:self.leftLabel];
        [self.contentView addSubview:self.rightLabel];

    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
