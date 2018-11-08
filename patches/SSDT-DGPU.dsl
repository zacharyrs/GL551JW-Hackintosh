// For disabling the discrete GPU

DefinitionBlock ("", "SSDT", 2, "hack", "DGPU", 0) {
    External(_SB.PCI0, DeviceObj)
    Scope(_SB.PCI0) {
        External(PEG0.PEGP, DeviceObj)
        Scope(PEG0.PEGP) {
            External(CTXT, IntObj)
            External(GPRF, IntObj)
            External(VGAB, BuffObj)
            External(VGAR, FieldUnitObj)
            External(SGOF, MethodObj)

            // Copied _OFF method, without EC call
            Method (_OFF, 0, Serialized) {
                If (CTXT == Zero) {
                    If ( GPRF != One) { VGAB = VGAR }
                    CTXT = One
                }
                SGOF ()
            }
        }

        External(LPCB.EC0, DeviceObj)
        Scope(LPCB.EC0) {
            OperationRegion(ECR4, EmbeddedControl, 0x00, 0xFF)

            External(XREG, MethodObj) // renamed method
            External(SPIN, MethodObj)

            // replacement for above renamed
            Method (_REG, 2) {
                XREG(Arg0, Arg1) // call the original
                // also call spin as _OFF doesn't
                If(Arg0 == 3 && Arg1 == 1) { SPIN (0x96, Zero) }
            }
        }
    }

    // Custom device to call _OFF on _INI
    Device(ZRD1) {
        Name(_HID, "ZRD10000")
        Method(_INI) {
            If (CondRefOf(\_SB.PCI0.PEG0.PEGP._OFF)) { \_SB.PCI0.PEG0.PEGP._OFF() }
        }
    }
}
