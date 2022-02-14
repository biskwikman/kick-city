import hxd.Key;

class Main extends hxd.App {

    var bmp : h2d.Bitmap;
    var velocity : Float = 5;
    var gravity : Float = 1; 
    var jumpVelocity : Float = 10;
    var jump : Bool;

    override function init() {
        // create red texture and 100 x 100 tile from it
        var tile = h2d.Tile.fromColor(0xFF0000, 100, 100);
        tile.dx = -tile.width / 2;
        tile.dy = -tile.height / 2;

        // create a bitmap object and add it to the default 2d scene (s2d)
        bmp = new h2d.Bitmap(tile, s2d);

        // modify display position of the bitmap
        bmp.x = s2d.width * 0.5;
        bmp.y = s2d.height *0.5;
    }

    function doJump() 
    {
        var jumpStartLoc : Float = bmp.y;
        bmp.y -= jumpVelocity;
        jumpVelocity -= gravity;
        if( bmp.y == jumpStartLoc)
        {
            jumpVelocity = 0;
            jump = false;
        }
        trace("Hello world!");
    }

    override function update(deltaTime:Float) {

        if ( jump == true )
        {
            doJump();
        }

        // movement
        if( Key.isDown("W".code) ) 
        {
            bmp.y -= velocity;
        }
        if( Key.isDown("S".code) ) 
        {
            bmp.y += velocity;
        }
        if( Key.isDown("A".code) ) 
        {
            bmp.x -= velocity;
        }
        if( Key.isDown("D".code) ) 
        {
            bmp.x += velocity;
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