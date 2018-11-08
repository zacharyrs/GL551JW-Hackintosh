// Configuration file for ease of use
// Rather than needing to change and recompile everything, just do this file

DefinitionBlock ("", "SSDT", 2, "hack", "ZRSC", 0) {
    Device(ZRSC) {
        Name(_ADR, 0) // Don't remove me

        // IGPU: ig-platform-id
        Name(IGPU, 0x04260000)

        // LMAX: based on ig-platform-id
        // 0x04260000 -> 0x1499
        // 0x0a260006 -> 0xad9
        Name(LMAX, 0x1499)

        // LUID: based on ig-platform-id too
        // 0x04260000 -> 18
        // 0x0a260006 -> 15
        Name(LUID, 18)

        // AUDL: Audio layout-id
        Name(AUDL, 3)
    }
}
