// For disabling the discrete GPU

DefinitionBlock ("", "SSDT", 2, "hack", "DGPU", 0)
{
    External(_SB.PCI0, DeviceObj)
    Scope(_SB.PCI0)
    {
        External(PEG0.PEGP, DeviceObj)
        Scope(PEGP.PEGP)
        {
            External(CTXT, IntObj)
            External(GPRF, IntObj)
            External(VGAB, BuffObj)
            External(VGAR, FieldUnitObj)
            External(SGOF, MethodObj)
            Method (_OFF, 0, Serialized)
            {
                If (CTXT == Zero)
                {
                    If ( GPRF != One)
                    {
                        VGAB = VGAR
                    }
                    CTXT = One
                }
                SGOF ()
            }
        }
        
        External(LPCB.EC0, DeviceObj)
        Scope(LPCB.EC0)
        {
            OperationRegion(ECR4, EmbeddedControl, 0x00, 0xFF)
            
            External(XREG, MethodObj)
            External(SPIN, MethodObj)
            Method (_REG, 2)
            {
                XREG(Arg0, Arg1)
                If(Arg0 == 3 && Arg1 == 1)
                {
                    SPIN (0x96, Zero)
                }
            }
        }
    }
    
    Device(RMD1)
    {
        Name(_HID, "RMD10000")
        Method(_INI)
        {
            If (CondRefOf(\_SB.PCI0.PEG0.PEGP._OFF)) { \_SB.PCI0.PEG0.PEGP._OFF() }
        }
    }
}