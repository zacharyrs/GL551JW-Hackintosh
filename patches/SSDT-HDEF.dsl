// HDEF (Audio) injection

DefinitionBlock("", "SSDT", 2, "hack", "HDEF", 0) {
    External(\ZRSC.AUDL, IntObj)

    // inject properties for audio
    External(_SB.PCI0.HDEF, DeviceObj)
    Scope(_SB.PCI0.HDEF) {
        Method(_DSM, 4) {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Local0 = Package() {
                "layout-id", Buffer() { 3, 0, 0, 0 }, // Gets from config
                "hda-gfx", Buffer() { "onboard-1" },
            }

            // Gets from config
            If (CondRefOf(\ZRSC.AUDL)) {
                CreateDWordField(DerefOf(Local0[1]), 0, AUDL)
                AUDL = \ZRSC.AUDL
            }

            Return (Local0)
        }

        // CodecCommander config for AppleALC
        Name(RMCF, Package() {
            "CodecCommander", Package() {
                "Perform Reset", ">n",
                "Perform Reset on External Wake", ">n",
            },
        })
    }
}
