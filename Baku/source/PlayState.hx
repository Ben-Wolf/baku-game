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

class PlayState extends FlxState {
	var _baku: Baku;
	var _spirit: Spirit;
	var _map: TiledMap;
	var _mWalls: FlxTilemap;

	override public function create():Void {
		super.create();
		// Setting up the map
		_map = new TiledMap("assets/data/testmap.tmx");
		_mWalls = new FlxTilemap();
		_mWalls.loadMapFromArray(cast(_map.getLayer("Walls"), TiledTileLayer).tileArray,
								_map.width, _map.height, "assets/images/tiles-temp.png",
								_map.tileWidth, _map.tileHeight, FlxTilemapAutoTiling.OFF, 1, 1, 3);
		_mWalls.follow();
		_mWalls.setTileProperties(2, FlxObject.NONE);
		_mWalls.setTileProperties(3, FlxObject.ANY);
		add(_mWalls);
		// Placing map entities
		_baku = new Baku();
		_spirit = new Spirit();
		var tmpMap: TiledObjectLayer = cast _map.getLayer("Entities");
		for (e in tmpMap.objects) {
			placeEntities(e.name, e.xmlData.x);
		}
		add(_baku);
		add(_spirit);
		FlxG.camera.follow(_baku, TOPDOWN, 1);
	}

	private function placeEntities(name: String, data: Xml): Void {
		var x: Int = Std.parseInt(data.get("x"));
		var y: Int = Std.parseInt(data.get("y"));
		if (name == "baku") {
			_baku.x = x;
			_baku.y = y;
		} else if (name == "spirit") {
			_spirit.x = x;
			_spirit.y = y;
		}
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		if (FlxG.keys.anyPressed([FlxKey.SPACE])) {
			_baku.sucking = true;
			FlxG.collide(_spirit, _baku);
		} else {
			_baku.sucking = false;
		}
		FlxG.collide(_baku, _mWalls);
	}
}
