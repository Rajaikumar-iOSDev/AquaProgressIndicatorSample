//
//  DynamicWaterNode.h
//  spritekit-Water-node-ios-app
//
//  Created by Astemir Eleev on 24/03/2018.
//  Copyright © 2018 Astemir Eleev. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface WaterJoint : NSObject

@property (nonatomic) CGPoint position;
@property (nonatomic) CGFloat velocity;
@property (nonatomic) CGFloat damping;
@property (nonatomic) CGFloat tension;

@end


@interface DynamicWaterNode : SKNode

/** Describes the overall look and corresponding splash effects realed to the whole node */
@property (nonatomic, strong) SKEffectNode *effectNode;
/** Describes the shape of Water that is formed by a set of paths and interconnected with each other */
@property (nonatomic, strong) SKShapeNode *shapeNode;
/** Describes intermediate joints that connect the Water surface */
@property (nonatomic, strong) NSArray<WaterJoint*> *joints;
/** Height of the Water's surface */
@property float surfaceHeight;
/** Tension the Water, shoud probably be less than damping */
@property (nonatomic) float tension;
/** Tension the Water, shoud probably be greater than damping */
@property (nonatomic) float damping;
/** Controls how fast/far waves propogate across Water surface */
@property float spread;
/** The amount of force applied to splash droplets */
@property float dropletsForce;
/** Higher values will result splahes producing more Water droplets */
@property float dropletsDensity;
/** Size of Water droplets */
@property float dropletSize;

#pragma mark - Init
/** 
 Designated Initialiser.
 @param width The width of the Water
 @param numJoints The number of joints used to simulate the waves. More joints will result in a smoother wave curve, fewer joints will look more jagged, but may may improve performance.
 @param surfaceHeight the height of the Water's surface
 @param fillColour The colour of the Water
 */
-(instancetype)initWithWidth:(float)width numJoints:(NSInteger)numJoints surfaceHeight:(float)surfaceHeight fillColour:(UIColor*)fillColour;

#pragma mark - Set Defaults
/** Reset simulation variables to defaults */
-(void)setDefaultValues;

#pragma mark - Colour
/** Set the Water colour */
-(void)setColour:(UIColor*)colour;

#pragma mark - Update

/**
 Step the time of the simulation
 */
-(void)update:(CFTimeInterval)dt;


#pragma mark - Splash
/**
 Make a splash
 */
-(void)splashAtX:(float)xLocation force:(CGFloat)force;
/**
 Make a splash
 */
-(void)splashAtX:(float)xLocation force:(CGFloat)force width:(float)width;

-(void)disturbance: (float)xLocation force:(CGFloat)force width:(float)width;

#pragma mark - Render
/**
 Render the Water. Only call this once per frame. You can still call update to update the simulation multiple times per frame (eg. fixed time-step).
 */
-(void)render;

@end
