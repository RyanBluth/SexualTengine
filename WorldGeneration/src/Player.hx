package;
import openfl.Lib;
import sexual_tengine.sprite.ST_SuperSprite;
import sexual_tengine.sprite.ST_Sprite;
import sexual_tengine.STI;
/**
 * ...
 * @author ryan
 */
class Player extends ST_SuperSprite {
	public var shotTimerTotal:Float = 60;
	public var shotTimerElapsed:Float = 100;
	
	public var playerFire:ST_Sprite;
	public var playerBody:ST_Sprite;
	public function new() {
		super();
		
		kinetics.friction = 0.9;
		this.x = (Lib.current.stage.stageWidth - 85)*0.5;
		this.y = Lib.current.stage.stageHeight - 100 * 2;
		playerFire = new ST_Sprite();
		playerFire.setOrigin(-85*0.5,-100*0.5);
		playerFire.animation.addSpriteSheet("img/player.png", "main", true);
		playerFire.animation.addAnimationState("main", "main", [1, 2, 3, 4], 5, 85, 100, true);
		playerFire.animation.playAnimation(0, "main");
		playerFire.circleColliderRadius = 100 *0.5;
		
		playerBody = new ST_Sprite();
		playerBody.setOrigin(-85 *0.5,-100*0.5);
		playerBody.animation.addSpriteSheet("img/player.png", "main", true);
		playerBody.animation.addAnimationState("main", "main", [0], 5, 85, 100, true);
		playerBody.circleColliderRadius = 100 *0.5;
		
		addSpriteChild("playerFire", playerFire);
		addSpriteChild("playerBody", playerBody);
	}
	
	override public function update():Void {
		super.update();
		
		shotTimerElapsed += STI.corrector;
	}
}