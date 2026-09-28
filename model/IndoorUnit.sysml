// @hvac/indoor — no package imports. Evaporator, fan, and housing are parts.
import ScalarValues::*;

package Indoor {

port def RoomAirPort;
port def CondensatePort;
port def SignalPort;

part def AbsHousing;
part def AluminumFinPack;
part def CopperTubeCircuit;
part def PolypropyleneDrainPan;
part def AbsCrossFlowWheel;

part def IndoorEvaporator {
    port airIn : RoomAirPort;
    port airOut : RoomAirPort;
    attribute faceAreaM2 : Real = 0.28;
    attribute finDensityFpi : Real = 16;
    attribute rows : Real = 2;
    part fins : AluminumFinPack;
    part tubes : CopperTubeCircuit;
}

part def IndoorCrossFlowFan {
    port airIn : RoomAirPort;
    port airOut : RoomAirPort;
    attribute diameterMm : Real = 92;
    attribute lengthMm : Real = 640;
    attribute ratedPowerW : Real = 30;
    part wheel : AbsCrossFlowWheel;
}

part def IndoorUnit {
    port returnAir : RoomAirPort;
    port supplyAir : RoomAirPort;
    port drain : CondensatePort;
    port command : SignalPort;
    attribute nominalCapacityBtuH : Real = 24000;
    attribute nominalCoolingW : Real = 7034;
    part housing : AbsHousing;
    part drainPan : PolypropyleneDrainPan;
    part evaporator : IndoorEvaporator;
    part fan : IndoorCrossFlowFan;
    connect returnAir to evaporator.airIn;
    connect evaporator.airOut to fan.airIn;
    connect fan.airOut to supplyAir;
}

}
