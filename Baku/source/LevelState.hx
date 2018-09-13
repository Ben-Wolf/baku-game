package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
class LevelState extends FlxState
{
	public var level:TiledLevel;
	
	public var player:FlxSprite;
	
	override public function create():Void
	{
		super.create();
		bgColor = 0xffaaaaaa;
		
		level = new TiledLevel("assets/tilemaps/newLevel.tmx", this);
		
		// Add backgrounds
		add(level.backgroundLayer);
		
		// Add static images
		add(level.imagesLayer);
		
		// Load objects layer
		add(level.objectsLayer);
		
		// Add foreground tiles after adding level objects, so these tiles render on top of player
		add(level.foregroundTiles);
	}

	override public function update(elapsed:Float):Void 
	{
		player.acceleration.x = 0;
		player.acceleration.y = 0;
		if (FlxG.keys.anyPressed([LEFT, A]))
		{
			player.acceleration.x -= player.maxVelocity.x * 4;
		}
		if (FlxG.keys.anyPressed([RIGHT, D]))
		{
			player.acceleration.x += player.maxVelocity.x * 4;
		}
		if (FlxG.keys.anyPressed([UP, W]))
		{
			player.acceleration.y -= player.maxVelocity.y * 4;
		}
		if (FlxG.keys.anyPressed([DOWN, S]))
		{
			player.acceleration.y += player.maxVelocity.y * 4;
		}
		super.update(elapsed);
		
		// Collide with foreground tile layer
		level.collideWithLevel(player);
	}
}
