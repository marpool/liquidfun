#
#=BEGIN MIT LICENSE
#
# Copyright (c) 2014 Andras Csizmadia
# http://www.vpmedia.hu
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#
#=END MIT LICENSE
#

# Purpose: FlasCC library makefile
# Author: Andras Csizmadia
# Version: 1.0.0
# Platform: Windows
# Runtime: Cygwin with FlasCC

# FlashCC SDK root
FLASCC:=$(FLASCC_ROOT)/sdk

# ASC2 Compiler arguments
$?AS3COMPILERARGS=java $(JVMARGS) -jar $(call nativepath,$(FLASCC)/usr/lib/asc2.jar) -merge -md -warnings

# C/C++ Compiler arguments
# Debug: -O0 -g
CCOMPARGS:=-Wall -Wextra -Wno-write-strings -Wno-trigraphs -O4 -jvmopt=-Xmx1G

# Path helper
$?UNAME=$(shell uname -s)
ifneq (,$(findstring CYGWIN,$(UNAME)))
	$?nativepath=$(shell cygpath -at mixed $(1))
	$?unixpath=$(shell cygpath -at unix $(1))
else
	$?nativepath=$(abspath $(1))
	$?unixpath=$(abspath $(1))
endif

compile:
	########################################
	# Initializing ...
	########################################
	mkdir -p build
	########################################
	# Making LiquidFun ...
	########################################
	cd build && PATH="$(call unixpath,$(FLASCC)/usr/bin):$(PATH)" CC=gcc CXX=g++ CFLAGS="$(CCOMPARGS)" CXXFLAGS="$(CCOMPARGS)" cmake ../../Box2D/ -DBOX2D_BUILD_EXAMPLES=OFF -DBOX2D_BUILD_UNITTESTS=OFF
	########################################
	# Building LiquidFun ...
	########################################
	cd build && make -j8
	########################################
	# Generating CXX ...
	########################################
	cd build && "$(FLASCC)/usr/bin/swig" -fcompact -Wextra -as3 -c++ -I../../Box2D/ -I../src/main/swig -module LiquidFun -outdir . -includeall -ignoremissing -o ./LiquidFun_wrap.cxx ../src/main/swig/LiquidFun.i &> LiquidFun_swig.log
	########################################
	# Generating ABC ...
	########################################
	cd build && $(AS3COMPILERARGS) -import $(call nativepath,$(FLASCC)/usr/lib/builtin.abc) -import $(call nativepath,$(FLASCC)/usr/lib/playerglobal.abc) LiquidFun.as &> LiquidFun_asc2.log
	########################################
	# Generating O ...
	########################################
	cp -f src/main/templates/exports.txt build/ 
	"$(FLASCC)/usr/bin/g++" $(CCOMPARGS) -I../Box2D/ -c build/LiquidFun_wrap.cxx -o build/LiquidFun_wrap.o
	########################################
	# Generating Exports ...
	########################################
	"$(FLASCC)/usr/bin/nm" build/LiquidFun_wrap.o | grep ' T ' | sed 's/.*__/_/' | sed 's/.* T //' >> build/exports.txt
	########################################
	# Generating SWC ...
	########################################
	cd build && "$(FLASCC)/usr/bin/g++" $(CCOMPARGS) -flto-api=exports.txt -lAS3++ -lFlash++ -I../../Box2D/ LiquidFun.abc LiquidFun_wrap.cxx Box2D/Release/libLiquidFun.a -emit-swc=crossbridge.liquidfun -o ../LiquidFun.swc

clean:
	rm -rf build
	rm -f LiquidFun.swc