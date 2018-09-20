package;

class Level1State extends LevelState {

	override public function create():Void {
		super.create();
        trace("IN LEVEL 1 STATE");
        initialize("Map1");
	}

	override public function update(elapsed:Float): Void {
		super.update(elapsed);
	}
}
