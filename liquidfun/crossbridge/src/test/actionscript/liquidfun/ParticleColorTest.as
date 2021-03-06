//
//=BEGIN MIT LICENSE
//
// Copyright (c) 2014 Andras Csizmadia
// http://www.vpmedia.hu
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//
//=END MIT LICENSE
//

package liquidfun {
import crossbridge.liquidfun.CModule;

import flash.display.Sprite;

import flexunit.framework.Assert;

public class ParticleColorTest extends Sprite {

    private var color:ParticleColor;

    public function ParticleColorTest() {
        CModule.rootSprite = this;
        super();
    }

    [Before]
    public function setUp():void {
        color = ParticleColor.create();
    }

    [After]
    public function tearDown():void {
        color.destroy();
        color = null;
    }

    [BeforeClass]
    public static function setUpBeforeClass():void {
    }

    [AfterClass]
    public static function tearDownAfterClass():void {
    }

    [Test]
    public function test_construct_zero():void {
        color.set(0, 0, 0, 0);
        Assert.assertEquals(color.a, 0);
        Assert.assertEquals(color.r, 0);
        Assert.assertEquals(color.g, 0);
        Assert.assertEquals(color.b, 0);
        Assert.assertEquals(color.isZero(), true);
    }

    [Test]
    public function test_construct_salmon():void {
        color.set(0xFA, 0x80, 0x72, 0xFF);
        Assert.assertEquals(color.r, 0xFA);
        Assert.assertEquals(color.g, 0x80);
        Assert.assertEquals(color.b, 0x72);
        Assert.assertEquals(color.a, 0xFF);
    }

    [Test]
    public function test_setViolet():void {
        color.set(0x8d, 0x38, 0xc9, 0xff);
        Assert.assertEquals(0x8d, color.r);
        Assert.assertEquals(0x38, color.g);
        Assert.assertEquals(0xc9, color.b);
        Assert.assertEquals(0xff, color.a);
    }

     [Test]
     public function test_mix():void {
         // Error #1065: Variable F_abort is not defined.
         // ReferenceError: Error #1065: Variable F_abort is not defined.
         //var colorB:ParticleColor = ParticleColor.create();
         //color.mix(colorB.swigCPtr);
     }

    [Test]
    public function test_from_b2color():void {

    }
}
}