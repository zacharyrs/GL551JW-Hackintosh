// BIF0 -> XIF0 (42494630 00A02E -> 58494630 00A02E)
// BIF1 -> XIF1 (42494631 00A01F -> 58494631 00A01F)
// BIF2 -> XIF2 (42494632 00A01F -> 58494632 00A01F)
// BIF3 -> XIF3 (42494633 00A02E -> 58494633 00A02E)
// BIF4 -> XIF4 (42494634 00A019 -> 58494634 00A019)
// BIFA -> XIFA (42494641 00A019 -> 58494641 00A019)
// BSTS -> XSTS (42535453 00A00B -> 58535453 00A00B)
// BCRT -> XCRT (42435254 00A00B -> 58435254 00A00B)
// BRCP -> XRCP (42524350 00A00B -> 58524350 00A00B)
// BVOT -> XVOT (42564F54 00A00B -> 58564F54 00A00B)
// SMBR -> XMBR (534D4252 0B7012 -> 584D4252 0B7012)
// SMBW -> XMBW (534D4257 0D7012 -> 584D4257 0D7012)
// ECSB -> XCSB (45435342 077012 -> 58435342 077012)
// TACH -> XACH (54414348 09085F -> 58414348 09085F)

// WMNB -> XMNB (574D4E42 038A6A -> 584D4E42 038A6A)

// CBST -> XBST (43425354 00A048 -> 58425354 00A048)
// _BIX -> XBIX (5F424958 00A018 -> 58424958 00A018)
// FBST Fix: A00A4348 47530070 0A0260A1 04700160 -> A00A4348 47530070 0A0260A1 04700060

DefinitionBlock ("", "SSDT", 2, "hack", "BATT", 0)
{
    External (\_SB.PCI0.LPCB.EC0, DeviceObj)
    External (\_SB.PCI0.LPCB.EC0.ECAV, MethodObj)
    External (\_SB.PCI0.LPCB.EC0.BSLF, IntObj)
    External (\_SB.PCI0.LPCB.EC0.WRQK, IntObj)
    External (\_SB.PCI0.LPCB.EC0.RDQK, IntObj)
    External (\_SB.PCI0.LPCB.EC0.SDBT, IntObj)
    External (\_SB.PCI0.LPCB.EC0.RCBT, IntObj)
    External (\_SB.PCI0.LPCB.EC0.WRBT, IntObj)
    External (\_SB.PCI0.LPCB.EC0.RDBT, IntObj)
    External (\_SB.PCI0.LPCB.EC0.WRWD, IntObj)
    External (\_SB.PCI0.LPCB.EC0.RDWD, IntObj)
    External (\_SB.PCI0.LPCB.EC0.WRBL, IntObj)
    External (\_SB.PCI0.LPCB.EC0.RDBL, IntObj)
    External (\_SB.PCI0.LPCB.EC0.SBBY, IntObj)
    External (\_SB.PCI0.LPCB.EC0.MUEC, MutexObj)
    External (\_SB.PCI0.LPCB.EC0.ADDR, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC0.ADD2, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC0.BCNT, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC0.BCN2, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC0.PRTC, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC0.CMDB, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC0.CMD2, FieldUnitObj)
//    External (\_SB.PCI0.LPCB.EC0.BRAI, FieldUnitObj)
//    External (\_SB.PCI0.LPCB.EC0.BRAD, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC0.DAT0, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC0.DAT1, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC0.DA20, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC0.DA21, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC0.PRT2, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC0.SSTS, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC0.SST2, FieldUnitObj)
    External (\_SB.PCI0.LPCB.EC0.SWTC, MethodObj)
    External (_SB.PCI0.BAT0, DeviceObj)
    External (_SB.PCI0.LPCB.EC0.BATP, MethodObj)
    External (_SB.PCI0.LPCB.EC0.GBTT, MethodObj)
    External (_SB.PCI0.BAT0.PUNT, IntObj)
    External (_SB.PCI0.BAT0.NBIX, PkgObj)
    External (_SB.PCI0.BAT0.PBST, PkgObj)
    External (_SB.PCI0.BAT0.PBIF, PkgObj)
    External (_SB.PCI0.BAT0.BIXT, PkgObj)
    External (_BIF, MethodObj)
    External (_SB.ATKD, DeviceObj)
    External (_SB.ATKD.XMNB, MethodObj)
    Scope (_SB.PCI0.LPCB.EC0)
    {
        OperationRegion (ECR1, EmbeddedControl, Zero, 0xFF)
        Field (ECR1, ByteAcc, Lock, Preserve)
        {
//            Offset (0x04),
//            CMD1,   8,
//            CDT1,   8,
//            CDT2,   8,
//            CDT3,   8,
//            Offset (0x80),
//            Offset (0x81),
//            Offset (0x82),
//            Offset (0x83),
//            EB0R,   8,
//            EB1R,   8,
//            EPWF,   8,
//            Offset (0x87),
//            Offset (0x88),
//            Offset (0x89),
//            Offset (0x8A),
//            HKEN,   1,
            Offset (0x93),
            AH00,8,AH01,8, //<-
            AH10,8,AH11,8, //<-
//            TSTP,   8,
//            Offset (0x9C),
//            CDT4,   8,
//            CDT5,   8,
//            Offset (0xA0),
//            Offset (0xA1),
//            Offset (0xA2),
//            Offset (0xA3),
//            EACT,   8,
//            TH1R,   8,
//            TH1L,   8,
//            TH0R,   8,
//            TH0L,   8,
            Offset (0xB0),
            B0P0,8,B0P1,8, //<-
//            Offset (0xB4),
//            Offset (0xB6),
//            Offset (0xB8),
//            Offset (0xBA),
//            Offset (0xBC),
            Offset (0xBE),
            B0T0,8,B0T1,8, //!
            B010,8,B011,8, //!
            B020,8,B021,8, //!
            B030,8,B031,8, //<-
            B040,8,B041,8, //!
            Offset (0xD0),
            B1P0,8,B1P1,8, //!
//            Offset (0xD4),
//            Offset (0xD6),
//            Offset (0xD8),
//            Offset (0xDA),
//            Offset (0xDC),
            Offset (0xDE),
            B1T0,8,B1T1,8, //!
            B110,8,B111,8, //!
            B120,8,B121,8, //!
            B130,8,B131,8, //!
            B140,8,B141,8, //!
//            Offset (0xF0),
//            Offset (0xF2),
            Offset (0xF4),
            B0N0,8,B0N1,8, //<-
//            Offset (0xF8),
//            Offset (0xFA),
            Offset (0xFC),
            B1N0,8,B1N1,8, //<-
        }

        OperationRegion (ECR2, EmbeddedControl, 0x18, 0x28)
        Field (ECR2, ByteAcc, NoLock, Preserve)
        {
//            PRTC,   8,
//            SSTS,   5,
//                ,   1,
//            ALFG,   1,
//            CDFG,   1,
//            ADDR,   8,
//            CMDB,   8,
            Offset (0x04), //<-
            BDAX,   256, //<-
//            BCNT,   8,
//                ,   1,
//            ALAD,   7,
//            ALD0,   8,
//            ALD1,   8
        }

        OperationRegion (ECR3, EmbeddedControl, 0x40, 0x28)
        Field (ECR3, ByteAcc, NoLock, Preserve)
        {
//            PRT2,   8,
//            SST2,   5,
//                ,   1,
//            ALF2,   1,
//            CDF2,   1,
//            ADD2,   8,
//            CMD2,   8,
            Offset (0x04),
            BDAY,   256, //<-
//            BCN2,   8,
//                ,   1,
//            ALA2,   7,
//            ALR0,   8,
//            ALR1,   8
        }

        Field (ECR2, ByteAcc, NoLock, Preserve)
        {
            Offset (0x04),
            T2B0,8,T2B1,8, //<-
        }

//        IndexField (BRAI, BRAD, ByteAcc, NoLock, Preserve)
//        {
//            Offset (0x8F),
//            PBSY,   8,
//            EPWS,   8,
//            EB0S,   8,
//            EB1S,   8,
//            EB0T,   8,
//            EB1T,   8,
//            Offset (0x98),
//            ECPU,   8,
//            ECRT,   8,
//            EPSV,   8,
//            Offset (0xA0),
//            B0V0,8,B0V1,8, //<-
//            B0R0,8,B0R1,8, //<-
//            B0F0,8,B0F1,8, //<-
//            B0M0,8,B0M1,8, //<-
//            B0S0,8,B0S1,8, //<-
//            B0C0,8,B0C1,8, //<-
//            B0D0,8,B0D1,8, //<-
//            B0D4,8,B0D5,8, //<-
//            B1V0,8,B1V1,8, //<-
//            B1R0,8,B1R1,8, //<-
//            B1F0,8,B1F1,8, //<-
//            B1M0,8,B1M1,8, //<-
//            B1S0,8,B1S1,8, //<-
//            B1C0,8,B1C1,8, //<-
//            B1D0,8,B1D1,8, //<-
//            B1D2,8,B1D3,8 //<-
//        }
        Method (RE1B, 1, NotSerialized) //<-
        { //<-
            OperationRegion(ERAM, EmbeddedControl, Arg0, 1) //<-
            Field(ERAM, ByteAcc, NoLock, Preserve) { BYTE, 8 } //<-
            Return(BYTE) //<-
        } //<-
        Method (RECB, 2, Serialized) //<-
        { //<-
            ShiftRight(Arg1, 3, Arg1) //<-
            Name(TEMP, Buffer(Arg1) { }) //<-
            Add(Arg0, Arg1, Arg1) //<-
            Store(0, Local0) //<-
            While (LLess(Arg0, Arg1)) //<-
            { //<-
                Store(RE1B(Arg0), Index(TEMP, Local0)) //<-
                Increment(Arg0) //<-
                Increment(Local0) //<-
            } //<-
            Return(TEMP) //<-
        } //<-
        Method (WE1B, 2, NotSerialized) //<-
        { //<-
            OperationRegion(ERAM, EmbeddedControl, Arg0, 1) //<-
            Field(ERAM, ByteAcc, NoLock, Preserve) { BYTE, 8 } //<-
            Store(Arg1, BYTE) //<-
        } //<-
        Method (WECB, 3, Serialized) //<-
        { //<-
            ShiftRight(Arg1, 3, Arg1) //<-
            Name(TEMP, Buffer(Arg1) { }) //<-
            Store(Arg2, TEMP) //<-
            Add(Arg0, Arg1, Arg1) //<-
            Store(0, Local0) //<-
            While (LLess(Arg0, Arg1)) //<-
            { //<-
                WE1B(Arg0, DerefOf(Index(TEMP, Local0))) //<-
                Increment(Arg0) //<-
                Increment(Local0) //<-
            } //<-
        } //<-

        // Actual patches now
//        Method (BIF0, 0, NotSerialized)
//        {
//            If (ECAV ())
//            {
//                If (BSLF)
//                {
//                    Store (B1B2(B1M0,B1M1), Local0) //<-
//                }
//                Else
//                {
//                    Store (B1B2(B0M0,B0M1), Local0) //<-
//                }

//                If (LNotEqual (Local0, 0xFFFF))
//                {
//                    ShiftRight (Local0, 0x0F, Local1)
//                    And (Local1, One, Local1)
//                    XOr (Local1, One, Local0)
//                }
//            }
//            Else
//            {
//                Store (Ones, Local0)
//            }

//            Return (Local0)
//        }

//        Method (BIF1, 0, NotSerialized)
//        {
//            If (ECAV ())
//            {
//                If (BSLF)
//                {
//                    Store (B1B2(B1D0,B1D1), Local0) //<-
//                }
//                Else
//                {
//                    Store (B1B2(B0D0,B0D1), Local0) //<-
//                }

//                And (Local0, 0xFFFF, Local0)
//            }
//            Else
//            {
//                Store (Ones, Local0)
//            }

//            Return (Local0)
//        }

//        Method (BIF2, 0, NotSerialized)
//        {
//            If (ECAV ())
//            {
//                If (BSLF)
//                {
//                    Store (B1B2(B1F0,B1F1), Local0) //<-
//                }
//                Else
//                {
//                    Store (B1B2(B0F0,B0F1), Local0) //<-
//                }

//                And (Local0, 0xFFFF, Local0)
//            }
//            Else
//            {
//                Store (Ones, Local0)
//            }

//            Return (Local0)
//        }

//        Method (BIF3, 0, NotSerialized)
//        {
//            If (ECAV ())
//            {
//                If (BSLF)
//                {
//                    Store (B1B2(B1M0,B1M1), Local0) //<-
//                }
//                Else
//                {
//                    Store (B1B2(B0M0,B0M1), Local0) //<-
//                }

//                If (LNotEqual (Local0, 0xFFFF))
//                {
//                    ShiftRight (Local0, 0x09, Local0)
//                    And (Local0, One, Local0)
//                    XOr (Local0, One, Local0)
//                }
//            }
//            Else
//            {
//                Store (Ones, Local0)
//            }

//            Return (Local0)
//        }

//        Method (BIF4, 0, NotSerialized)
//        {
//            If (ECAV ())
//            {
//                If (BSLF)
//                {
//                    Store (B1B2(B1D2,B1D3), Local0) //<-
//                }
//                Else
//                {
//                    Store (B1B2(B0D4,B0D5), Local0) //<-
//                }
//            }
//            Else
//            {
//                Store (Ones, Local0)
//            }

//            Return (Local0)
//        }

//        Method (BIFA, 0, NotSerialized)
//        {
//            If (ECAV ())
//            {
//                If (BSLF)
//                {
//                    Store (B1B2(B1N0,B1N1), Local0) //<-
//                }
//                Else
//                {
//                    Store (B1B2(B0N0,B0N1), Local0) //<-
//                }
//            }
//            Else
//            {
//                Store (Ones, Local0)
//            }
//            Return (Local0)
//        }

//        Method (BSTS, 0, NotSerialized)
//        {
//            If (BSLF)
//            {
//                Store (B1B2(B1S0,B1S1), Local0) //<-
//            }
//            Else
//            {
//                Store (B1B2(B0S0,B0S1), Local0) //<-
//            }
//            Return (Local0)
//        }

//        Method (BCRT, 0, NotSerialized)
//        {
//            If (BSLF)
//            {
//                Store (B1B2(B1C0,B1C1), Local0) //<-
//            }
//            Else
//            {
//                Store (B1B2(B0C0,B0C1), Local0) //<-
//            }

//            Return (Local0)
//        }

//        Method (BRCP, 0, NotSerialized)
//        {
//            If (BSLF)
//            {
//                Store (B1B2(B1R0,B1R1), Local0) //<-
//            }
//            Else
//            {
//                Store (B1B2(B0R0,B0R1), Local0) //<-
//            }

//            If (LEqual (Local0, 0xFFFF))
//            {
//                Store (Ones, Local0)
//            }

//            Return (Local0)
//        }

//        Method (BVOT, 0, NotSerialized)
//        {
//            If (BSLF)
//            {
//                Store (B1B2(B1V0,B1V1), Local0) //<-
//            }
//            Else
//            {
//                Store (B1B2(B0V0,B0V1), Local0) //<-
//            }

//            Return (Local0)
//        }

        Method (SMBR, 3, Serialized)
        {
            Store (Package (0x03)
                {
                    0x07,
                    Zero,
                    Zero
                }, Local0)
            If (LNot (ECAV ()))
            {
                Return (Local0)
            }

            If (LNotEqual (Arg0, RDBL))
            {
                If (LNotEqual (Arg0, RDWD))
                {
                    If (LNotEqual (Arg0, RDBT))
                    {
                        If (LNotEqual (Arg0, RCBT))
                        {
                            If (LNotEqual (Arg0, RDQK))
                            {
                                Return (Local0)
                            }
                        }
                    }
                }
            }

            Acquire (MUEC, 0xFFFF)
            Store (PRTC, Local1)
            Store (Zero, Local2)
            While (LNotEqual (Local1, Zero))
            {
                Stall (0x0A)
                Increment (Local2)
                If (LGreater (Local2, 0x03E8))
                {
                    Store (SBBY, Index (Local0, Zero))
                    Store (Zero, Local1)
                }
                Else
                {
                    Store (PRTC, Local1)
                }
            }

            If (LLessEqual (Local2, 0x03E8))
            {
                ShiftLeft (Arg1, One, Local3)
                Or (Local3, One, Local3)
                Store (Local3, ADDR)
                If (LNotEqual (Arg0, RDQK))
                {
                    If (LNotEqual (Arg0, RCBT))
                    {
                        Store (Arg2, CMDB)
                    }
                }

                WECB(0x1c,256,Zero) //<-
                Store (Arg0, PRTC)
                Store (SWTC (Arg0), Index (Local0, Zero))
                If (LEqual (DerefOf (Index (Local0, Zero)), Zero))
                {
                    If (LEqual (Arg0, RDBL))
                    {
                        Store (BCNT, Index (Local0, One))
                        Store (RECB(0x1c,256), Index (Local0, 0x02)) //<-
                    }

                    If (LEqual (Arg0, RDWD))
                    {
                        Store (0x02, Index (Local0, One))
                        Store (B1B2(T2B0,T2B1), Index (Local0, 0x02)) //<-
                    }

                    If (LEqual (Arg0, RDBT))
                    {
                        Store (One, Index (Local0, One))
                        Store (DAT0, Index (Local0, 0x02))
                    }

                    If (LEqual (Arg0, RCBT))
                    {
                        Store (One, Index (Local0, One))
                        Store (DAT0, Index (Local0, 0x02))
                    }
                }
            }

            Release (MUEC)
            Return (Local0)
        }

        Method (SMBW, 5, Serialized)
        {
            Store (Package (0x01)
                {
                    0x07
                }, Local0)
            If (LNot (ECAV ()))
            {
                Return (Local0)
            }

            If (LNotEqual (Arg0, WRBL))
            {
                If (LNotEqual (Arg0, WRWD))
                {
                    If (LNotEqual (Arg0, WRBT))
                    {
                        If (LNotEqual (Arg0, SDBT))
                        {
                            If (LNotEqual (Arg0, WRQK))
                            {
                                Return (Local0)
                            }
                        }
                    }
                }
            }

            Acquire (MUEC, 0xFFFF)
            Store (PRTC, Local1)
            Store (Zero, Local2)
            While (LNotEqual (Local1, Zero))
            {
                Stall (0x0A)
                Increment (Local2)
                If (LGreater (Local2, 0x03E8))
                {
                    Store (SBBY, Index (Local0, Zero))
                    Store (Zero, Local1)
                }
                Else
                {
                    Store (PRTC, Local1)
                }
            }

            If (LLessEqual (Local2, 0x03E8))
            {
                WECB(0x1c,256,Zero) //<-
                ShiftLeft (Arg1, One, Local3)
                Store (Local3, ADDR)
                If (LNotEqual (Arg0, WRQK))
                {
                    If (LNotEqual (Arg0, SDBT))
                    {
                        Store (Arg2, CMDB)
                    }
                }

                If (LEqual (Arg0, WRBL))
                {
                    Store (Arg3, BCNT)
                    WECB(0x1c,256,Arg4) //<-
                }

                If (LEqual (Arg0, WRWD))
                {
                    Store(Arg4, T2B0) Store(ShiftRight(Arg4,8), T2B1) //<-
                }

                If (LEqual (Arg0, WRBT))
                {
                    Store (Arg4, DAT0)
                }

                If (LEqual (Arg0, SDBT))
                {
                    Store (Arg4, DAT0)
                }

                Store (Arg0, PRTC)
                Store (SWTC (Arg0), Index (Local0, Zero))
            }

            Release (MUEC)
            Return (Local0)
        }

        Method (ECSB, 7, NotSerialized)
        {
            Store (Package (0x05)
                {
                    0x11,
                    Zero,
                    Zero,
                    Zero,
                    Buffer (0x20) {}
                }, Local1)
            If (LGreater (Arg0, One))
            {
                Return (Local1)
            }

            If (ECAV ())
            {
                Acquire (MUEC, 0xFFFF)
                If (LEqual (Arg0, Zero))
                {
                    Store (PRTC, Local0)
                }
                Else
                {
                    Store (PRT2, Local0)
                }

                Store (Zero, Local2)
                While (LNotEqual (Local0, Zero))
                {
                    Stall (0x0A)
                    Increment (Local2)
                    If (LGreater (Local2, 0x03E8))
                    {
                        Store (SBBY, Index (Local1, Zero))
                        Store (Zero, Local0)
                    }
                    ElseIf (LEqual (Arg0, Zero))
                    {
                        Store (PRTC, Local0)
                    }
                    Else
                    {
                        Store (PRT2, Local0)
                    }
                }

                If (LLessEqual (Local2, 0x03E8))
                {
                    If (LEqual (Arg0, Zero))
                    {
                        Store (Arg2, ADDR)
                        Store (Arg3, CMDB)
                        If (LOr (LEqual (Arg1, 0x0A), LEqual (Arg1, 0x0B)))
                        {
                            Store (DerefOf (Index (Arg6, Zero)), BCNT)
                            WECB(0x1c,256,DerefOf (Index (Arg6, One))) //<-
                        }
                        Else
                        {
                            Store (Arg4, DAT0)
                            Store (Arg5, DAT1)
                        }

                        Store (Arg1, PRTC)
                    }
                    Else
                    {
                        Store (Arg2, ADD2)
                        Store (Arg3, CMD2)
                        If (LOr (LEqual (Arg1, 0x0A), LEqual (Arg1, 0x0B)))
                        {
                            Store (DerefOf (Index (Arg6, Zero)), BCN2)
                            WECB(0x44,256,DerefOf (Index (Arg6, One))) //<-
                        }
                        Else
                        {
                            Store (Arg4, DA20)
                            Store (Arg5, DA21)
                        }

                        Store (Arg1, PRT2)
                    }

                    Store (0x7F, Local0)
                    If (LEqual (Arg0, Zero))
                    {
                        While (PRTC)
                        {
                            Sleep (One)
                            Decrement (Local0)
                        }
                    }
                    Else
                    {
                        While (PRT2)
                        {
                            Sleep (One)
                            Decrement (Local0)
                        }
                    }

                    If (Local0)
                    {
                        If (LEqual (Arg0, Zero))
                        {
                            Store (SSTS, Local0)
                            Store (DAT0, Index (Local1, One))
                            Store (DAT1, Index (Local1, 0x02))
                            Store (BCNT, Index (Local1, 0x03))
                            Store (RECB(0x1c,256), Index (Local1, 0x04)) //<-
                        }
                        Else
                        {
                            Store (SST2, Local0)
                            Store (DA20, Index (Local1, One))
                            Store (DA21, Index (Local1, 0x02))
                            Store (BCN2, Index (Local1, 0x03))
                            Store (RECB(0x44,256), Index (Local1, 0x04)) //<-
                        }

                        And (Local0, 0x1F, Local0)
                        If (Local0)
                        {
                            Add (Local0, 0x10, Local0)
                        }

                        Store (Local0, Index (Local1, Zero))
                    }
                    Else
                    {
                        Store (0x10, Index (Local1, Zero))
                    }
                }

                Release (MUEC)
            }

            Return (Local1)
        }

        Method (TACH, 1, Serialized)
        {
            Name (XTXO, Zero)
            If (ECAV ())
            {
                While (One)
                {
                    Store (Arg0, XTXO)
                    If (LEqual (XTXO, Zero))
                    {
                        Store (B1B2(AH00,AH01), Local0) //<-
                        Break
                    }
                    ElseIf (LEqual (XTXO, One))
                    {
                        Store (B1B2(AH10,AH11), Local0) //<-
                        Break
                    }
                    Else
                    {
                        Return (Ones)
                    }

                    Break
                }

                Multiply (Local0, 0x02, Local0)
                If (LNotEqual (Local0, Zero))
                {
                    Divide (0x0041CDB4, Local0, Local1, Local0)
                    Return (Local0)
                }
                Else
                {
                    Return (Ones)
                }
            }
            Else
            {
                Return (Ones)
            }
        }
    }

//    Scope (_SB.ATKD)
//    {
//        Method (WMNB, 3, NotSerialized)
//        {
//            CreateDWordField (Arg2, Zero, IIA0)
//            And (Arg1, 0xFFFFFFFF, Local0)

//            If (LEqual (Local0, 0x53545344))
//            {
//                If (LEqual (IIA0, 0x00120044))
//                {
//                    If (And (^^PCI0.LPCB.EC0.EPWS, 0x06))
//                    {
//                        And (^^PCI0.LPCB.EC0.EPWS, 0x06, Local0)
//                        Store (Zero, Local1)
//                        If (LEqual (Local0, 0x02))
//                        {
//                            Store (B1B2(^^PCI0.LPCB.EC0.B0R0,^^PCI0.LPCB.EC0.B0R1), Local1) //<-
//                        }
//                        ElseIf (LEqual (Local0, 0x04))
//                        {
//                            Store (B1B2(^^PCI0.LPCB.EC0.B1R0,^^PCI0.LPCB.EC0.B1R1), Local1) //<-
//                        }
//                        Else
//                        {
//                            Store (Add (B1B2(^^PCI0.LPCB.EC0.B0R0,^^PCI0.LPCB.EC0.B0R1), B1B2(^^PCI0.LPCB.EC0.B1R0,^^PCI0.LPCB.EC0.B1R1)), Local1) //<-
//                        }
//                        Return (Add (Local1, 0x00010000))
//                    }
//                    Return (0x0001FFFF)
//                }
//                If (LEqual (IIA0, 0x00120047))
//                {
//                    If (And (^^PCI0.LPCB.EC0.EPWS, 0x06))
//                    {
//                        Store (Zero, Local1)
//                        If (LEqual (Local0, 0x02))
//                        {
//                            Store (B1B2(^^PCI0.LPCB.EC0.B0D0,^^PCI0.LPCB.EC0.B0D1), Local1) //<-
//                        }
//                        ElseIf (LEqual (Local0, 0x04))
//                        {
//                            Store (B1B2(^^PCI0.LPCB.EC0.B1D0,^^PCI0.LPCB.EC0.B1D1), Local1) //<-
//                        }
//                        Else
//                        {
//                            Store (Add (B1B2(^^PCI0.LPCB.EC0.B0D0,^^PCI0.LPCB.EC0.B0D1), B1B2(^^PCI0.LPCB.EC0.B1D0,^^PCI0.LPCB.EC0.B1D1)), Local1) //<-
//                        }
//                        Return (Add (Local1, 0x00010000))
//                    }
//                    Return (0x0001FFFF)
//                }
//                If (LEqual (IIA0, 0x00120049))
//                {
//                    If (And (^^PCI0.LPCB.EC0.EPWS, 0x06))
//                    {
//                        Store (Zero, Local1)
//                        If (LEqual (Local0, 0x02))
//                        {
//                            Store (B1B2(^^PCI0.LPCB.EC0.B0F0,^^PCI0.LPCB.EC0.B0F1), Local1) //<-
//                        }
//                        ElseIf (LEqual (Local0, 0x04))
//                        {
//                            Store (B1B2(^^PCI0.LPCB.EC0.B1F0,^^PCI0.LPCB.EC0.B1F1), Local1) //<-
//                        }
//                        Else
//                        {
//                            Store (Add (B1B2(^^PCI0.LPCB.EC0.B0F0,^^PCI0.LPCB.EC0.B0F1), B1B2(^^PCI0.LPCB.EC0.B1F0,^^PCI0.LPCB.EC0.B1F1)), Local1) //<-
//                        }
//                        Return (Add (Local1, 0x00010000))
//                    }
//                    Return (0x0001FFFF)
//                }
//            }
//            Return (XMNB(Arg0, Arg1, Arg2))
//        }
//    }

    Scope (_SB.PCI0.BAT0)
    {
//        Method (CBST, 0, NotSerialized)
//        {
//            If (PUNT)
//            {
//                Store (B1B2(^^LPCB.EC0.B0D4,^^LPCB.EC0.B0D5), Index (PBST, 0x03)) //<-
//                Store (DerefOf (Index (PBST, 0x03)), Local0)
//                Multiply (DerefOf (Index (PBST, One)), Local0, Index (PBST, One))
//                Divide (DerefOf (Index (PBST, One)), 0x03E8, Local1, Index (PBST, One))
//                Multiply (DerefOf (Index (PBST, 0x02)), Local0, Index (PBST, 0x02))
//                Divide (DerefOf (Index (PBST, 0x02)), 0x03E8, Local1, Index (PBST, 0x02))
//            }
//        }

        Method (_BIX, 0, NotSerialized)  // _BIX: Battery Information Extended
        {
            If (LNot (^^LPCB.EC0.BATP (Zero)))
            {
                Return (NBIX)
            }
            If (LEqual (^^LPCB.EC0.GBTT (Zero), 0xFF))
            {
                Return (NBIX)
            }
            _BIF ()
            Store (DerefOf (Index (PBIF, Zero)), Index (BIXT, One))
            Store (DerefOf (Index (PBIF, One)), Index (BIXT, 0x02))
            Store (DerefOf (Index (PBIF, 0x02)), Index (BIXT, 0x03))
            Store (DerefOf (Index (PBIF, 0x03)), Index (BIXT, 0x04))
            Store (DerefOf (Index (PBIF, 0x04)), Index (BIXT, 0x05))
            Store (DerefOf (Index (PBIF, 0x05)), Index (BIXT, 0x06))
            Store (DerefOf (Index (PBIF, 0x06)), Index (BIXT, 0x07))
            Store (DerefOf (Index (PBIF, 0x07)), Index (BIXT, 0x0E))
            Store (DerefOf (Index (PBIF, 0x08)), Index (BIXT, 0x0F))
            Store (DerefOf (Index (PBIF, 0x09)), Index (BIXT, 0x10))
            Store (DerefOf (Index (PBIF, 0x0A)), Index (BIXT, 0x11))
            Store (DerefOf (Index (PBIF, 0x0B)), Index (BIXT, 0x12))
            Store (DerefOf (Index (PBIF, 0x0C)), Index (BIXT, 0x13))
            If (LEqual (DerefOf (Index (BIXT, One)), One))
            {
                Store (Zero, Index (BIXT, One))
                Store (DerefOf (Index (BIXT, 0x05)), Local0)
                Multiply (DerefOf (Index (BIXT, 0x02)), Local0, Index (BIXT, 0x02))
                Multiply (DerefOf (Index (BIXT, 0x03)), Local0, Index (BIXT, 0x03))
                Multiply (DerefOf (Index (BIXT, 0x06)), Local0, Index (BIXT, 0x06))
                Multiply (DerefOf (Index (BIXT, 0x07)), Local0, Index (BIXT, 0x07))
                Multiply (DerefOf (Index (BIXT, 0x0E)), Local0, Index (BIXT, 0x0E))
                Multiply (DerefOf (Index (BIXT, 0x0F)), Local0, Index (BIXT, 0x0F))
                Divide (DerefOf (Index (BIXT, 0x02)), 0x03E8, Local0, Index (BIXT, 0x02))
                Divide (DerefOf (Index (BIXT, 0x03)), 0x03E8, Local0, Index (BIXT, 0x03))
                Divide (DerefOf (Index (BIXT, 0x06)), 0x03E8, Local0, Index (BIXT, 0x06))
                Divide (DerefOf (Index (BIXT, 0x07)), 0x03E8, Local0, Index (BIXT, 0x07))
                Divide (DerefOf (Index (BIXT, 0x0E)), 0x03E8, Local0, Index (BIXT, 0x0E))
                Divide (DerefOf (Index (BIXT, 0x0F)), 0x03E8, Local0, Index (BIXT, 0x0F))
            }
            Store (B1B2(^^LPCB.EC0.B030,^^LPCB.EC0.B031), Index (BIXT, 0x08)) //<-
            Store (0x0001869F, Index (BIXT, 0x09))
            Return (BIXT)
        }
    }

    Method (B1B2, 2, NotSerialized) { Return(Or(Arg0, ShiftLeft(Arg1, 8))) } //<-
}
//EOF
