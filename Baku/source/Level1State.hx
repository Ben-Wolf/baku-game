package;

import flixel.FlxState;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.tile.FlxTilemap;
import flixel.tile.FlxBaseTilemap;
import flixel.FlxObject;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.text.FlxText;

class Level1State extends LevelState {

	override public function create():Void {
		super.create();
		// Setting up the map
		_map = new TiledMap("assets/data/Map1.tmx");
		_mWalls = new FlxTilemap();
		_mOuter = new FlxTilemap();
		_mFloor = new FlxTilemap();

		// Create floor
		_mFloor.loadMapFromArray(cast(_map.getLayer("floor"), TiledTileLayer).tileArray,
								_map.width, _map.height, "assets/images/walls.png",
								_map.tileWidth, _map.tileHeight, FlxTilemapAutoTiling.OFF, 1, 1, 3);
		// _mFloor.follow();
		_mFloor.setTileProperties(2, FlxObject.NONE);
		_mFloor.setTileProperties(3, FlxObject.ANY);
		add(_mFloor);

		// Create walls
		_mWalls.loadMapFromArray(cast(_map.getLayer("walls"), TiledTileLayer).tileArray,
								_map.width, _map.height, "assets/images/walls.png",
								_map.tileWidth, _map.tileHeight, FlxTilemapAutoTiling.OFF, 1, 1, 3);
		// _mWalls.follow();
		_mWalls.setTileProperties(2, FlxObject.NONE);
		_mWalls.setTileProperties(3, FlxObject.ANY);
		add(_mWalls);

		// Create outer barriers
		_mOuter.loadMapFromArray(cast(_map.getLayer("outer"), TiledTileLayer).tileArray,
								_map.width, _map.height, "assets/images/walls.png",
								_map.tileWidth, _map.tileHeight, FlxTilemapAutoTiling.OFF, 1, 1, 3);
		_mOuter.follow();
		_mOuter.setTileProperties(2, FlxObject.NONE);
		_mOuter.setTileProperties(3, FlxObject.ANY);
		add(_mOuter);

		// Initialize timer
		_time = new FlxTimer().start(45.0, dummyCallback, 1);
		_timeText = new FlxText(300, 0, 5000);
		add(_timeText);

		// Placing map entities
		_baku = new Baku();
		_spirit = new Spirit();
		var tmpMap: TiledObjectLayer = cast _map.getLayer("entities");
		for (e in tmpMap.objects) {
			placeEntities(e.name, e.xmlData.x);
		}
		add(_baku);
		add(_spirit);
		FlxG.camera.follow(_baku, TOPDOWN, 1);
	}

	override public function update(elapsed:Float): Void {
		super.update(elapsed);
	}
}
