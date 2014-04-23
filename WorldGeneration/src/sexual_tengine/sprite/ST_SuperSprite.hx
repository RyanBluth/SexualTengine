package sexual_tengine.sprite;

import sexual_tengine.sprite.ST_Detachment;
import sexual_tengine.animation.ST_SpriteSheet;
/**
 * ...
 * @author ryan
 */
class ST_SuperSprite extends ST_Detachment
{
	public var layers:Array<String>;
	public var spriteChildren:Map<String,ST_Sprite>;
	
	public function new() {
		super();
		spriteChildren = new Map();
		layers = new Array();
	}
	
	public function addSpriteChild(_name:String, _sprite:ST_Sprite) {
		spriteChildren.set(_name, _sprite);
		addChild(spriteChildren.get(_name));
		layers.push(_name);
	}
	
	public function getSpriteChild(_name:String):ST_Sprite{
		return spriteChildren.get(_name);
	}
	
	public override function update() {
		if(active){
			super.update();
			for (i in layers) {
				spriteChildren.get(i).update();
				spriteChildren.get(i).animation.draw();
			}
		}
	}
	
	public function draw() {
		if(active){
			for (i in layers) {
				spriteChildren.get(i).draw();
			}
		}
	}
	
	override public function deactivate() {
		super.deactivate();
		for (i in layers) {
			spriteChildren.get(i).deactivate();
		}
	}
	
	override public function reactivate() {
		super.reactivate();
		for (i in layers) {
			spriteChildren.get(i).reactivate();
		}
	}
}