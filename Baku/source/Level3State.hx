package;
import flixel.FlxG;

class Level3State extends LevelState {

	override public function create():Void {
		super.create();
		initialize("Map3");
	}

	override public function update(elapsed:Float): Void {
		super.update(elapsed);
	}

	override public function win(): Void{
		Globals.level3State = 1;
		Globals.badDreams += 1;
		FlxG.switchState(new EndState(true));
	}
	
	override public function lose(): Void{
		Globals.level3State = 1;
		FlxG.switchState(new EndState(false));
	}
}
