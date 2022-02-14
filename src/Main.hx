import hxd.snd.Data.SampleFormat;
import hxd.Key;

class Main extends hxd.App {

    var square : h2d.Bitmap;
    var velocity : Float = 4;
    var gravity : Float = 0.5; 
    var jumpVelocity : Float = 15;
    var landVelocity : Float = -15;
    var jump : Bool;
    var tf : h2d.Text;

    override function init() {
        // create red texture and 100 x 100 tile from it
        var tile = h2d.Tile.fromColor(0xFF0000, 100, 100);
        tile.dx = -tile.width / 2;
        tile.dy = -tile.height / 2;

        // create a bitmap object and add it to the default 2d scene (s2d)
        square = new h2d.Bitmap(tile, s2d);

        // modify display position of the bitmap
        square.x = s2d.width * 0.5;
        square.y = s2d.height *0.5;

        // text for debuggin jump
        var font : h2d.Font = hxd.res.DefaultFont.get();
        tf = new h2d.Text(font);
        tf.textAlign = Center;
        tf.x = 80;
        // add to any parent, in this case we append to root
        s2d.addChild(tf);
    }

    // for debugging jump
    function text()
    {
        if( jump == true ) {
            tf.text = 'jumping';
        } else { tf.text = 'not jumping'; }
    }

    function doJump() 
    {
        square.y -= jumpVelocity;
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
            square.y -= velocity;
        }
        if( Key.isDown("S".code) ) 
        {
            square.y += velocity;
        }
        if( Key.isDown("A".code) ) 
        {
            square.x -= velocity;
        }
        if( Key.isDown("D".code) ) 
        {
            square.x += velocity;
        }
        // jump
        if( Key.isPressed(" ".code) ) 
        {
            jump = true;
        }
    }
    static function main() {
        new Main();
    }
}