// HDAU (HDMI Audio) injection

DefinitionBlock("", "SSDT", 2, "hack", "HDAU", 0)
{
    External(\ZRSC.AUDL, IntObj)

    // inject properties for HDMI audio
    External(_SB.PCI0.HDAU, DeviceObj)
    Scope(_SB.PCI0.HDAU)
    {
        Method(_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return(Package()
            {
                "layout-id", \ZRSC.AUDL, // Gets from config
                "hda-gfx", Buffer() { "onboard-1" },
            })
        }
    }
}
//EOF
