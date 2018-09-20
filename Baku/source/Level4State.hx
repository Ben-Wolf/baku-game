package;
import flixel.FlxG;

class Level4State extends LevelState {

	override public function create():Void {
		super.create();
		initialize("Map4");
	}

	override public function update(elapsed:Float): Void {
		super.update(elapsed);
	}
	
	override public function win():Void{
		Globals.level4State = 1;
		FlxG.switchState(new WinState());
	}
}
