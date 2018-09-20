package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.input.mouse.FlxMouseEventManager;
import Globals.*;

class MapState extends FlxState {
	var _fountainButton:MapButton;
	var _level1button:MapButton;
	var _level2button:MapButton;
	var _level3button:MapButton;
	var _level4button:MapButton;
	var _level5button:MapButton;
	var _level1Dbutton:MapDreamstateButton;
	var _level2Dbutton:MapDreamstateButton;
	var _level3Dbutton:MapDreamstateButton;
	var _level4Dbutton:MapDreamstateButton;
	var _level5Dbutton:MapDreamstateButton;
	var _exitbutton:ExitButton;
	override public function create():Void {
		super.create();

		var _backdrop = new FlxSprite(0, 0);
		_backdrop.loadGraphic("assets/images/map.png");
		add(_backdrop);

		bgColor = 0xFF546e99;

		Globals.level1State = 1;
		Globals.level2State = 2;
		Globals.goodDreams = 1;
		Globals.badDreams = 1;

		var _shards = new ShardsUI();
		add(_shards);

		_fountainButton = new MapButton(391, 295, "assets/images/fountainoutline.png", "FountainState");
		_fountainButton.addRelativeHitbox(-10, -10, 85, 60);
		_fountainButton.showHitbox();
		add(_fountainButton);

		if (Globals.level1State == 0){
			_level1button = new MapButton(348, 73, "assets/images/level1outline.png" , "Level1State");
			_level1button.addRelativeHitbox(0, 0, 150, 90);
			_level1button.showHitbox();
			add(_level1button);
		}
		_level1Dbutton = new MapDreamstateButton(348, 73, 1, Globals.level1State);
		add(_level1Dbutton);

		if (Globals.level2State == 0){
			_level2button = new MapButton(156, 94, "assets/images/level2outline.png" , "Level2State");
			_level2button.addRelativeHitbox(0, 40, 150, 60);
			_level2button.addRelativeHitbox(50, 0, 100, 150);
			_level2button.showHitbox();
			add(_level2button);
		}
		_level2Dbutton = new MapDreamstateButton(156, 94, 2, Globals.level2State);
		add(_level2Dbutton);

		if (Globals.level3State == 0){
			_level3button = new MapButton(175, 292, "assets/images/level3outline.png" , "Level1State");
			_level3button.addRelativeHitbox(25, 0, 55, 45);
			_level3button.addRelativeHitbox(0, 45, 88, 100);
			_level3button.showHitbox();
			add(_level3button);
		}
		_level3Dbutton = new MapDreamstateButton(175, 292, 3, Globals.level3State);
		add(_level3Dbutton);

		if (Globals.level4State == 0){
			_level4button = new MapButton(352, 452, "assets/images/level4outline.png" , "Level4State");
			_level4button.addRelativeHitbox(0, 5, 140, 80);
			_level4button.showHitbox();
			add(_level4button);
		}
		_level4Dbutton = new MapDreamstateButton(352, 452, 4, Globals.level4State);
		add(_level4Dbutton);

		if (Globals.level5State == 0){
			_level5button = new MapButton(561, 424, "assets/images/level5outline.png" , "Level5State");
			_level5button.addRelativeHitbox(0, 5, 75, 85);
			_level5button.showHitbox();
			add(_level5button);
		}
		_level5Dbutton = new MapDreamstateButton(561, 424, 5, Globals.level5State);
		add(_level5Dbutton);


		_exitbutton = new ExitButton(0.5);
		add(_exitbutton);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
}

//add button to fountain
//repurpose buttons for returning dream fragments
