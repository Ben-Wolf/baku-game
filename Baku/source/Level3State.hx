package;

class Level3State extends LevelState {

	override public function create():Void {
		super.create();
        trace("IN LEVEL 3 STATE");
		initialize("Map3");
	}

	override public function update(elapsed:Float): Void {
		super.update(elapsed);
	}
}
