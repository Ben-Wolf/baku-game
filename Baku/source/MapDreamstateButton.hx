package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.ui.FlxButton;
import Globals.*;

class MapDreamstateButton extends FlxState {

	var _levelbutton:FlxSprite;
	var _leveloutline:FlxSprite;
	
	var _group:FlxGroup;
	var _showing:Bool;
	var _traded:Bool;
	
	public function new(x:Int, y:Int, traded:Bool){
		super();
		_traded = traded;
		
		//TODO: show different sprite based on returned or not
		_leveloutline = new FlxSprite(x, y);
		_leveloutline.makeGraphic(50, 50, 0xFFaa1111);
		add(_leveloutline);
		_leveloutline.alpha = 0;
		
		if(!traded){
			_levelbutton = new FlxSprite(x, y);
			_levelbutton.makeGraphic(50, 50, 0xFFaa1111);
			add(_levelbutton);
			_leveloutline.alpha = 0;
			FlxMouseEventManager.add(_levelbutton, showPrompt, null , hover, out);
			
			_showing = false;
			
			_group = new FlxGroup(3);
			var _background = new FlxSprite(x + 10, y + 70);
			_background.makeGraphic(200, 60, 0xFFAA1111);
			_group.add(_background);
			
			var _yesButton = new FlxButton(x + 20, y + 100, "Yes", trade);
			_group.add(_yesButton);
			
			var _noButton = new FlxButton(x + 120, y + 100, "No", hidePrompt);
			_group.add(_noButton);
			
			for (b in _group){
				b.exists = false;
			}
			
			add(_group);
		}
	}
	
	public function showHitbox():Void{
		_levelbutton.alpha = 1;
	}
	
	override public function create():Void {
		super.create();
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
	
	public function trade(){
		//exchange collected good fragment and change sprite to match
	}
	
	public function showPrompt(s:FlxSprite){
		if (_showing){
			for (b in _group){
				b.exists = false;
			}
			_showing = false;
		}else{
			for (b in _group){
				b.exists = true;
			}
			_showing = true;
		}
	}
	
	public function hidePrompt():Void{
		for (b in _group){
			b.exists = false;
		}
		_showing = false;
	}
	
	public function hover(s:FlxSprite){
		_leveloutline.alpha = 1;
	}
	
	public function out(s:FlxSprite){
		_leveloutline.alpha = 0;
	}
}