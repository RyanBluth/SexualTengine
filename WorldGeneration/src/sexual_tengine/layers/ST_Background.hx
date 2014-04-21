package sexual_tengine.layers;
import flash.display.Bitmap;
import flash.display.Sprite;
import openfl.Assets;
import flash.Lib;
import sexual_tengine.STI;
/**
 * ...
 * @author ryan
 */
class ST_Background extends Sprite
{
	var bitmapOne:Bitmap;
	var bitmapTwo:Bitmap;
	public var speed:Int;
	
	public function new(_resource:String, _width:Float, _height:Float, ?_scrollable:Bool, ?_speed:Int){
		super();
		bitmapOne = new Bitmap(Assets.getBitmapData(_resource));
		//trace(_width,_height);
		/*if (bitmapOne.width < bitmapOne.height){
			bitmapOne.scaleX = _width / _height;
			bitmapOne.scaleY = bitmapOne.scaleX;
		}else {
			bitmapOne.scaleY = _height / _width;
			bitmapOne.scaleX = bitmapOne.scaleY;
		}*/
		
		if (_scrollable){
			bitmapTwo = new Bitmap(Assets.getBitmapData(_resource));
			//bitmapTwo.scaleX = bitmapTwo.scaleY = bitmapOne.scaleX;
			bitmapTwo.scaleY = bitmapOne.scaleY;
			bitmapTwo.scaleX = bitmapTwo.scaleY;
			bitmapTwo.y = -bitmapOne.height;
		}
		if(_speed != null && _speed!= 0){
			speed = _speed;
		}else{
			speed = 1;
		}
		bitmapOne.y = 0;
		addChild(bitmapOne);
		addChild(bitmapTwo);
	}
	
	public function update() {
		bitmapOne.y += speed * STI.deltaTime / 60;
		bitmapTwo.y += speed * STI.deltaTime / 60;
		if (bitmapOne.y >= bitmapOne.height) {
			bitmapOne.y = -bitmapOne.height;
		}
		if (bitmapTwo.y >= bitmapTwo.height) {
			bitmapTwo.y = -bitmapTwo.height;
		}
	}
}