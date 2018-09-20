package;
import flixel.FlxG;

class Level5State extends LevelState {

	override public function create():Void {
		super.create();
		initialize("Map5");
	}

	override public function update(elapsed:Float): Void {
		super.update(elapsed);
	}

	override public function win(): Void{
		Globals.level5State = 1;
		FlxG.switchState(new WinState());
	}
}
