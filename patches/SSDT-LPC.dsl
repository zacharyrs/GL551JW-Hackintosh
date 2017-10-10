// Injects custom ID for CPU to fix LPC loading
// This ID is for Haswell CPUs

DefinitionBlock("", "SSDT", 2, "hack", "LPC", 0)
{
    External(_SB.PCI0.LPCB, DeviceObj)
    Scope(_SB.PCI0.LPCB)
    {
        Method (_DSM, 4, NotSerialized)
        {
            If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
            Return (Package() {
                "compatible", "pci8086,9c43",
            })
        }
    }
}
