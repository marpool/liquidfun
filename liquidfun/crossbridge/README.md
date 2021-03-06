LiquidFun Flash
===============

## Getting Started

### Tooling Version Requirements

Following are the minimum required versions for the tools and libraries you
need for building LiquidFun for Flash:

-   CrossBridge SDK 1.0.1: http://sourceforge.net/projects/crossbridge/files/
-   Adobe AIR SDK 4.0.0: http://www.adobe.com/devnet/air/air-sdk-download.html
-   Apache Flex SDK 4.1.1: https://flex.apache.org/installer.html
-   Apache Ant 1.9.3: https://ant.apache.org/bindownload.cgi
-   JDK 7: http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html

### Env. Variable Requirements

In order to get the build scripts working, set the following environment variables:

* FLASCC_ROOT=c:\Work\sdks\adobe-crossbridge\1.0.1 (Windows style path)
* FLASCC_AIR_ROOT=/cygdrive/c/Work/sdks/adobe-air/4.0.0 (Cygwin style path)
* FLASCC_GDB_RUNTIME=/cygdrive/c/Work/tools/flashplayer.exe (Cygwin style path)
* AIR_HOME=c:\Work\sdks\adobe-air\4.0.1 (Windows style path)
* FLEX_HOME=c:\Work\sdks\apache-flex\4.1.1 (Windows style path)

## Assembling

#### Flash SWC Library 

* Run 'build.bat':

#### Example SWF + Unit Test + Documentation

* Run 'ant -f assemble.xml clean build test document':

## Releases

### Pre-Compiled Library SWC

* https://dl.dropboxusercontent.com/u/1375050/LiquidFun.swc

### Pre-Compiled TestBed SWF

* https://dl.dropboxusercontent.com/u/1375050/TestBed.swf

### Pre-Compiled TestBed APK

* https://dl.dropboxusercontent.com/u/1375050/TestBed.apk

## Missing Features

* Flash specific Common::b2Draw wrapper (flash.display::Shape)
* Flash specific Common::b2Log wrapper (::trace)
* Flash specific Dynamics.Contacts::b2ContactEvent wrappers (flash.events::Event)
* All classes covered by unit tests
* Complete TestBed

## Links

* http://www.swig.org/Doc2.0/SWIGDocumentation.html#SWIGPlus
* http://www.ibiblio.org/gferg/ldp/GCC-Inline-Assembly-HOWTO.html
* http://www.adobe.com/devnet-docs/flascc/README.html
* http://www.adobe.com/devnet-docs/flascc/docs/Reference.html
* http://www.adobe.com/devnet-docs/flascc/docs/capidocs/as3.html
* https://github.com/adobe-flash/crossbridge/wiki/_pages
* http://bruce-lab.blogspot.hu/2014/01/crossbridgeflascc-resources-collection.html