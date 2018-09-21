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
import flixel.system.FlxSound;

// This state holds all the universal level functionality
class LevelState extends FlxState {
	var _baku: Baku;
	var _suck: Suck = null;
	var _spirit1: Spirit;
	var _spirit2: Spirit;
	var _spirit3: Spirit;
	var sp1: Bool = true;
	var sp2: Bool = true;
	var sp3: Bool = true;
	var _soundSuckUp: FlxSound;
	var _soundSuckLoop: FlxSound;
	var _soundSuckDown: FlxSound;
	var _map: TiledMap;
	var _mWalls: FlxTilemap;
	var _mSafety: FlxTilemap;
	var _mOuter: FlxTilemap;
	var _mFloor: FlxTilemap;
	var _time: FlxTimer;
	var _timeText: FlxText;

	override public function update(elapsed:Float): Void {
		super.update(elapsed);
		displayTime(_time.timeLeft);
		if (_time.finished) {
			lose();
		}
		if (FlxG.keys.anyPressed([FlxKey.SPACE])) {
			_baku.sucking = true;
			_baku.suckboi(FlxG.keys.justPressed.SPACE);

			if (_suck == null) {
				suck();
				_soundSuckUp.play();
			} else {
			_soundSuckLoop.play();
			}
			FlxG.overlap(_suck, _spirit1, suckSpirit);
			FlxG.overlap(_suck, _spirit2, suckSpirit);
			FlxG.overlap(_suck, _spirit3, suckSpirit);
		} else {
			if (_suck != null) {
				_suck.kill();
				_suck = null;
				_soundSuckDown.play();
			}
			_baku.sucking = false;
		}

		FlxG.collide(_spirit1, _mOuter);
		FlxG.collide(_spirit2, _mOuter);
		FlxG.collide(_spirit3, _mOuter);
		FlxG.collide(_baku, _mSafety);
		FlxG.collide(_baku, _mOuter);
		FlxG.collide(_baku, _mWalls);
	}

	private function initialize(Map: String): Void {
		// Setting up the map
		_map = new TiledMap("assets/data/" + Map + ".tmx");
		_mWalls = new FlxTilemap();
		_mSafety = new FlxTilemap();
		_mOuter = new FlxTilemap();
		_mFloor = new FlxTilemap();

		// Implement safety barrier layer
		_mSafety.loadMapFromArray(cast(_map.getLayer("safety"), TiledTileLayer).tileArray,
								_map.width, _map.height, "assets/images/walls.png",
								_map.tileWidth, _map.tileHeight, FlxTilemapAutoTiling.OFF, 1, 1, 3);
		_mSafety.setTileProperties(2, FlxObject.NONE);
		_mSafety.setTileProperties(26, FlxObject.ANY);

		// Create outer barriers
		_mOuter.loadMapFromArray(cast(_map.getLayer("outer"), TiledTileLayer).tileArray,
								_map.width, _map.height, "assets/images/walls.png",
								_map.tileWidth, _map.tileHeight, FlxTilemapAutoTiling.OFF, 1, 1, 3);
		_mOuter.follow();
		_mOuter.setTileProperties(23, FlxObject.ANY);
		_mOuter.setTileProperties(24, FlxObject.ANY);
		_mOuter.setTileProperties(1, FlxObject.ANY);

		// Create floor
		_mFloor.loadMapFromArray(cast(_map.getLayer("floor"), TiledTileLayer).tileArray,
								_map.width, _map.height, "assets/images/walls.png",
								_map.tileWidth, _map.tileHeight, FlxTilemapAutoTiling.OFF, 1, 1, 3);
		// _mFloor.follow();

		// Create walls
		_mWalls.loadMapFromArray(cast(_map.getLayer("walls"), TiledTileLayer).tileArray,
								_map.width, _map.height, "assets/images/walls.png",
								_map.tileWidth, _map.tileHeight, FlxTilemapAutoTiling.OFF, 1, 1, 3);
		// _mWalls.follow();
		add(_mFloor);
		add(_mSafety);
		add(_mWalls);
		add(_mOuter);

		// Initialize timer
		_time = new FlxTimer().start(45.0, dummyCallback, 1);
		_timeText = new FlxText(300, 0, 5000);
		add(_timeText);

		// Placing map entities
		_baku = new Baku();
		_spirit1 = new Spirit();
		_spirit2 = new Spirit();
		_spirit3 = new Spirit();
		var tmpMap: TiledObjectLayer = cast _map.getLayer("entities");
		for (e in tmpMap.objects) {
			placeEntities(e.name, e.xmlData.x);
		}
		add(_baku);
		add(_spirit1);
		add(_spirit2);
		add(_spirit3);
		FlxG.camera.follow(_baku, TOPDOWN, 1);
		_soundSuckUp = FlxG.sound.load(AssetPaths.suck_0__wav);
		_soundSuckLoop = FlxG.sound.load(AssetPaths.suck_1__wav);
		_soundSuckDown = FlxG.sound.load(AssetPaths.suck_2__wav);
		FlxG.sound.playMusic(AssetPaths.BakuThemeWarped__ogg);
	}

	private function placeEntities(name: String, data: Xml): Void {
		var x: Int = Std.parseInt(data.get("x"));
		var y: Int = Std.parseInt(data.get("y"));
		if (name == "baku") {
			_baku.x = x;
			_baku.y = y;
		} else if (name == "spirit1") {
			_spirit1.x = x;
			_spirit1.y = y;
			_spirit1.speed = 200;
		} else if (name == "spirit2") {
			_spirit2.x = x;
			_spirit2.y = y;
		} else if (name == "spirit3") {
			_spirit3.x = x;
			_spirit3.y = y;
			_spirit3.speed = 650;
		}
	}

	private function suck(): Void {
		var addY: Float = 0;
		var addX: Float = 0;
		var l: Int = 36;
		var w: Int = 36;

		if (_baku.facing == FlxObject.UP) {
			addY = -32;
			w += 16;
			_suck = new Suck(_baku.x + addX, _baku.y + addY, l, w);
			add(_suck);
			_suck.up();
		} else if (_baku.facing == FlxObject.DOWN) {
			addY = 32;
			w += 16;
			_suck = new Suck(_baku.x + addX, _baku.y + addY, l, w);
			add(_suck);
			_suck.down();
		} else if (_baku.facing == FlxObject.LEFT) {
			addX = -32;
			l += 16;
			_suck = new Suck(_baku.x + addX, _baku.y + addY, l, w);
			add(_suck);
			_suck.left();
		} else if (_baku.facing == FlxObject.RIGHT) {
			addX = 32;
			l += 16;
			_suck = new Suck(_baku.x + addX, _baku.y + addY, l, w);
			add(_suck);
			_suck.right();
		}
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
		if (_spirit1 == Sp) {
			sp1 = false;
		}
		if (Sp == _spirit2) {
			sp2 = false;
		}
		if (Sp == _spirit3) {
			sp3 = false;
		}
		if (!(sp1 || sp2 || sp3)) {
			win();
		}
	}

	private function win():Void{

	}
	private function lose():Void{

	}
}
