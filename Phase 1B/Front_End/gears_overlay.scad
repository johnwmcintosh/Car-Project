//
// Rack + Pinion Wrapper (separate printable parts)
//
include <../robot_settings.scad>
use <../Front_End/OpenSCAD_Gear_Library_with_Customizer/files/gears.scad>

//
// Rack + Gear Wrapper (separate printable parts)
//

/* -----------------------------
   Customizer Parameters
-------------------------------- */

Gear_Type = "spur_gear";   // ["rack":Rack, "spur_gear":Spur Gear, "herringbone_gear":Herringbone Gear]

Module = 0.75; // 0.5

// Pinion / Gear
Teeth = 20; //30;
Width = dc_motor_axle_cutout_z - 2;
Bore = dc_motor_axle_cutout_d;

Pressure_Angle = 20;
Helix_Angle = 0;

// Rack
Rack_Length = main_box_x;
Rack_Height = 3;

// Hub (optional)
Hub = false;
Hub_Diameter = 6;
Hub_Thickness = 5;


/* -----------------------------
   Derived Values
-------------------------------- */

Final_Helix = (Helix_Angle == 0) ? 0 : Helix_Angle;
Final_Hub_Diameter = Hub ? Hub_Diameter : 0;
Final_Hub_Thickness = Hub ? Hub_Thickness : 0;

// Pinion pitch radius
Pinion_Radius = Module * Teeth / 2;


//the gears scad library is in German and a pain to use. This is an English wrapper for exposing the elements that I need.
/* -----------------------------
   Build Rack
-------------------------------- */

module Rack() {
    zahnstange(
        modul = Module,
        laenge = Rack_Length,
        hoehe = Rack_Height,
        breite = Width,
        eingriffswinkel = Pressure_Angle,
        schraegungswinkel = -Final_Helix
    );
}


/* -----------------------------
   Build Spur Gear
-------------------------------- */

module SpurGear() {
    stirnrad(
        modul = Module,
        zahnzahl = Teeth,
        breite = Width,
        bohrung = Bore,
        nabendicke = Final_Hub_Thickness,
        nabendurchmesser = Final_Hub_Diameter,
        eingriffswinkel = Pressure_Angle,
        schraegungswinkel = Final_Helix,
        optimiert = false
    );
}


/* -----------------------------
   Build Herringbone Gear
-------------------------------- */

module HerringboneGear() {
    pfeilrad(
        modul = Module,
        zahnzahl = Teeth,
        breite = Width,
        bohrung = Bore,
        nabendicke = Final_Hub_Thickness,
        nabendurchmesser = Final_Hub_Diameter,
        eingriffswinkel = Pressure_Angle,
        schraegungswinkel = Final_Helix,
        optimiert = false
    );
}


/* -----------------------------
   Output Selected Part
-------------------------------- */
module gears_overlay(Gear_Type)
{
    if (Gear_Type == "rack") {
        Rack();
    }

    if (Gear_Type == "spur_gear") {
        SpurGear();
    }

    if (Gear_Type == "herringbone_gear") {
        HerringboneGear();
    }
}

gears_overlay("rack");
gears_overlay("spur_gear");