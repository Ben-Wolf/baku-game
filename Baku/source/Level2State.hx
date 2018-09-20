package;

class Level2State extends LevelState {

	override public function create():Void {
		super.create();
        trace("IN LEVEL 2 STATE");
		initialize("Map2");
	}

	override public function update(elapsed:Float): Void {
		super.update(elapsed);
	}
}
