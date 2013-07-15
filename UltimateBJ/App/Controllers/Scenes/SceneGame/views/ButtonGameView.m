//
// Created by Alexey Bulavka on 7/15/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "ButtonGameView.h"
#import "CCButton.h"
#import "SceneGame.h"


@implementation ButtonGameView
{
    CCButton *_button;

    CCTexture2D *_textureButtonNormal;
    CCTexture2D *_textureButtonActive;

}

// Designated initializer
- (id)init:(EButtonGameType)buttonType scene:(SceneGame *)scene
{
    self = [super init];

    if (self)
    {
        _buttonType = buttonType;
        NSString *_textLabel;
        switch (_buttonType)
        {
            case EBGT_DOUBLE:
            {
                _textLabel = @"DOUBLE";
                break;
            }
            case EBGT_STAND:
            {
                _textLabel = @"STAND";

                break;
            }

            case EBGT_HIT:
            {
                _textLabel = @"HIT";
                break;
            }
            case EBGT_SPLIT:
            {
                _textLabel = @"SPLIT";
                break;
            }
            case EBGT_DEAL:
            {
                _textLabel = @"DEAL";
                break;
            }
            default:
            {
                //Not implemented
                NSAssert(NO, @"Uncorrect type of button!");
                break;
            }
        }
        [self _prepare:_textLabel scene:scene];
    }

    return self;
}

- (void)_prepare :(NSString *)textLabel scene:(SceneGame *)scene
{
    _rootView = [CCNode node];

    _textureButtonNormal = [[CCTextureCache sharedTextureCache] addImage:@"buttonMenuNormal.png"];
    _textureButtonActive = [[CCTextureCache sharedTextureCache] addImage:@"buttonMenuActive.png"];

    _button = [CCButton spriteWithTexture:_textureButtonNormal];
    _button.scale = 0.2;
    _button.anchorPoint = ccp(0, 0);
    _button.delegate = self;

    [_rootView addChild:_button];

    CCLabelTTF *label = [CCLabelTTF labelWithString:textLabel
                                           fontName:@"Marker Felt"
                                           fontSize:20];

    label.position = _button.boundingBoxCenter;
    label.color = ccWHITE;
    [_rootView addChild:label];
    [scene addChild:_rootView];
}

- (void)setPosition:(CGPoint)point
{
    _rootView.position = point;
}

- (CGSize)getSize
{
    return _button.contentSize;
}

- (void)clearTextures
{
    _textureButtonNormal = nil;
    _textureButtonActive = nil;
}

- (void)didButtonTouchBegan:(CCButton *)button touch:(UITouch *)touch
{
    _button.texture = _textureButtonActive;

    switch (_buttonType)
    {
        case EBGT_DOUBLE:
        {
            break;
        }
        case EBGT_STAND:
        {
            break;
        }

        case EBGT_HIT:
        {
            break;
        }
        case EBGT_SPLIT:
        {
            break;
        }
        case EBGT_DEAL:
        {
            break;
        }
        default:
        {
            //Not implemented
            NSAssert(NO, @"Uncorrect type of button!");
            break;
        }
    }
}

- (void)didButtonTouchMoved:(CCButton *)button touch:(UITouch *)touch
{

}

- (void)didButtonTouchEnded:(CCButton *)button touch:(UITouch *)touch
{
    [self didButtonTouchEndedOrCanceled];
}

- (void)didButtonTouchCanceled:(CCButton *)button touch:(UITouch *)touch
{
    [self didButtonTouchEndedOrCanceled];

}

- (void)didButtonTouchEndedOrCanceled
{
    _button.texture = _textureButtonNormal;
}


@end