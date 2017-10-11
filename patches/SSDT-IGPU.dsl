// Handles IGPU injection + brightness

DefinitionBlock("", "SSDT", 2, "hack", "IGPU", 0)
{
    External(\ZRSC.IGPU, IntObj)
    External(\ZRSC.LMAX, IntObj)
    External(\ZRSC.LUID, IntObj)

    External(_SB.PCI0.IGPU, DeviceObj)
    Scope(_SB.PCI0.IGPU)
    {
        // inject properties for integrated graphics on IGPU
        Method(_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return(Package()
            {
                "device-id", Buffer() { 0x12, 0x04, 0x00, 0x00 },
                "AAPL,ig-platform-id", \ZRSC.IGPU, // Gets from config
                "hda-gfx", Buffer() { "onboard-1" },
//                "model", Buffer() { "Intel HD 4600" }, // Fix About This Mac
            })
        }

        // need the device-id from PCI_config to inject correct properties
        OperationRegion(IGD5, PCI_Config, 0, 0x14)

        // For backlight control (RehabMan's with unused removed)
        Device(PNLF)
        {
            Name(_ADR, Zero)
            Name(_HID, EisaId ("APP0002"))
            Name(_CID, "backlight")
            Alias(\ZRSC.LUID, _UID)
            Name(_STA, 0x0B)


            Field(^IGD5, AnyAcc, NoLock, Preserve)
            {
                Offset(0x02), GDID,16,
                Offset(0x10), BAR1,32,
            }

            OperationRegion(RMB1, SystemMemory, BAR1 & ~0xF, 0xe1184)
            Field(RMB1, AnyAcc, Lock, Preserve)
            {
                Offset(0x48250),
                LEV2, 32,
                LEVL, 32,
                Offset(0x70040),
                P0BL, 32,
                Offset(0xc8250),
                LEVW, 32,
                LEVX, 32,
                Offset(0xe1180),
                PCHL, 32,
            }

            Method(_INI)
            {
                Local0 = GDID
                Local2 = \ZRSC.LMAX

                LEVW = 0xC0000000
                Local1 = LEVX >> 16
                If (!Local1) { Local1 = Local2 }
                If (Local2 != Local1)
                {
                    Local0 = (((LEVX & 0xFFFF) * Local2) / Local1) | (Local2 << 16)
                    LEVX = Local0
                }
            }
        }
    }
}
//EOF
