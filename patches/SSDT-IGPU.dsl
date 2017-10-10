#define SANDYIVY_PWMMAX 0x710
#define HASWELL_PWMMAX 0xad9
#define SKYLAKE_PWMMAX 0x56c
#define CUSTOM_PWMMAX_07a1 0x07a1
#define CUSTOM_PWMMAX_1499 0x1499

DefinitionBlock("", "SSDT", 2, "hack", "IGPU", 0)
{
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
                "AAPL,ig-platform-id", Buffer() { 0x00, 0x00, 0x26, 0x04 },
                "hda-gfx", Buffer() { "onboard-1" },
//                "model", Buffer() { "Intel HD 4600" },
            })
        }
    }

    External(_SB.PCI0.IGPU, DeviceObj)
    Scope(_SB.PCI0.IGPU)
    {
        // need the device-id from PCI_config to inject correct properties
        OperationRegion(IGD5, PCI_Config, 0, 0x14)
    }

    // For backlight control
    Device(_SB.PCI0.IGPU.PNLF)
    {
        Name(_ADR, Zero)
        Name(_HID, EisaId ("APP0002"))
        Name(_CID, "backlight")
        // _UID is set depending on PWMMax
        // 10: Sandy/Ivy 0x710
        // 11: Haswell/Broadwell 0xad9
        // 12: Skylake/KabyLake 0x56c (and some Haswell, example 0xa2e0008)
        // 99: Other
        Name(_UID, 0)
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
            // Adjustment required when using AppleBacklight.kext
            Local0 = GDID
            Local2 = Ones
            Local2 = CUSTOM_PWMMAX_1499

            // This 0xC value comes from looking what OS X initializes this\n
            // register to after display sleep (using ACPIDebug/ACPIPoller)\n
            LEVW = 0xC0000000

            // change/scale only if different than current...
            Local1 = LEVX >> 16
            If (!Local1) { Local1 = Local2 }
            If (Local2 != Local1)
            {
                // set new backlight PWMAX but retain current backlight level by scaling
                Local0 = (((LEVX & 0xFFFF) * Local2) / Local1) | (Local2 << 16)
                //REVIEW: wait for vblank before setting new PWM config
                //For (Local7 = P0BL, P0BL == Local7, ) { }
                LEVX = Local0
            }

            // Now Local2 is the new PWMMax, set _UID accordingly
            // The _UID selects the correct entry in AppleBacklightInjector.kext
            If (Local2 == SANDYIVY_PWMMAX) { _UID = 14 }
            ElseIf (Local2 == HASWELL_PWMMAX) { _UID = 15 }
            ElseIf (Local2 == SKYLAKE_PWMMAX) { _UID = 16 }
            ElseIf (Local2 == CUSTOM_PWMMAX_07a1) { _UID = 17 }
            ElseIf (Local2 == CUSTOM_PWMMAX_1499) { _UID = 18 }
            Else { _UID = 99 }
        }
    }
}