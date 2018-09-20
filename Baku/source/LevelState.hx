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

// This state holds all the universal level functionality
class LevelState extends FlxState {
	var _baku: Baku;
	var _suck: Suck = null;
	var _spirit: Spirit;
	var _map: TiledMap;
	var _mWalls: FlxTilemap;
	var _mOuter: FlxTilemap;
	var _mFloor: FlxTilemap;
	var _time: FlxTimer;
	var _timeText: FlxText;

	override public function update(elapsed:Float): Void {
		super.update(elapsed);
		displayTime(_time.timeLeft);
		if (_time.finished) {
			// FlxG.switchState(LoseState());
		}
		if (FlxG.keys.anyPressed([FlxKey.SPACE])) {
			_baku.sucking = true;
			if (_suck == null) {
				suck();
			}
			FlxG.overlap(_suck, _spirit, suckSpirit);
		} else {
			if (_suck != null) {
				_suck.kill();
				_suck = null;
			}
			_baku.sucking = false;
		}
		FlxG.collide(_baku, _mOuter);
		FlxG.collide(_spirit, _mOuter);
		FlxG.collide(_baku, _mWalls);
	}

	private function initialize(Map: String): Void {
		// Setting up the map
		_map = new TiledMap("assets/data/" + Map + ".tmx");
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

	private function suck(): Void {
		var addY: Float = 0;
		var addX: Float = 0;
		var l: Int = 16;
		var w: Int = 16;

		if (_baku.facing == FlxObject.UP) {
			addY = -32;
			w += 16;
		} else if (_baku.facing == FlxObject.DOWN) {
			addY = 16;
			w += 16;
		} else if (_baku.facing == FlxObject.LEFT) {
			addX = -32;
			l += 16;
		} else if (_baku.facing == FlxObject.RIGHT) {
			addX = 16;
			l += 16;
		}

		_suck = new Suck(_baku.x + addX, _baku.y + addY, l, w);
		add(_suck);
	}

	private function displayTime(T: Float): Void {
		var ttime: Float = T;
		var seconds: Int = Math.round(T);
		var ms: Int = Math.round(ttime * 100 - seconds * 100);
		if (ms < 0) {
			seconds -= 1;
			ms = ms * -1;
		}
		_timeText.text = '00:' + seconds + ':' + ms;
	}

	private function dummyCallback(Timer:FlxTimer): Void {
	}

	private function suckSpirit(S: Suck, Sp: Spirit): Void {
		Sp.kill();
		win();
	}
	
	private function win():Void{
		
	}
}
