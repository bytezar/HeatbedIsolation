thicknessBottom=3;
thicknessWall=2;

length=125;
totalLength=length+thicknessWall;

bottomLength=30;
bottomLengthWithOffset=bottomLength+thicknessWall;

height=18;
totalHeight=height+thicknessBottom;

bedHolderHoleDiameter=10;
bedHolderHoleOffset=20;

m3Diameter=3.4;
screwM3HolderDiameter=6;
screwM3HolderRadius=screwM3HolderDiameter/2;
screwM3HolderLength=13;

latchLength=5;
latchOffset=0.2;

wireHoleDiameter=8;

module screwM3Holder()
{
	difference()
	{
		union()
		{
			cube([screwM3HolderLength,screwM3HolderDiameter,screwM3HolderDiameter/2]);
			
			translate([0,screwM3HolderRadius,screwM3HolderRadius])
			rotate([0,90,0])
			cylinder(d=screwM3HolderDiameter,h=screwM3HolderLength,$fn=16);
		}
		
		translate([0,screwM3HolderRadius,screwM3HolderRadius])
		rotate([0,90,0])
		cylinder(d=2,h=screwM3HolderLength,$fn=8);
	}
}

module heatbedIsolation()
union()
{
	difference()
	{
		cube([totalLength,totalLength,totalHeight]);
		
		translate([thicknessWall,thicknessWall,thicknessBottom])
		cube([length+1,length+1,height+1]);
		
		translate([bottomLengthWithOffset,bottomLengthWithOffset,-1])
		cube([length-bottomLength+1,length-bottomLength+1,thicknessBottom+2]);
		
		translate([thicknessWall+bedHolderHoleOffset,thicknessWall+bedHolderHoleOffset,-1])
		cylinder(d=bedHolderHoleDiameter,h=thicknessBottom+2,$fn=16);
	}
	
	//Latch begin
	translate([totalLength-latchLength,-thicknessWall-latchOffset,0])
	cube([2*latchLength,thicknessWall,totalHeight]);
	
	translate([totalLength-latchLength,-thicknessWall-latchOffset,0])
	cube([latchLength,3*thicknessWall+latchOffset,totalHeight]);
	
	translate([totalLength-latchLength,2*thicknessWall+latchOffset,thicknessBottom])
	rotate([90,0,0])
	linear_extrude(thicknessWall)
	polygon([
		[0,0],
		[latchLength,0],
		[2*latchLength,latchLength],
		[2*latchLength,height],
		[0,height],
	]);
	//Latch end
	
	translate([totalLength-screwM3HolderLength,thicknessWall+(bottomLength-screwM3HolderDiameter)/2,thicknessBottom])
	screwM3Holder();
	
	translate([thicknessWall+screwM3HolderDiameter+(bottomLength-screwM3HolderDiameter)/2,totalLength-screwM3HolderLength,thicknessBottom])
	rotate([0,0,90])
	screwM3Holder();
}