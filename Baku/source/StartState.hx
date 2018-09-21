package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.system.FlxSound;

class StartState extends FlxState {

	var _startButton:FlxButton;

	override public function create():Void {
		super.create();
		bgColor = 0xFF111111;
		var _welcomeText = new flixel.text.FlxText(0, 0, 0, "Baku", 64);
		var _startButton = new FlxButton(280, 300, "Start", start);
		_welcomeText.screenCenter();
		add(_welcomeText);
		add(_startButton);
		FlxG.sound.playMusic(AssetPaths.BakuTheme__ogg);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}

	private function start():Void {
		// TODO: Switch this to new MapState
		FlxG.switchState(new MapState());
	}
}
