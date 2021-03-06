package;
import flixel.FlxG;

class Level2State extends LevelState {

	override public function create():Void {
		super.create();
		initialize("Map2");
	}

	override public function update(elapsed:Float): Void {
		super.update(elapsed);
	}

	override public function win(): Void{
		Globals.level2State = 1;
		Globals.badDreams += 1;
		FlxG.switchState(new EndState(true));
	}
	
	override public function lose(): Void{
		Globals.level2State = 1;
		FlxG.switchState(new EndState(false));
	}
}
