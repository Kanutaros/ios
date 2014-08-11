//
//  Bullet.m
//  shmup
//
//  Created by Yuya Takeuchi on 2014/04/21.
//  Copyright (c) 2014年 Yuya Takeuchi. All rights reserved.
//

#import "Bullet.h"
#import "MyScene.h"

@implementation Bullet

-(Bullet*)init:(float)radius andPosition:(CGPoint)pos withSpeed:(CGVector)speed andDecay:(float)decayinit{
    self = [super initWithColor:[UIColor greenColor] size:CGSizeMake(radius, radius)];
    self.position = pos;
    self.zPosition = 2;
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
    self.physicsBody.velocity = speed;
    self.physicsBody.linearDamping = 0;
    self.decay = decayinit;
    
    self.physicsBody.categoryBitMask = bulletCategory;
    self.physicsBody.contactTestBitMask = 0;
    
    [self runAction:[SKAction sequence:@[[SKAction waitForDuration:self.decay],[SKAction runBlock:^{[self removeFromParent];}]]]];
    
    return self;
}

@end
