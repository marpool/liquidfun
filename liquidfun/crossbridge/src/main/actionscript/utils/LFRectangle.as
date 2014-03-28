// Copyright (c) 2013 Adobe Systems Inc

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

package utils {
import flash.display.Sprite;
import flash.geom.Matrix;

public class LFRectangle extends Sprite {
    private var bodyDef:BodyDef;
    private var bodyDefPos:Vec2;
    private var body:Body;
    private var dynamicBox:PolygonShape;
    private var fixtureDef:FixtureDef;
    private var w:Number;
    private var h:Number;
    private var matrix:Matrix = new Matrix();

    public function LFRectangle(_x:Number, _y:Number, _w:Number, _h:Number, world:World, isDynamic:Boolean = true) {
        w = _w;
        h = _h;
        initialize(_x, _y, _w, _h, world, isDynamic);
    }

    private function initialize(_x:Number, _y:Number, _w:Number, _h:Number, world:World, isDynamic:Boolean):void {
        graphics.lineStyle(0.25, Math.random() * uint.MAX_VALUE);
        graphics.beginFill(Math.random() * uint.MAX_VALUE, 0.2);
        graphics.drawRect(0, 0, _w, _h);
        graphics.endFill();

        bodyDef = BodyDef.create();
        bodyDef.type = isDynamic ? LiquidFun.dynamicBody : LiquidFun.staticBody;
        bodyDefPos = Vec2.create()
        bodyDefPos.set(_x / LFGlobals.SCALE, _y / LFGlobals.SCALE);
        bodyDef.position = bodyDefPos.swigCPtr;
        body = new Body();
        body.swigCPtr = world.createBody(bodyDef.swigCPtr);

        dynamicBox = PolygonShape.create();
        dynamicBox.setAsBox(_w / (LFGlobals.SCALE * 2), _h / (LFGlobals.SCALE * 2));

        fixtureDef = FixtureDef.create();
        fixtureDef.shape = dynamicBox.swigCPtr;

        if (isDynamic)
            fixtureDef.density = 1.0;

        fixtureDef.friction = 0.3;

        body.createFixture(fixtureDef.swigCPtr);
    }

    public function update():void {
        bodyDefPos.swigCPtr = body.getPosition();
        matrix.identity();
        matrix.translate(-w * 0.5, -h * 0.5);
        matrix.rotate(-body.getAngle());
        // matrix.translate(w * 0.5, h * 0.5);
        matrix.translate(bodyDefPos.x * LFGlobals.SCALE, 600 - (bodyDefPos.y * LFGlobals.SCALE));
        transform.matrix = matrix;
    }
}
}