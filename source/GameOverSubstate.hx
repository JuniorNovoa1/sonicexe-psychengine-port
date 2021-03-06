package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSubState;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.system.FlxSound;
import flixel.FlxSprite;

class GameOverSubstate extends MusicBeatSubstate
{
	public var boyfriend:Boyfriend;
	var camFollow:FlxPoint;
	var camFollowPos:FlxObject;
	var updateCamera:Bool = false;

	var stageSuffix:String = "";

	var FLEETchance:Int = FlxG.random.int(1, 11); //fleetway lol
	var Xchance:Int = FlxG.random.int(1, 5); //x lol

	var voiceline:FlxSound;

	var sonicDEATH:SonicDeathAnimation;

	var defaultCamZoom:Float = 1.05;

	public static var sonicdeath:Bool = false;
	public static var sunkydeath:Bool = false;
	public static var xdeath:Bool = false;

	var bfdeathshit:FlxSprite;

	public static var characterName:String = 'bf';
	public static var deathSoundName:String = 'fnf_loss_sfx';
	public static var loopSoundName:String = 'gameOver';
	public static var endSoundName:String = 'gameOverEnd';

	public static var instance:GameOverSubstate;
	
	public static function resetVariables() {
		characterName = 'bf';
		deathSoundName = 'fnf_loss_sfx';
		loopSoundName = 'gameOver';
		endSoundName = 'gameOverEnd';
	}

	override function create()
	{
		instance = this;
		PlayState.instance.callOnLuas('onGameOverStart', []);

		FlxG.camera.zoom = defaultCamZoom;
		
		super.create();
	}

	public function new(x:Float, y:Float, camX:Float, camY:Float)
	{
		super();

		PlayState.instance.setOnLuas('inGameOver', true);

		Conductor.songPosition = 0;

		boyfriend = new Boyfriend(x, y, characterName);
		boyfriend.x += boyfriend.positionArray[0];
		boyfriend.y += boyfriend.positionArray[1];

		camFollow = new FlxPoint(boyfriend.getGraphicMidpoint().x, boyfriend.getGraphicMidpoint().y);

		if (characterName == 'bf' && sonicdeath)
		{   
			sonicDEATH = new SonicDeathAnimation(Std.int(boyfriend.x) - 80, Std.int(boyfriend.y) - 350);
			sonicDEATH.scale.x = 2;
			sonicDEATH.scale.y = 2;
			sonicDEATH.antialiasing = true;
			sonicDEATH.playAnim('firstDEATH');
			add(sonicDEATH);
			add(boyfriend);

		    FlxG.camera.zoom -= 0.65;
		}
		else if (characterName == 'bf' && sunkydeath)
		{   
			boyfriend.visible = false;
			add(boyfriend);

			GameOverSubstate.loopSoundName = ('Sunky_death');

			bfdeathshit = new FlxSprite(x - 105, y - 20);
			bfdeathshit.frames = Paths.getSparrowAtlas('Bf_dancin');
			bfdeathshit.animation.addByPrefix('dance', 'Dance', 24, true);
			bfdeathshit.animation.play('dance', true);
			bfdeathshit.alpha = 0;
			add(bfdeathshit);
		}
		else if (characterName == 'bf' && xdeath)
		{   
			add(boyfriend);

			XLINES();
		}
		else if (characterName == 'fleetway_death')
		{
			GameOverSubstate.deathSoundName = ('laser_moment');
			GameOverSubstate.loopSoundName = ('chaosgameover');
		
			add(boyfriend);

			FLEETLINES();
		}
		else
		{
			add(boyfriend);
		}


		FlxG.sound.play(Paths.sound(deathSoundName));
		FlxG.sound.play(Paths.sound('woooshFIRSTDEATH', 'shared'));
		Conductor.changeBPM(100);
		// FlxG.camera.followLerp = 1;
		// FlxG.camera.focusOn(FlxPoint.get(FlxG.width / 2, FlxG.height / 2));
		FlxG.camera.scroll.set();
		FlxG.camera.target = null;

		boyfriend.playAnim('firstDeath');

		var exclude:Array<Int> = [];

		camFollowPos = new FlxObject(0, 0, 1, 1);
		camFollowPos.setPosition(FlxG.camera.scroll.x + (FlxG.camera.width / 2), FlxG.camera.scroll.y + (FlxG.camera.height / 2));
		add(camFollowPos);
	}

	var isFollowingAlready:Bool = false;
	override function update(elapsed:Float)
	{
		super.update(elapsed);

		PlayState.instance.callOnLuas('onUpdate', [elapsed]);
		if(updateCamera) {
			var lerpVal:Float = CoolUtil.boundTo(elapsed * 0.6, 0, 1);
			camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));
		}

		if (sunkydeath)
		{
			FlxTween.tween(bfdeathshit, {alpha: 1}, 1);
		}

		if (controls.ACCEPT)
		{
			endBullshit();
		}

		if (controls.BACK)
		{
			FlxG.sound.music.stop();
			PlayState.deathCounter = 0;
			PlayState.seenCutscene = false;

			if (PlayState.isStoryMode)
				MusicBeatState.switchState(new StoryMenuState());
			else
				MusicBeatState.switchState(new SoundTestMenu());

			FlxG.sound.playMusic(Paths.music('freakyMenu'));
			PlayState.instance.callOnLuas('onGameOverConfirm', [false]);
		}

		if (boyfriend.animation.curAnim.name == 'firstDeath' && boyfriend.animation.curAnim.curFrame == 12)
		{
			FlxG.camera.follow(camFollowPos, LOCKON, 0.01);
		}

		if (boyfriend.animation.curAnim.name == 'firstDeath')
		{
			if(boyfriend.animation.curAnim.curFrame >= 12 && !isFollowingAlready)
			{
				FlxG.camera.follow(camFollowPos, LOCKON, 1);
				updateCamera = true;
				isFollowingAlready = true;
			}

			if (boyfriend.animation.curAnim.finished)
			{
				coolStartDeath();
				boyfriend.startedDeath = true;
			}
		}

		if (FlxG.sound.music.playing)
		{
			Conductor.songPosition = FlxG.sound.music.time;
		}
		PlayState.instance.callOnLuas('onUpdatePost', [elapsed]);
	}

	override function beatHit()
	{
		super.beatHit();

		//FlxG.log.add('beat');
	}

	var isEnding:Bool = false;

	function coolStartDeath(?volume:Float = 1):Void
	{
		FlxG.sound.playMusic(Paths.music(loopSoundName), volume);
	}

	function endBullshit():Void
	{
		if (!isEnding)
		{
			isEnding = true;
			boyfriend.playAnim('deathConfirm', true);
			FlxG.sound.play(Paths.music(endSoundName));
			new FlxTimer().start(0.1, function(tmr:FlxTimer)
			{
				boyfriend.visible = false;
				FlxG.camera.flash(FlxColor.RED, 4);

				new FlxTimer().start(0.5, function(tmr:FlxTimer)
				{
					MusicBeatState.resetState();
				});
			});
			FlxG.sound.music.stop();
			PlayState.instance.callOnLuas('onGameOverConfirm', [true]);
		}
		else if (!isEnding && sonicdeath)
		{
			isEnding = true;
			sonicDEATH.playAnim('retry', true);
			boyfriend.playAnim('deathConfirm', true);
			boyfriend.visible = false;
			FlxG.camera.flash(FlxColor.RED, 4);
			FlxG.sound.play(Paths.music(endSoundName));
			new FlxTimer().start(1.5, function(tmr:FlxTimer)
			{
				MusicBeatState.resetState();
			});
			FlxG.sound.music.stop();
			PlayState.instance.callOnLuas('onGameOverConfirm', [true]);
		}
	}

	function FLEETLINES():Void
	{
		FlxTween.tween(FlxG.sound.music, {volume: 0.25}, 0.3);
		
		voiceline = new FlxSound();
		voiceline.loadEmbedded('assets/sounds/FleetLines/' + FLEETchance + '.ogg');
		voiceline.play();
		voiceline.onComplete = function()
		{
			FlxTween.tween(FlxG.sound.music, {volume: 1}, 0.3);
		}
		FlxG.sound.list.add(voiceline);
	}
		
	function XLINES():Void
	{
		FlxTween.tween(FlxG.sound.music, {volume: 0.25}, 0.3);
		
		voiceline = new FlxSound();
		voiceline.loadEmbedded('assets/sounds/XLines/' + Xchance + '.ogg');
		voiceline.play();
		voiceline.onComplete = function()
		{
			FlxTween.tween(FlxG.sound.music, {volume: 1}, 0.3);
		}
		FlxG.sound.list.add(voiceline);
	}
}
