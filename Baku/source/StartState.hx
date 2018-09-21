package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import flixel.system.FlxSound;

class StartState extends FlxState {

	var _startButton: MapButton;
	var _backdrop: FlxSprite;

	override public function create():Void {
		super.create();
		bgColor = 0xFF111111;
		_backdrop = new FlxSprite(0, 0);
		_backdrop.loadGraphic("assets/images/titleScreen.png", true, 800, 620);
		
		_startButton = new MapButton(315, 538, "assets/images/startoutline.png", "MapState");
		_startButton.addRelativeHitbox(1, 1, 143, 43);
		
		add(_backdrop);
		add(_startButton);
		FlxG.sound.playMusic(AssetPaths.BakuTheme__ogg);
	}
	
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}