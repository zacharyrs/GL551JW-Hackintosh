// HDEF (Audio) injection

DefinitionBlock("", "SSDT", 2, "hack", "HDEF", 0)
{
    External(\ZRSC.AUDL, IntObj)

    // inject properties for audio
    External(_SB.PCI0.HDEF, DeviceObj)
    Scope(_SB.PCI0.HDEF)
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

        // CodecCommander config for AppleALC
        Name(RMCF, Package()
        {
            "CodecCommander", Package()
            {
                "Perform Reset", ">n",
                "Perform Reset on External Wake", ">n",
            },
        })
    }
}
//EOF
