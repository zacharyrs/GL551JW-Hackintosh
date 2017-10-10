// For disabling the discrete GPU

DefinitionBlock ("", "SSDT", 2, "hack", "DGPU", 0)
{
    External(_SB.PCI0, DeviceObj)
    Scope(_SB.PCI0)
    {
        External(PEG0.PEGP, DeviceObj)
        Scope(PEG0.PEGP)
        {
            External(CTXT, IntObj)
            External(GPRF, IntObj)
            External(VGAB, BuffObj)
            External(VGAR, FieldUnitObj)
            External(SGOF, MethodObj)
            Method (_OFF, 0, Serialized) // Copied _OFF method, without EC call
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

            External(XREG, MethodObj) // renamed method
            External(SPIN, MethodObj)
            Method (_REG, 2) // replacement for above renamed
            {
                XREG(Arg0, Arg1) // call the original
                If(Arg0 == 3 && Arg1 == 1) // also call spin as _OFF doesn't
                {
                    SPIN (0x96, Zero)
                }
            }
        }
    }

    Device(ZRD1) // Custom device to call _OFF on _INI
    {
        Name(_HID, "ZRD10000")
        Method(_INI)
        {
            If (CondRefOf(\_SB.PCI0.PEG0.PEGP._OFF)) { \_SB.PCI0.PEG0.PEGP._OFF() }
        }
    }
}
