include<HeatbedIsolationModule.scad>

difference()
{
	heatbedIsolation();
	
	translate([totalLength,2*thicknessWall+latchOffset+wireHoleDiameter/2,-1])
	cylinder(d=wireHoleDiameter,h=thicknessBottom+2,$fn=16);
}