package ;

import flash.geom.Matrix;
import flash.geom.Point;
import flash.Lib;
import sexual_tengine.sprite.ST_Sprite;
import sexual_tengine.STI;

/**
 * ...
 * @author Sean
 */
class Bullet extends ST_Sprite {
	public var timeStamp:Int;
	public function new(?_bitmap:String) {
		super(_bitmap);
		kinetics.friction = 1;
		
		timeStamp = Lib.getTimer();
		
		var style = Lib.getTimer()%3000;
		if(style >= 2000){
			this.setOrigin( -23 *0.5, -23 *0.5);
		}else if(style >= 1000){
			this.setOrigin( -53 *0.5, -23 *0.5);
		}else{
			this.setOrigin( -123 *0.5, -23 *0.5);
		}
		this.rotation = Std.random(180);
	}
	public override function update() {
		if(active){
			super.update();
			
			//kill bullets outside screen
			if (x < -50 || y < -50 || x > Lib.current.stage.stageWidth+50 || y > Lib.current.stage.stageHeight+50) {
				deactivate();
			}
			//kill bullets that have been onstage for too long
			if (Lib.getTimer() - 60000 > timeStamp) {
				deactivate();
			}
			//rotate!
			rotation += 10 * STI.corrector;
		}
	}
	
	public override function reactivate() {
		super.reactivate();
		timeStamp = Lib.getTimer();
		rotation = Std.random(180);
	}
}