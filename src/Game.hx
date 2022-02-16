import h2d.Anim;
import hxd.snd.Data.SampleFormat;
import hxd.Key;

class Game extends hxd.App {

    // var square : h2d.Bitmap;
    var velocity : Float = 4;
    var gravity : Float = 0.5; 
    var jumpVelocity : Float = 15;
    var landVelocity : Float = -15;
    var jump : Bool;
    var tf : h2d.Text;
    var player : h2d.Anim;

    override function init() {

        // create 2d tile array from spritemap: "Res" is a special heaps class which accesses the "res" folder
        var tiles = hxd.Res.knight.noBKG_KnightIdle_strip.toTile().gridFlatten(64);
        // plug tile array into animation class, 30 fps, attach to this scene (s2d)
        player = new h2d.Anim(tiles, 30, s2d);

        // modify display position of the player
        player.x = s2d.width * 0.5;
        player.y = s2d.height *0.5;
    }

    function doJump() 
    {
        player.y -= jumpVelocity;
        jumpVelocity -= gravity;
        if( jumpVelocity == landVelocity )
        {
            jumpVelocity = 15;
            jump = false;
        }
    }

    override function update(deltaTime:Float) 
    {
        if ( jump == true )
        {
            doJump();
        }

        // movement
        if( Key.isDown("W".code) ) 
        {
            player.y -= velocity;
        }
        if( Key.isDown("S".code) ) 
        {
            player.y += velocity;
        }
        if( Key.isDown("A".code) ) 
        {
            player.x -= velocity;
        }
        if( Key.isDown("D".code) ) 
        {
            player.x += velocity;
        }
        // jump
        if( Key.isPressed(" ".code) ) 
        {
            jump = true;
        }
    }
    // run main function
    static function main() {
        // initialize resource management system
        hxd.Res.initLocal();
        new Game();
    }
}