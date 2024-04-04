//

import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxAxes;

var sideChar:FunkinSprite;

var goStory, goStory_hover:FunkinSprite;
var goFreeplay, goFreeplay_hover:FunkinSprite;
var goMusic, goMusic_hover:FunkinSprite;
var doDifficulty, doDifficulty_hover:FunkinSprite;
var goOptions, goOptions_hover:FunkinSprite;
var diffEasy, diffEasy_hover:FunkinSprite;
var diffNormal, diffNormal_hover:FunkinSprite;
var diffHard, diffHard_hover:FunkinSprite;

var selectedMain:Int = 0;
var selectedDiff:Int = 2;
var selectingDifficulty:Bool = false;

var lines:Array<String> = [
    'CHAOC... THE CHAOS',
    'THE HALO...',
    'UNFORESEEN POWER',
    'WHY HAVE YOU REDUCDED ME TO THIS',
    '...',
    'I HATE YOU...',
    'LEAVE ME BE',
    "YOU'VE CAUSED ENOUGH PAIN FOR ME",
    'GO AWAY'
];

var camTricky:FlxCamera;
function create() {
    camTricky = new FlxCamera();
    camTricky.bgColor = 0;
    FlxG.cameras.add(camTricky, false);

    var bg:FunkinSprite = new FunkinSprite(-10, -10).loadGraphic(Paths.image("menus/RedBG"));

    var hedge:FunkinSprite = new FunkinSprite(-750, 110).loadGraphic(Paths.image("menus/HedgeBG"));
    hedge.scale.set(0.65, 0.65);

    var fg:FunkinSprite = new FunkinSprite(-750, 110).loadGraphic(Paths.image("menus/Transforeground"));
    fg.scale.set(0.65, 0.65);

    var people:FlxBackdrop = new FlxBackdrop(Paths.image('menus/MenuSlider'), FlxAxes.X, 0, 0);
    people.velocity.set(-14, 0);
    people.setPosition(-20, 209);
    people.scale.set(0.65, 0.65);
    people.updateHitbox();

    var show:String = 'bf';
    var r = FlxG.random.float(0, 10000);
    if (r >= 1000 && r <= 1999) show = 'tricky';
    if (r >= 3000 && r <= 3999) show = 'jebus';
    if (r >= 4000 && r <= 4999) show = 'sanford';
    if (r >= 2000 && r <= 2999) show = 'deimos';
    if (r >= 5000 && r <= 5999) show = 'hank';
    if (r >= 6000 && r <= 6999) show = 'auditor';
    if (r >= 7000 && r <= 7999) show = 'mag';
    if (r > 9800) show = 'sus';

    sideChar = new FunkinSprite(200, 280);
    sideChar.antialiasing = true;
    switch show {
        case 'bf':
            sideChar.frames = Paths.getSparrowAtlas("menus/characters/MenuBF");
            sideChar.animation.addByPrefix('idle','BF idle menu');
            sideChar.flipX = true;
            sideChar.setGraphicSize(Std.int(sideChar.width * 0.76));
            // if (!FlxG.sound.music.playing)
            //     FlxG.sound.playMusic(Paths.music("nexus_bf","clown"), 0);

            lines.push('THE KID IS WEAK...');
        case 'tricky':
            sideChar.frames = Paths.getSparrowAtlas("menus/characters/MenuTricky");
            sideChar.animation.addByPrefix('idle','menutricky');
            sideChar.y -= 155;
            sideChar.x -= 120;
            sideChar.setGraphicSize(Std.int(sideChar.width * 0.76));
            // if (!FlxG.sound.music.playing)
            //     FlxG.sound.playMusic(Paths.music("nexus_tricky","clown"), 0);

            lines.push('MY LESSER FORM...');
        case 'sus':
            FlxG.mouse.visible = true;
            sideChar.frames = Paths.getSparrowAtlas("menus/characters/Menu_ALLSUS","clown");
            sideChar.animation.addByPrefix('idle','AmongUsIDLE', 24);
            sideChar.animation.addByPrefix('death','AMONG DEATH', 24, false);
            sideChar.animation.addByIndices('deathPost','AMONG DEATH', [5], "", 24, false);
            sideChar.animation.addByPrefix('no','AmongUs NuhUh', 24, false);
            sideChar.setGraphicSize(Std.int(sideChar.width * 0.76));
            sideChar.y += 35;
            // if (!FlxG.sound.music.playing)
            //     FlxG.sound.playMusic(Paths.music("nexus_sussy","clown"), 0);

                // not doing very small details like this just yet -wiz
            // hand = new FlxSprite(sideChar.x + 75,sideChar.y + 50).loadGraphic(Paths.image('menu/Sus/AmongHand','clown'));
            // hand.setGraphicSize(Std.int(hand.width * 0.67));
            // hand.antialiasing = true;
            // hand.alpha = 0;

            lines.push('A DESPICABLE THING LURKS HERE');
        case 'jebus':
            sideChar.frames = Paths.getSparrowAtlas("menus/characters/Menu_jebus");
            sideChar.animation.addByPrefix('idle','Jebus');
            sideChar.y -= 240;
            sideChar.x -= 145;
            sideChar.setGraphicSize(Std.int(sideChar.width * 0.66));
            // if (!FlxG.sound.music.playing)
            //     FlxG.sound.playMusic(Paths.music("nexus_jebus","clown"), 0);

            lines.push('HE CAUSED THIS');
        case 'hank':
            sideChar.frames = Paths.getSparrowAtlas("menus/characters/Hank_Menu");
            sideChar.animation.addByPrefix('idle','Hank');
            sideChar.y -= 240;
            sideChar.x -= 180;
            sideChar.setGraphicSize(Std.int(sideChar.width * 0.63));
            // if (!FlxG.sound.music.playing)
            //     FlxG.sound.playMusic(Paths.music("nexus_hank","clown"), 0);

            lines.push('WEAK FLESH');
        case 'deimos':
            sideChar.frames = Paths.getSparrowAtlas("menus/characters/Deimos_Menu");
            sideChar.animation.addByPrefix('idle','Deimos');
            sideChar.setGraphicSize(Std.int(sideChar.width * 0.68));
            sideChar.y -= 65;
            sideChar.x -= 145;
            sideChar.angle = -8;
            // if (!FlxG.sound.music.playing)
            //     FlxG.sound.playMusic(Paths.music("nexus_deimos","clown"), 0);

            lines.push('ROCK UPGRADGE... INTERESTING');
        case 'auditor':
            sideChar.frames = Paths.getSparrowAtlas("menus/characters/Auditor");
            sideChar.animation.addByPrefix('idle','Auditor');
            sideChar.y -= 300;
            sideChar.x -= 200;
            sideChar.setGraphicSize(Std.int(sideChar.width * 0.76));
            // if (!FlxG.sound.music.playing)
            //     FlxG.sound.playMusic(Paths.music("nexus_auditor","clown"), 0);

            lines.push('I HAVE NOTHING TO SAY...');
        case 'mag':
            sideChar.frames = Paths.getSparrowAtlas("menus/characters/Mag_Agent_Torture_Menu");
            sideChar.animation.addByPrefix('idle','Mag Agent Torture');
            sideChar.setGraphicSize(Std.int(sideChar.width * 0.66));
            sideChar.y -= 310;
            sideChar.x -= 500;
            // if (!FlxG.sound.music.playing)
            //     FlxG.sound.playMusic(Paths.music("nexus_torture","clown"), 0);

            lines.push('AN ABOMINATION');
        case 'sanford':
            sideChar.frames = Paths.getSparrowAtlas("menus/characters/Menu_Sanford");
            sideChar.animation.addByPrefix('idle','Sanford');
            sideChar.setGraphicSize(Std.int(sideChar.width * 0.66));
            sideChar.y -= 180;
            sideChar.x -= 275;
            // if (!FlxG.sound.music.playing)
            //     FlxG.sound.playMusic(Paths.music("nexus_sanford","clown"), 0);

            lines.push('WEAKER THEN THE OTHERS...');
	}
	
    goStory = new FunkinSprite(800, 160 - 40).loadGraphic(Paths.image("menus/buttons/Clown Mode Button"));
    goStory_hover = new FunkinSprite(800, 160 - 40).loadGraphic(Paths.image("menus/buttons/Clown Mode Button CONFIRM"));

    goFreeplay = new FunkinSprite(1010, 165 - 40).loadGraphic(Paths.image("menus/buttons/FreePlayButton"));
    goFreeplay_hover = new FunkinSprite(1010, 165 - 40).loadGraphic(Paths.image("menus/buttons/FreePlayButton CONFIRM"));

    goMusic = new FunkinSprite(925, 265).loadGraphic(Paths.image("menus/buttons/MUSIC Button"));
    goMusic_hover = new FunkinSprite(925, 265).loadGraphic(Paths.image("menus/buttons/MUSIC button confirm"));

    doDifficulty = new FunkinSprite(685, 330).loadGraphic(Paths.image("menus/buttons/DIFFICULTY"));
    doDifficulty_hover = new FunkinSprite(685, 330).loadGraphic(Paths.image("menus/buttons/DIFFICULTY CONFIRM"));

    goOptions = new FunkinSprite(975, 460 + 45).loadGraphic(Paths.image("menus/buttons/OPTIONS Button"));
    goOptions_hover = new FunkinSprite(975, 460 + 45).loadGraphic(Paths.image("menus/buttons/OPTIONS Button CONFIRM"));

    diffEasy = new FunkinSprite(635, 415).loadGraphic(Paths.image("menus/buttons/EASY button"));
    diffEasy_hover = new FunkinSprite(635, 415).loadGraphic(Paths.image("menus/buttons/EASY button confirm"));

    diffNormal = new FunkinSprite(787, 415).loadGraphic(Paths.image("menus/buttons/MEDIUM button"));
    diffNormal_hover = new FunkinSprite(787, 415).loadGraphic(Paths.image("menus/buttons/MEDIUM Button confirm"));

    diffHard = new FunkinSprite(1015, 415).loadGraphic(Paths.image("menus/buttons/HARD Button"));
    diffHard_hover = new FunkinSprite(1015, 415).loadGraphic(Paths.image("menus/buttons/HARD button confirm"));

    for (i in [bg, hedge, people]) {
        i.camera = camTricky;
        add(i);
    }
    
    for (i in [
        goStory, goStory_hover, goFreeplay, goFreeplay_hover, goMusic, goMusic_hover, doDifficulty, doDifficulty_hover, goOptions, goOptions_hover,
        diffEasy, diffEasy_hover, diffNormal, diffNormal_hover, diffHard, diffHard_hover
    ]) {
        i.scale.set(0.7, 0.7);
        i.camera = camTricky;
        add(i);
    }
    
    sideChar.camera = camTricky;
    add(sideChar);

    var bgCover:FunkinSprite = new FunkinSprite(-455, -327).loadGraphic(Paths.image("menus/BGCover"));
    bgCover.scale.set(0.7, 0.7);

    var hedgeCover:FunkinSprite = new FunkinSprite(-750, -414).loadGraphic(Paths.image("menus/Hedgecover"));
    hedgeCover.scale.set(0.65, 0.65);

    var liners:FunkinSprite = new FunkinSprite(600, 390).loadGraphic(Paths.image("menus/Liners"));
    liners.scale.set(0.7, 0.7);

    var redLines:FunkinSprite = new FunkinSprite(-749, 98).loadGraphic(Paths.image("menus/MenuRedLines"));
    redLines.scale.set(0.7, 0.7);

    var logo:FunkinSprite = new FunkinSprite(-50, -15).loadGraphic(Paths.image("menus/Mainlogo"));
    
    var menuShade:FunkinSprite = new FunkinSprite(-1350, -1190).loadGraphic(Paths.image("menus/Menu Shade"));
    menuShade.scale.set(0.7, 0.7);

    var credits:FunkinSprite = new FunkinSprite().loadGraphic(Paths.image("menus/CreditsOverlay"));

    for (i in [bgCover, hedgeCover, liners, redLines, logo, menuShade, credits]) {
        i.camera = camTricky;
        add(i);
    }

    peow(0);

    /*
    if (FlxG.save.data.beaten)
    {
        var troph:FlxSprite = new FlxSprite(875, 60).loadGraphic(Paths.image("menu/Silver_Trophy","clown"));
        if (FlxG.save.data.beatenHard)
        {


            troph = new FlxSprite(875, -20).loadGraphic(Paths.image("menu/Gold_Trophy","clown"));

            if (FlxG.save.data.beatEx)
            {
                FlxG.mouse.visible = true;
                tinyMan = new FlxSprite(980,-100);
        
                tinyMan.frames = Paths.getSparrowAtlas('menu/Fixed_Tiny_Desk_Tricky','clown');
        
                tinyMan.animation.addByPrefix('idle','Tiny Desk Tricky Idle',24);
                tinyMan.animation.addByPrefix('click','Tiny Desk Tricky Click',24, false);
                tinyMan.animation.addByPrefix('meow','Tiny Desk Tricky Meow',24, false);

                tinyMan.animation.play('idle');

                tinyMan.setGraphicSize(Std.int(tinyMan.width * 0.66));

                tinyMan.antialiasing = true;

                add(tinyMan);
            }
        }

        troph.antialiasing = true;
        troph.setGraphicSize(Std.int(troph.width * 0.8));


        add(troph);
    }

    if (show == 'sus')
        add(hand);
    */
}

function update() {
    if (FlxG.keys.justPressed.F)
        FlxG.switchState(new FreeplayState());

    if (FlxG.keys.justPressed.RIGHT) peow(1);
    if (FlxG.keys.justPressed.LEFT) peow(-1);

    goStory.visible = selectedMain != 0; goStory_hover.visible = selectedMain == 0;
    goFreeplay.visible = selectedMain != 1; goFreeplay_hover.visible = selectedMain == 1;
    goMusic.visible = selectedMain != 2; goMusic_hover.visible = selectedMain == 2;
    doDifficulty.visible = selectedMain != 3; doDifficulty_hover.visible = selectedMain == 3;
    goOptions.visible = selectedMain != 4; goOptions_hover.visible = selectedMain == 4;

    diffEasy.visible = selectedDiff != 0; diffEasy_hover.visible = selectedDiff == 0;
    diffNormal.visible = selectedDiff != 1; diffNormal_hover.visible = selectedDiff == 1;
    diffHard.visible = selectedDiff != 2; diffHard_hover.visible = selectedDiff == 2;
}

function peow(a:Int) {
    if (selectingDifficulty) {
        selectedDiff = FlxMath.wrap(selectedDiff + a, 0, 2);
    } else {
        selectedMain = FlxMath.wrap(selectedMain + a, 0, 4);

        // not working, fix later
        switch selectedMain {
            case 0:
                FlxTween.tween(goStory, {y: 160}, 0.4, {ease: FlxEase.quintOut});
                FlxTween.tween(goStory_hover, {y: 160}, 0.4, {ease: FlxEase.quintOut});
            case !0:
                FlxTween.tween(goStory, {y: 160 - 40}, 0.4, {ease: FlxEase.quintOut});
                FlxTween.tween(goStory_hover, {y: 160 - 40}, 0.4, {ease: FlxEase.quintOut});
            case 1:
                FlxTween.tween(goFreeplay, {y: 165}, 0.4, {ease: FlxEase.quintOut});
                FlxTween.tween(goFreeplay_hover, {y: 165}, 0.4, {ease: FlxEase.quintOut});
            case !1:
                FlxTween.tween(goFreeplay, {y: 165 - 40}, 0.4, {ease: FlxEase.quintOut});
                FlxTween.tween(goFreeplay_hover, {y: 165 - 40}, 0.4, {ease: FlxEase.quintOut});
            case 4:
                FlxTween.tween(goOptions, {y: 460}, 0.4, {ease: FlxEase.quintOut});
                FlxTween.tween(goOptions_hover, {y: 460}, 0.4, {ease: FlxEase.quintOut});
            case !4:
                FlxTween.tween(goOptions, {y: 460 + 45}, 0.4, {ease: FlxEase.quintOut});
                FlxTween.tween(goOptions_hover, {y: 460 + 45}, 0.4, {ease: FlxEase.quintOut});
        }
    }
}

function beatHit() {
    sideChar.playAnim("idle");
}

function onSelectItem(e) e.cancel();
function onChangeItem(e) e.cancel();