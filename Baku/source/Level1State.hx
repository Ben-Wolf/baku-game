package;
import flixel.FlxG;

class Level1State extends LevelState {

	override public function create():Void {
		super.create();
        initialize("Map1");
	}

	override public function update(elapsed:Float): Void {
		super.update(elapsed);
	}

	override public function win(): Void{
		Globals.level1State = 1;
		Globals.badDreams += 1;
		FlxG.switchState(new EndState(true));
	}
	
	override public function lose(): Void{
		Globals.level1State = 1;
		FlxG.switchState(new EndState(false));
	}
}
