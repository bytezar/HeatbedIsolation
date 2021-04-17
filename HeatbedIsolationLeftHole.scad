include<HeatbedIsolationModule.scad>

difference()
{
	heatbedIsolation();
	
	translate([2*thicknessWall+latchOffset+wireHoleDiameter/2,totalLength,-1])
	cylinder(d=wireHoleDiameter,h=thicknessBottom+2,$fn=16);
}