/*
 * Copyright (c) 2014 Google, Inc.
 *
 * This software is provided 'as-is', without any express or implied
 * warranty.  In no event will the authors be held liable for any damages
 * arising from the use of this software.
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 * 1. The origin of this software must not be misrepresented; you must not
 * claim that you wrote the original software. If you use this software
 * in a product, an acknowledgment in the product documentation would be
 * appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 * misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 */

 // @contributor: Andras Csizmadia <www.vpmedia.eu>

%module b2Joint

/// Rename constants
%rename (UNKNOWN_JOINT) e_unknownJoint;
%rename (REVOLUTE_JOINT) e_revoluteJoint;
%rename (PRISMATIC_JOINT) e_prismaticJoint;
%rename (DISTANCE_JOINT) e_distanceJoint;
%rename (PULLEY_JOINT) e_pulleyJoint;
%rename (MOUSE_JOINT) e_mouseJoint;
%rename (GEAR_JOINT) e_gearJoint;
%rename (WHEEL_JOINT) e_wheelJoint;
%rename (WELD_JOINT) e_weldJoint;
%rename (FRICTION_JOINT) e_frictionJoint;
%rename (ROPE_JOINT) e_ropeJoint;
%rename (MOTOR_JOINT) e_motorJoint;

/// Ignore functions
%ignore b2Joint::GetNext;
%ignore b2Joint::Dump;

/// Include original header
%include "../../../Box2D/Box2D/Dynamics/Joints/b2Joint.h"