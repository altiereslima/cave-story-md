# ---------------------------------------------------------------------------
# LZ4W unpacker for MC68000
# by Stephane Dallongeville @2017
#
# lz4w_unpack_a: A0 = Source / A1 = Destination / Returns unpacked size
# u16 lz4w_unpack(const u8 *src, u8 *dest);  /* c prototype */
# ---------------------------------------------------------------------------
    .align    2
    .globl    lz4w_unpack
    .globl    lz4w_unpack_a

lz4w_unpack:
    move.l  4(%sp),%a0              | a0 = src
    move.l  8(%sp),%a1              | a1 = dst

lz4w_unpack_a:
    movem.l %a2-%a4,-(%sp)

    lea     .next,%a3               | used for fast jump
    moveq   #0,%d1

.next:
    moveq   #0,%d0
    move.b  (%a0)+,%d0              | d0 = literal & match length
    move.b  (%a0)+,%d1              | d1 = match offset

    add.w   %d0,%d0
    add.w   %d0,%d0

.jump_base:
    move.l  (.jump_table-.jump_base)-2(%pc,%d0.w),%a4
    jmp     (%a4)

    .align 2
.jump_table:

    .long .lit0_mat0
    .long .lit0_mat1
    .long .lit0_mat2
    .long .lit0_mat3
    .long .lit0_mat4
    .long .lit0_mat5
    .long .lit0_mat6
    .long .lit0_mat7
    .long .lit0_mat8
    .long .lit0_mat9
    .long .lit0_matA
    .long .lit0_matB
    .long .lit0_matC
    .long .lit0_matD
    .long .lit0_matE
    .long .lit0_matF
    .long .lit1_mat0
    .long .lit1_mat1
    .long .lit1_mat2
    .long .lit1_mat3
    .long .lit1_mat4
    .long .lit1_mat5
    .long .lit1_mat6
    .long .lit1_mat7
    .long .lit1_mat8
    .long .lit1_mat9
    .long .lit1_matA
    .long .lit1_matB
    .long .lit1_matC
    .long .lit1_matD
    .long .lit1_matE
    .long .lit1_matF
    .long .lit2_mat0
    .long .lit2_mat1
    .long .lit2_mat2
    .long .lit2_mat3
    .long .lit2_mat4
    .long .lit2_mat5
    .long .lit2_mat6
    .long .lit2_mat7
    .long .lit2_mat8
    .long .lit2_mat9
    .long .lit2_matA
    .long .lit2_matB
    .long .lit2_matC
    .long .lit2_matD
    .long .lit2_matE
    .long .lit2_matF
    .long .lit3_mat0
    .long .lit3_mat1
    .long .lit3_mat2
    .long .lit3_mat3
    .long .lit3_mat4
    .long .lit3_mat5
    .long .lit3_mat6
    .long .lit3_mat7
    .long .lit3_mat8
    .long .lit3_mat9
    .long .lit3_matA
    .long .lit3_matB
    .long .lit3_matC
    .long .lit3_matD
    .long .lit3_matE
    .long .lit3_matF
    .long .lit4_mat0
    .long .lit4_mat1
    .long .lit4_mat2
    .long .lit4_mat3
    .long .lit4_mat4
    .long .lit4_mat5
    .long .lit4_mat6
    .long .lit4_mat7
    .long .lit4_mat8
    .long .lit4_mat9
    .long .lit4_matA
    .long .lit4_matB
    .long .lit4_matC
    .long .lit4_matD
    .long .lit4_matE
    .long .lit4_matF
    .long .lit5_mat0
    .long .lit5_mat1
    .long .lit5_mat2
    .long .lit5_mat3
    .long .lit5_mat4
    .long .lit5_mat5
    .long .lit5_mat6
    .long .lit5_mat7
    .long .lit5_mat8
    .long .lit5_mat9
    .long .lit5_matA
    .long .lit5_matB
    .long .lit5_matC
    .long .lit5_matD
    .long .lit5_matE
    .long .lit5_matF
    .long .lit6_mat0
    .long .lit6_mat1
    .long .lit6_mat2
    .long .lit6_mat3
    .long .lit6_mat4
    .long .lit6_mat5
    .long .lit6_mat6
    .long .lit6_mat7
    .long .lit6_mat8
    .long .lit6_mat9
    .long .lit6_matA
    .long .lit6_matB
    .long .lit6_matC
    .long .lit6_matD
    .long .lit6_matE
    .long .lit6_matF
    .long .lit7_mat0
    .long .lit7_mat1
    .long .lit7_mat2
    .long .lit7_mat3
    .long .lit7_mat4
    .long .lit7_mat5
    .long .lit7_mat6
    .long .lit7_mat7
    .long .lit7_mat8
    .long .lit7_mat9
    .long .lit7_matA
    .long .lit7_matB
    .long .lit7_matC
    .long .lit7_matD
    .long .lit7_matE
    .long .lit7_matF
    .long .lit8_mat0
    .long .lit8_mat1
    .long .lit8_mat2
    .long .lit8_mat3
    .long .lit8_mat4
    .long .lit8_mat5
    .long .lit8_mat6
    .long .lit8_mat7
    .long .lit8_mat8
    .long .lit8_mat9
    .long .lit8_matA
    .long .lit8_matB
    .long .lit8_matC
    .long .lit8_matD
    .long .lit8_matE
    .long .lit8_matF
    .long .lit9_mat0
    .long .lit9_mat1
    .long .lit9_mat2
    .long .lit9_mat3
    .long .lit9_mat4
    .long .lit9_mat5
    .long .lit9_mat6
    .long .lit9_mat7
    .long .lit9_mat8
    .long .lit9_mat9
    .long .lit9_matA
    .long .lit9_matB
    .long .lit9_matC
    .long .lit9_matD
    .long .lit9_matE
    .long .lit9_matF
    .long .litA_mat0
    .long .litA_mat1
    .long .litA_mat2
    .long .litA_mat3
    .long .litA_mat4
    .long .litA_mat5
    .long .litA_mat6
    .long .litA_mat7
    .long .litA_mat8
    .long .litA_mat9
    .long .litA_matA
    .long .litA_matB
    .long .litA_matC
    .long .litA_matD
    .long .litA_matE
    .long .litA_matF
    .long .litB_mat0
    .long .litB_mat1
    .long .litB_mat2
    .long .litB_mat3
    .long .litB_mat4
    .long .litB_mat5
    .long .litB_mat6
    .long .litB_mat7
    .long .litB_mat8
    .long .litB_mat9
    .long .litB_matA
    .long .litB_matB
    .long .litB_matC
    .long .litB_matD
    .long .litB_matE
    .long .litB_matF
    .long .litC_mat0
    .long .litC_mat1
    .long .litC_mat2
    .long .litC_mat3
    .long .litC_mat4
    .long .litC_mat5
    .long .litC_mat6
    .long .litC_mat7
    .long .litC_mat8
    .long .litC_mat9
    .long .litC_matA
    .long .litC_matB
    .long .litC_matC
    .long .litC_matD
    .long .litC_matE
    .long .litC_matF
    .long .litD_mat0
    .long .litD_mat1
    .long .litD_mat2
    .long .litD_mat3
    .long .litD_mat4
    .long .litD_mat5
    .long .litD_mat6
    .long .litD_mat7
    .long .litD_mat8
    .long .litD_mat9
    .long .litD_matA
    .long .litD_matB
    .long .litD_matC
    .long .litD_matD
    .long .litD_matE
    .long .litD_matF
    .long .litE_mat0
    .long .litE_mat1
    .long .litE_mat2
    .long .litE_mat3
    .long .litE_mat4
    .long .litE_mat5
    .long .litE_mat6
    .long .litE_mat7
    .long .litE_mat8
    .long .litE_mat9
    .long .litE_matA
    .long .litE_matB
    .long .litE_matC
    .long .litE_matD
    .long .litE_matE
    .long .litE_matF
    .long .litF_mat0
    .long .litF_mat1
    .long .litF_mat2
    .long .litF_mat3
    .long .litF_mat4
    .long .litF_mat5
    .long .litF_mat6
    .long .litF_mat7
    .long .litF_mat8
    .long .litF_mat9
    .long .litF_matA
    .long .litF_matB
    .long .litF_matC
    .long .litF_matD
    .long .litF_matE
    .long .litF_matF

.lm_len_FF:
	move.w  (%a2)+,(%a1)+
.lm_len_FE:
	move.w  (%a2)+,(%a1)+
.lm_len_FD:
	move.w  (%a2)+,(%a1)+
.lm_len_FC:
	move.w  (%a2)+,(%a1)+
.lm_len_FB:
	move.w  (%a2)+,(%a1)+
.lm_len_FA:
	move.w  (%a2)+,(%a1)+
.lm_len_F9:
	move.w  (%a2)+,(%a1)+
.lm_len_F8:
	move.w  (%a2)+,(%a1)+
.lm_len_F7:
	move.w  (%a2)+,(%a1)+
.lm_len_F6:
	move.w  (%a2)+,(%a1)+
.lm_len_F5:
	move.w  (%a2)+,(%a1)+
.lm_len_F4:
	move.w  (%a2)+,(%a1)+
.lm_len_F3:
	move.w  (%a2)+,(%a1)+
.lm_len_F2:
	move.w  (%a2)+,(%a1)+
.lm_len_F1:
	move.w  (%a2)+,(%a1)+
.lm_len_F0:
	move.w  (%a2)+,(%a1)+
.lm_len_EF:
	move.w  (%a2)+,(%a1)+
.lm_len_EE:
	move.w  (%a2)+,(%a1)+
.lm_len_ED:
	move.w  (%a2)+,(%a1)+
.lm_len_EC:
	move.w  (%a2)+,(%a1)+
.lm_len_EB:
	move.w  (%a2)+,(%a1)+
.lm_len_EA:
	move.w  (%a2)+,(%a1)+
.lm_len_E9:
	move.w  (%a2)+,(%a1)+
.lm_len_E8:
	move.w  (%a2)+,(%a1)+
.lm_len_E7:
	move.w  (%a2)+,(%a1)+
.lm_len_E6:
	move.w  (%a2)+,(%a1)+
.lm_len_E5:
	move.w  (%a2)+,(%a1)+
.lm_len_E4:
	move.w  (%a2)+,(%a1)+
.lm_len_E3:
	move.w  (%a2)+,(%a1)+
.lm_len_E2:
	move.w  (%a2)+,(%a1)+
.lm_len_E1:
	move.w  (%a2)+,(%a1)+
.lm_len_E0:
	move.w  (%a2)+,(%a1)+
.lm_len_DF:
	move.w  (%a2)+,(%a1)+
.lm_len_DE:
	move.w  (%a2)+,(%a1)+
.lm_len_DD:
	move.w  (%a2)+,(%a1)+
.lm_len_DC:
	move.w  (%a2)+,(%a1)+
.lm_len_DB:
	move.w  (%a2)+,(%a1)+
.lm_len_DA:
	move.w  (%a2)+,(%a1)+
.lm_len_D9:
	move.w  (%a2)+,(%a1)+
.lm_len_D8:
	move.w  (%a2)+,(%a1)+
.lm_len_D7:
	move.w  (%a2)+,(%a1)+
.lm_len_D6:
	move.w  (%a2)+,(%a1)+
.lm_len_D5:
	move.w  (%a2)+,(%a1)+
.lm_len_D4:
	move.w  (%a2)+,(%a1)+
.lm_len_D3:
	move.w  (%a2)+,(%a1)+
.lm_len_D2:
	move.w  (%a2)+,(%a1)+
.lm_len_D1:
	move.w  (%a2)+,(%a1)+
.lm_len_D0:
	move.w  (%a2)+,(%a1)+
.lm_len_CF:
	move.w  (%a2)+,(%a1)+
.lm_len_CE:
	move.w  (%a2)+,(%a1)+
.lm_len_CD:
	move.w  (%a2)+,(%a1)+
.lm_len_CC:
	move.w  (%a2)+,(%a1)+
.lm_len_CB:
	move.w  (%a2)+,(%a1)+
.lm_len_CA:
	move.w  (%a2)+,(%a1)+
.lm_len_C9:
	move.w  (%a2)+,(%a1)+
.lm_len_C8:
	move.w  (%a2)+,(%a1)+
.lm_len_C7:
	move.w  (%a2)+,(%a1)+
.lm_len_C6:
	move.w  (%a2)+,(%a1)+
.lm_len_C5:
	move.w  (%a2)+,(%a1)+
.lm_len_C4:
	move.w  (%a2)+,(%a1)+
.lm_len_C3:
	move.w  (%a2)+,(%a1)+
.lm_len_C2:
	move.w  (%a2)+,(%a1)+
.lm_len_C1:
	move.w  (%a2)+,(%a1)+
.lm_len_C0:
	move.w  (%a2)+,(%a1)+
.lm_len_BF:
	move.w  (%a2)+,(%a1)+
.lm_len_BE:
	move.w  (%a2)+,(%a1)+
.lm_len_BD:
	move.w  (%a2)+,(%a1)+
.lm_len_BC:
	move.w  (%a2)+,(%a1)+
.lm_len_BB:
	move.w  (%a2)+,(%a1)+
.lm_len_BA:
	move.w  (%a2)+,(%a1)+
.lm_len_B9:
	move.w  (%a2)+,(%a1)+
.lm_len_B8:
	move.w  (%a2)+,(%a1)+
.lm_len_B7:
	move.w  (%a2)+,(%a1)+
.lm_len_B6:
	move.w  (%a2)+,(%a1)+
.lm_len_B5:
	move.w  (%a2)+,(%a1)+
.lm_len_B4:
	move.w  (%a2)+,(%a1)+
.lm_len_B3:
	move.w  (%a2)+,(%a1)+
.lm_len_B2:
	move.w  (%a2)+,(%a1)+
.lm_len_B1:
	move.w  (%a2)+,(%a1)+
.lm_len_B0:
	move.w  (%a2)+,(%a1)+
.lm_len_AF:
	move.w  (%a2)+,(%a1)+
.lm_len_AE:
	move.w  (%a2)+,(%a1)+
.lm_len_AD:
	move.w  (%a2)+,(%a1)+
.lm_len_AC:
	move.w  (%a2)+,(%a1)+
.lm_len_AB:
	move.w  (%a2)+,(%a1)+
.lm_len_AA:
	move.w  (%a2)+,(%a1)+
.lm_len_A9:
	move.w  (%a2)+,(%a1)+
.lm_len_A8:
	move.w  (%a2)+,(%a1)+
.lm_len_A7:
	move.w  (%a2)+,(%a1)+
.lm_len_A6:
	move.w  (%a2)+,(%a1)+
.lm_len_A5:
	move.w  (%a2)+,(%a1)+
.lm_len_A4:
	move.w  (%a2)+,(%a1)+
.lm_len_A3:
	move.w  (%a2)+,(%a1)+
.lm_len_A2:
	move.w  (%a2)+,(%a1)+
.lm_len_A1:
	move.w  (%a2)+,(%a1)+
.lm_len_A0:
	move.w  (%a2)+,(%a1)+
.lm_len_9F:
	move.w  (%a2)+,(%a1)+
.lm_len_9E:
	move.w  (%a2)+,(%a1)+
.lm_len_9D:
	move.w  (%a2)+,(%a1)+
.lm_len_9C:
	move.w  (%a2)+,(%a1)+
.lm_len_9B:
	move.w  (%a2)+,(%a1)+
.lm_len_9A:
	move.w  (%a2)+,(%a1)+
.lm_len_99:
	move.w  (%a2)+,(%a1)+
.lm_len_98:
	move.w  (%a2)+,(%a1)+
.lm_len_97:
	move.w  (%a2)+,(%a1)+
.lm_len_96:
	move.w  (%a2)+,(%a1)+
.lm_len_95:
	move.w  (%a2)+,(%a1)+
.lm_len_94:
	move.w  (%a2)+,(%a1)+
.lm_len_93:
	move.w  (%a2)+,(%a1)+
.lm_len_92:
	move.w  (%a2)+,(%a1)+
.lm_len_91:
	move.w  (%a2)+,(%a1)+
.lm_len_90:
	move.w  (%a2)+,(%a1)+
.lm_len_8F:
	move.w  (%a2)+,(%a1)+
.lm_len_8E:
	move.w  (%a2)+,(%a1)+
.lm_len_8D:
	move.w  (%a2)+,(%a1)+
.lm_len_8C:
	move.w  (%a2)+,(%a1)+
.lm_len_8B:
	move.w  (%a2)+,(%a1)+
.lm_len_8A:
	move.w  (%a2)+,(%a1)+
.lm_len_89:
	move.w  (%a2)+,(%a1)+
.lm_len_88:
	move.w  (%a2)+,(%a1)+
.lm_len_87:
	move.w  (%a2)+,(%a1)+
.lm_len_86:
	move.w  (%a2)+,(%a1)+
.lm_len_85:
	move.w  (%a2)+,(%a1)+
.lm_len_84:
	move.w  (%a2)+,(%a1)+
.lm_len_83:
	move.w  (%a2)+,(%a1)+
.lm_len_82:
	move.w  (%a2)+,(%a1)+
.lm_len_81:
	move.w  (%a2)+,(%a1)+
.lm_len_80:
	move.w  (%a2)+,(%a1)+
.lm_len_7F:
	move.w  (%a2)+,(%a1)+
.lm_len_7E:
	move.w  (%a2)+,(%a1)+
.lm_len_7D:
	move.w  (%a2)+,(%a1)+
.lm_len_7C:
	move.w  (%a2)+,(%a1)+
.lm_len_7B:
	move.w  (%a2)+,(%a1)+
.lm_len_7A:
	move.w  (%a2)+,(%a1)+
.lm_len_79:
	move.w  (%a2)+,(%a1)+
.lm_len_78:
	move.w  (%a2)+,(%a1)+
.lm_len_77:
	move.w  (%a2)+,(%a1)+
.lm_len_76:
	move.w  (%a2)+,(%a1)+
.lm_len_75:
	move.w  (%a2)+,(%a1)+
.lm_len_74:
	move.w  (%a2)+,(%a1)+
.lm_len_73:
	move.w  (%a2)+,(%a1)+
.lm_len_72:
	move.w  (%a2)+,(%a1)+
.lm_len_71:
	move.w  (%a2)+,(%a1)+
.lm_len_70:
	move.w  (%a2)+,(%a1)+
.lm_len_6F:
	move.w  (%a2)+,(%a1)+
.lm_len_6E:
	move.w  (%a2)+,(%a1)+
.lm_len_6D:
	move.w  (%a2)+,(%a1)+
.lm_len_6C:
	move.w  (%a2)+,(%a1)+
.lm_len_6B:
	move.w  (%a2)+,(%a1)+
.lm_len_6A:
	move.w  (%a2)+,(%a1)+
.lm_len_69:
	move.w  (%a2)+,(%a1)+
.lm_len_68:
	move.w  (%a2)+,(%a1)+
.lm_len_67:
	move.w  (%a2)+,(%a1)+
.lm_len_66:
	move.w  (%a2)+,(%a1)+
.lm_len_65:
	move.w  (%a2)+,(%a1)+
.lm_len_64:
	move.w  (%a2)+,(%a1)+
.lm_len_63:
	move.w  (%a2)+,(%a1)+
.lm_len_62:
	move.w  (%a2)+,(%a1)+
.lm_len_61:
	move.w  (%a2)+,(%a1)+
.lm_len_60:
	move.w  (%a2)+,(%a1)+
.lm_len_5F:
	move.w  (%a2)+,(%a1)+
.lm_len_5E:
	move.w  (%a2)+,(%a1)+
.lm_len_5D:
	move.w  (%a2)+,(%a1)+
.lm_len_5C:
	move.w  (%a2)+,(%a1)+
.lm_len_5B:
	move.w  (%a2)+,(%a1)+
.lm_len_5A:
	move.w  (%a2)+,(%a1)+
.lm_len_59:
	move.w  (%a2)+,(%a1)+
.lm_len_58:
	move.w  (%a2)+,(%a1)+
.lm_len_57:
	move.w  (%a2)+,(%a1)+
.lm_len_56:
	move.w  (%a2)+,(%a1)+
.lm_len_55:
	move.w  (%a2)+,(%a1)+
.lm_len_54:
	move.w  (%a2)+,(%a1)+
.lm_len_53:
	move.w  (%a2)+,(%a1)+
.lm_len_52:
	move.w  (%a2)+,(%a1)+
.lm_len_51:
	move.w  (%a2)+,(%a1)+
.lm_len_50:
	move.w  (%a2)+,(%a1)+
.lm_len_4F:
	move.w  (%a2)+,(%a1)+
.lm_len_4E:
	move.w  (%a2)+,(%a1)+
.lm_len_4D:
	move.w  (%a2)+,(%a1)+
.lm_len_4C:
	move.w  (%a2)+,(%a1)+
.lm_len_4B:
	move.w  (%a2)+,(%a1)+
.lm_len_4A:
	move.w  (%a2)+,(%a1)+
.lm_len_49:
	move.w  (%a2)+,(%a1)+
.lm_len_48:
	move.w  (%a2)+,(%a1)+
.lm_len_47:
	move.w  (%a2)+,(%a1)+
.lm_len_46:
	move.w  (%a2)+,(%a1)+
.lm_len_45:
	move.w  (%a2)+,(%a1)+
.lm_len_44:
	move.w  (%a2)+,(%a1)+
.lm_len_43:
	move.w  (%a2)+,(%a1)+
.lm_len_42:
	move.w  (%a2)+,(%a1)+
.lm_len_41:
	move.w  (%a2)+,(%a1)+
.lm_len_40:
	move.w  (%a2)+,(%a1)+
.lm_len_3F:
	move.w  (%a2)+,(%a1)+
.lm_len_3E:
	move.w  (%a2)+,(%a1)+
.lm_len_3D:
	move.w  (%a2)+,(%a1)+
.lm_len_3C:
	move.w  (%a2)+,(%a1)+
.lm_len_3B:
	move.w  (%a2)+,(%a1)+
.lm_len_3A:
	move.w  (%a2)+,(%a1)+
.lm_len_39:
	move.w  (%a2)+,(%a1)+
.lm_len_38:
	move.w  (%a2)+,(%a1)+
.lm_len_37:
	move.w  (%a2)+,(%a1)+
.lm_len_36:
	move.w  (%a2)+,(%a1)+
.lm_len_35:
	move.w  (%a2)+,(%a1)+
.lm_len_34:
	move.w  (%a2)+,(%a1)+
.lm_len_33:
	move.w  (%a2)+,(%a1)+
.lm_len_32:
	move.w  (%a2)+,(%a1)+
.lm_len_31:
	move.w  (%a2)+,(%a1)+
.lm_len_30:
	move.w  (%a2)+,(%a1)+
.lm_len_2F:
	move.w  (%a2)+,(%a1)+
.lm_len_2E:
	move.w  (%a2)+,(%a1)+
.lm_len_2D:
	move.w  (%a2)+,(%a1)+
.lm_len_2C:
	move.w  (%a2)+,(%a1)+
.lm_len_2B:
	move.w  (%a2)+,(%a1)+
.lm_len_2A:
	move.w  (%a2)+,(%a1)+
.lm_len_29:
	move.w  (%a2)+,(%a1)+
.lm_len_28:
	move.w  (%a2)+,(%a1)+
.lm_len_27:
	move.w  (%a2)+,(%a1)+
.lm_len_26:
	move.w  (%a2)+,(%a1)+
.lm_len_25:
	move.w  (%a2)+,(%a1)+
.lm_len_24:
	move.w  (%a2)+,(%a1)+
.lm_len_23:
	move.w  (%a2)+,(%a1)+
.lm_len_22:
	move.w  (%a2)+,(%a1)+
.lm_len_21:
	move.w  (%a2)+,(%a1)+
.lm_len_20:
	move.w  (%a2)+,(%a1)+
.lm_len_1F:
	move.w  (%a2)+,(%a1)+
.lm_len_1E:
	move.w  (%a2)+,(%a1)+
.lm_len_1D:
	move.w  (%a2)+,(%a1)+
.lm_len_1C:
	move.w  (%a2)+,(%a1)+
.lm_len_1B:
	move.w  (%a2)+,(%a1)+
.lm_len_1A:
	move.w  (%a2)+,(%a1)+
.lm_len_19:
	move.w  (%a2)+,(%a1)+
.lm_len_18:
	move.w  (%a2)+,(%a1)+
.lm_len_17:
	move.w  (%a2)+,(%a1)+
.lm_len_16:
	move.w  (%a2)+,(%a1)+
.lm_len_15:
	move.w  (%a2)+,(%a1)+
.lm_len_14:
	move.w  (%a2)+,(%a1)+
.lm_len_13:
	move.w  (%a2)+,(%a1)+
.lm_len_12:
	move.w  (%a2)+,(%a1)+
.lm_len_11:
	move.w  (%a2)+,(%a1)+
.lm_len_10:
	move.w  (%a2)+,(%a1)+
.lm_len_0F:
	move.w  (%a2)+,(%a1)+
.lm_len_0E:
	move.w  (%a2)+,(%a1)+
.lm_len_0D:
	move.w  (%a2)+,(%a1)+
.lm_len_0C:
	move.w  (%a2)+,(%a1)+
.lm_len_0B:
	move.w  (%a2)+,(%a1)+
.lm_len_0A:
	move.w  (%a2)+,(%a1)+
.lm_len_09:
	move.w  (%a2)+,(%a1)+
.lm_len_08:
	move.w  (%a2)+,(%a1)+
.lm_len_07:
	move.w  (%a2)+,(%a1)+
.lm_len_06:
	move.w  (%a2)+,(%a1)+
.lm_len_05:
	move.w  (%a2)+,(%a1)+
.lm_len_04:
	move.w  (%a2)+,(%a1)+
.lm_len_03:
	move.w  (%a2)+,(%a1)+
.lm_len_02:
	move.w  (%a2)+,(%a1)+
.lm_len_01:
	move.w  (%a2)+,(%a1)+
.lm_len_00:
	move.w  (%a2)+,(%a1)+
	move.w  (%a2)+,(%a1)+

    moveq   #0,%d0
    moveq   #0,%d1
    jmp     (%a3)

.litE_mat0:
    move.l  (%a0)+,(%a1)+
.litC_mat0:
    move.l  (%a0)+,(%a1)+
.litA_mat0:
    move.l  (%a0)+,(%a1)+
.lit8_mat0:
    move.l  (%a0)+,(%a1)+
.lit6_mat0:
    move.l  (%a0)+,(%a1)+
.lit4_mat0:
    move.l  (%a0)+,(%a1)+
.lit2_mat0:
    move.l  (%a0)+,(%a1)+

    tst.b   %d1                     | match offset null ?
    jeq     .next                   | not a long match

.long_match_1:
    move.w  (%a0)+,%d0              | get long offset (already * 2)
    neg.w   %d0
    lea     -2(%a1,%d0.w),%a2       | a2 = dst - (match offset + 2)

    add.w   %d1,%d1
    add.w   %d1,%d1

.lm1_jump_base:
    move.l  (.lm_jump_table-.lm1_jump_base)-2(%pc,%d1.w),%a4
    jmp     (%a4)


.litF_mat0:
    move.l  (%a0)+,(%a1)+
.litD_mat0:
    move.l  (%a0)+,(%a1)+
.litB_mat0:
    move.l  (%a0)+,(%a1)+
.lit9_mat0:
    move.l  (%a0)+,(%a1)+
.lit7_mat0:
    move.l  (%a0)+,(%a1)+
.lit5_mat0:
    move.l  (%a0)+,(%a1)+
.lit3_mat0:
    move.l  (%a0)+,(%a1)+
.lit1_mat0:
    move.w  (%a0)+,(%a1)+

    tst.b   %d1                     | match offset null ?
    jeq     .next                   | not a long match

.long_match_2:
    move.w  (%a0)+,%d0              | get long offset (already * 2)
    neg.w   %d0
    lea     -2(%a1,%d0.w),%a2       | a2 = dst - (match offset + 2)

    add.w   %d1,%d1
    add.w   %d1,%d1

.lm2_jump_base:
    move.l  (.lm_jump_table-.lm2_jump_base)-2(%pc,%d1.w),%a4
    jmp     (%a4)


.lit0_mat0:                         | special case of lit=0 and mat=0
    tst.b   %d1                     | match offset null ?
    jeq    .done                    | not a long match --> done

.long_match_3:
    move.w  (%a0)+,%d0              | get long offset (already * 2)
    neg.w   %d0
    lea     -2(%a1,%d0.w),%a2       | a2 = dst - (match offset + 2)

    add.w   %d1,%d1
    add.w   %d1,%d1

.lm3_jump_base:
    move.l  (.lm_jump_table-.lm3_jump_base)-2(%pc,%d1.w),%a4
    jmp     (%a4)

    .align 2
.lm_jump_table:

    .long .lm_len_00
    .long .lm_len_01
    .long .lm_len_02
    .long .lm_len_03
    .long .lm_len_04
    .long .lm_len_05
    .long .lm_len_06
    .long .lm_len_07
    .long .lm_len_08
    .long .lm_len_09
    .long .lm_len_0A
    .long .lm_len_0B
    .long .lm_len_0C
    .long .lm_len_0D
    .long .lm_len_0E
    .long .lm_len_0F
    .long .lm_len_10
    .long .lm_len_11
    .long .lm_len_12
    .long .lm_len_13
    .long .lm_len_14
    .long .lm_len_15
    .long .lm_len_16
    .long .lm_len_17
    .long .lm_len_18
    .long .lm_len_19
    .long .lm_len_1A
    .long .lm_len_1B
    .long .lm_len_1C
    .long .lm_len_1D
    .long .lm_len_1E
    .long .lm_len_1F
    .long .lm_len_20
    .long .lm_len_21
    .long .lm_len_22
    .long .lm_len_23
    .long .lm_len_24
    .long .lm_len_25
    .long .lm_len_26
    .long .lm_len_27
    .long .lm_len_28
    .long .lm_len_29
    .long .lm_len_2A
    .long .lm_len_2B
    .long .lm_len_2C
    .long .lm_len_2D
    .long .lm_len_2E
    .long .lm_len_2F
    .long .lm_len_30
    .long .lm_len_31
    .long .lm_len_32
    .long .lm_len_33
    .long .lm_len_34
    .long .lm_len_35
    .long .lm_len_36
    .long .lm_len_37
    .long .lm_len_38
    .long .lm_len_39
    .long .lm_len_3A
    .long .lm_len_3B
    .long .lm_len_3C
    .long .lm_len_3D
    .long .lm_len_3E
    .long .lm_len_3F
    .long .lm_len_40
    .long .lm_len_41
    .long .lm_len_42
    .long .lm_len_43
    .long .lm_len_44
    .long .lm_len_45
    .long .lm_len_46
    .long .lm_len_47
    .long .lm_len_48
    .long .lm_len_49
    .long .lm_len_4A
    .long .lm_len_4B
    .long .lm_len_4C
    .long .lm_len_4D
    .long .lm_len_4E
    .long .lm_len_4F
    .long .lm_len_50
    .long .lm_len_51
    .long .lm_len_52
    .long .lm_len_53
    .long .lm_len_54
    .long .lm_len_55
    .long .lm_len_56
    .long .lm_len_57
    .long .lm_len_58
    .long .lm_len_59
    .long .lm_len_5A
    .long .lm_len_5B
    .long .lm_len_5C
    .long .lm_len_5D
    .long .lm_len_5E
    .long .lm_len_5F
    .long .lm_len_60
    .long .lm_len_61
    .long .lm_len_62
    .long .lm_len_63
    .long .lm_len_64
    .long .lm_len_65
    .long .lm_len_66
    .long .lm_len_67
    .long .lm_len_68
    .long .lm_len_69
    .long .lm_len_6A
    .long .lm_len_6B
    .long .lm_len_6C
    .long .lm_len_6D
    .long .lm_len_6E
    .long .lm_len_6F
    .long .lm_len_70
    .long .lm_len_71
    .long .lm_len_72
    .long .lm_len_73
    .long .lm_len_74
    .long .lm_len_75
    .long .lm_len_76
    .long .lm_len_77
    .long .lm_len_78
    .long .lm_len_79
    .long .lm_len_7A
    .long .lm_len_7B
    .long .lm_len_7C
    .long .lm_len_7D
    .long .lm_len_7E
    .long .lm_len_7F
    .long .lm_len_80
    .long .lm_len_81
    .long .lm_len_82
    .long .lm_len_83
    .long .lm_len_84
    .long .lm_len_85
    .long .lm_len_86
    .long .lm_len_87
    .long .lm_len_88
    .long .lm_len_89
    .long .lm_len_8A
    .long .lm_len_8B
    .long .lm_len_8C
    .long .lm_len_8D
    .long .lm_len_8E
    .long .lm_len_8F
    .long .lm_len_90
    .long .lm_len_91
    .long .lm_len_92
    .long .lm_len_93
    .long .lm_len_94
    .long .lm_len_95
    .long .lm_len_96
    .long .lm_len_97
    .long .lm_len_98
    .long .lm_len_99
    .long .lm_len_9A
    .long .lm_len_9B
    .long .lm_len_9C
    .long .lm_len_9D
    .long .lm_len_9E
    .long .lm_len_9F
    .long .lm_len_A0
    .long .lm_len_A1
    .long .lm_len_A2
    .long .lm_len_A3
    .long .lm_len_A4
    .long .lm_len_A5
    .long .lm_len_A6
    .long .lm_len_A7
    .long .lm_len_A8
    .long .lm_len_A9
    .long .lm_len_AA
    .long .lm_len_AB
    .long .lm_len_AC
    .long .lm_len_AD
    .long .lm_len_AE
    .long .lm_len_AF
    .long .lm_len_B0
    .long .lm_len_B1
    .long .lm_len_B2
    .long .lm_len_B3
    .long .lm_len_B4
    .long .lm_len_B5
    .long .lm_len_B6
    .long .lm_len_B7
    .long .lm_len_B8
    .long .lm_len_B9
    .long .lm_len_BA
    .long .lm_len_BB
    .long .lm_len_BC
    .long .lm_len_BD
    .long .lm_len_BE
    .long .lm_len_BF
    .long .lm_len_C0
    .long .lm_len_C1
    .long .lm_len_C2
    .long .lm_len_C3
    .long .lm_len_C4
    .long .lm_len_C5
    .long .lm_len_C6
    .long .lm_len_C7
    .long .lm_len_C8
    .long .lm_len_C9
    .long .lm_len_CA
    .long .lm_len_CB
    .long .lm_len_CC
    .long .lm_len_CD
    .long .lm_len_CE
    .long .lm_len_CF
    .long .lm_len_D0
    .long .lm_len_D1
    .long .lm_len_D2
    .long .lm_len_D3
    .long .lm_len_D4
    .long .lm_len_D5
    .long .lm_len_D6
    .long .lm_len_D7
    .long .lm_len_D8
    .long .lm_len_D9
    .long .lm_len_DA
    .long .lm_len_DB
    .long .lm_len_DC
    .long .lm_len_DD
    .long .lm_len_DE
    .long .lm_len_DF
    .long .lm_len_E0
    .long .lm_len_E1
    .long .lm_len_E2
    .long .lm_len_E3
    .long .lm_len_E4
    .long .lm_len_E5
    .long .lm_len_E6
    .long .lm_len_E7
    .long .lm_len_E8
    .long .lm_len_E9
    .long .lm_len_EA
    .long .lm_len_EB
    .long .lm_len_EC
    .long .lm_len_ED
    .long .lm_len_EE
    .long .lm_len_EF
    .long .lm_len_F0
    .long .lm_len_F1
    .long .lm_len_F2
    .long .lm_len_F3
    .long .lm_len_F4
    .long .lm_len_F5
    .long .lm_len_F6
    .long .lm_len_F7
    .long .lm_len_F8
    .long .lm_len_F9
    .long .lm_len_FA
    .long .lm_len_FB
    .long .lm_len_FC
    .long .lm_len_FD
    .long .lm_len_FE
    .long .lm_len_FF


.litE_mat1:
    move.l  (%a0)+,(%a1)+
.litC_mat1:
    move.l  (%a0)+,(%a1)+
.litA_mat1:
    move.l  (%a0)+,(%a1)+
.lit8_mat1:
    move.l  (%a0)+,(%a1)+
.lit6_mat1:
    move.l  (%a0)+,(%a1)+
.lit4_mat1:
    move.l  (%a0)+,(%a1)+
.lit2_mat1:
    move.l  (%a0)+,(%a1)+
.lit0_mat1:
    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litF_mat1:
    move.l  (%a0)+,(%a1)+
.litD_mat1:
    move.l  (%a0)+,(%a1)+
.litB_mat1:
    move.l  (%a0)+,(%a1)+
.lit9_mat1:
    move.l  (%a0)+,(%a1)+
.lit7_mat1:
    move.l  (%a0)+,(%a1)+
.lit5_mat1:
    move.l  (%a0)+,(%a1)+
.lit3_mat1:
    move.l  (%a0)+,(%a1)+
.lit1_mat1:
    move.w  (%a0)+,(%a1)+

    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litE_mat2:
    move.l  (%a0)+,(%a1)+
.litC_mat2:
    move.l  (%a0)+,(%a1)+
.litA_mat2:
    move.l  (%a0)+,(%a1)+
.lit8_mat2:
    move.l  (%a0)+,(%a1)+
.lit6_mat2:
    move.l  (%a0)+,(%a1)+
.lit4_mat2:
    move.l  (%a0)+,(%a1)+
.lit2_mat2:
    move.l  (%a0)+,(%a1)+
.lit0_mat2:
    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litF_mat2:
    move.l  (%a0)+,(%a1)+
.litD_mat2:
    move.l  (%a0)+,(%a1)+
.litB_mat2:
    move.l  (%a0)+,(%a1)+
.lit9_mat2:
    move.l  (%a0)+,(%a1)+
.lit7_mat2:
    move.l  (%a0)+,(%a1)+
.lit5_mat2:
    move.l  (%a0)+,(%a1)+
.lit3_mat2:
    move.l  (%a0)+,(%a1)+
.lit1_mat2:
    move.w  (%a0)+,(%a1)+

    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litE_mat3:
    move.l  (%a0)+,(%a1)+
.litC_mat3:
    move.l  (%a0)+,(%a1)+
.litA_mat3:
    move.l  (%a0)+,(%a1)+
.lit8_mat3:
    move.l  (%a0)+,(%a1)+
.lit6_mat3:
    move.l  (%a0)+,(%a1)+
.lit4_mat3:
    move.l  (%a0)+,(%a1)+
.lit2_mat3:
    move.l  (%a0)+,(%a1)+
.lit0_mat3:
    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litF_mat3:
    move.l  (%a0)+,(%a1)+
.litD_mat3:
    move.l  (%a0)+,(%a1)+
.litB_mat3:
    move.l  (%a0)+,(%a1)+
.lit9_mat3:
    move.l  (%a0)+,(%a1)+
.lit7_mat3:
    move.l  (%a0)+,(%a1)+
.lit5_mat3:
    move.l  (%a0)+,(%a1)+
.lit3_mat3:
    move.l  (%a0)+,(%a1)+
.lit1_mat3:
    move.w  (%a0)+,(%a1)+

    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litE_mat4:
    move.l  (%a0)+,(%a1)+
.litC_mat4:
    move.l  (%a0)+,(%a1)+
.litA_mat4:
    move.l  (%a0)+,(%a1)+
.lit8_mat4:
    move.l  (%a0)+,(%a1)+
.lit6_mat4:
    move.l  (%a0)+,(%a1)+
.lit4_mat4:
    move.l  (%a0)+,(%a1)+
.lit2_mat4:
    move.l  (%a0)+,(%a1)+
.lit0_mat4:
    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litF_mat4:
    move.l  (%a0)+,(%a1)+
.litD_mat4:
    move.l  (%a0)+,(%a1)+
.litB_mat4:
    move.l  (%a0)+,(%a1)+
.lit9_mat4:
    move.l  (%a0)+,(%a1)+
.lit7_mat4:
    move.l  (%a0)+,(%a1)+
.lit5_mat4:
    move.l  (%a0)+,(%a1)+
.lit3_mat4:
    move.l  (%a0)+,(%a1)+
.lit1_mat4:
    move.w  (%a0)+,(%a1)+

    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litE_mat5:
    move.l  (%a0)+,(%a1)+
.litC_mat5:
    move.l  (%a0)+,(%a1)+
.litA_mat5:
    move.l  (%a0)+,(%a1)+
.lit8_mat5:
    move.l  (%a0)+,(%a1)+
.lit6_mat5:
    move.l  (%a0)+,(%a1)+
.lit4_mat5:
    move.l  (%a0)+,(%a1)+
.lit2_mat5:
    move.l  (%a0)+,(%a1)+
.lit0_mat5:
    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litF_mat5:
    move.l  (%a0)+,(%a1)+
.litD_mat5:
    move.l  (%a0)+,(%a1)+
.litB_mat5:
    move.l  (%a0)+,(%a1)+
.lit9_mat5:
    move.l  (%a0)+,(%a1)+
.lit7_mat5:
    move.l  (%a0)+,(%a1)+
.lit5_mat5:
    move.l  (%a0)+,(%a1)+
.lit3_mat5:
    move.l  (%a0)+,(%a1)+
.lit1_mat5:
    move.w  (%a0)+,(%a1)+

    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litE_mat6:
    move.l  (%a0)+,(%a1)+
.litC_mat6:
    move.l  (%a0)+,(%a1)+
.litA_mat6:
    move.l  (%a0)+,(%a1)+
.lit8_mat6:
    move.l  (%a0)+,(%a1)+
.lit6_mat6:
    move.l  (%a0)+,(%a1)+
.lit4_mat6:
    move.l  (%a0)+,(%a1)+
.lit2_mat6:
    move.l  (%a0)+,(%a1)+
.lit0_mat6:
    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litF_mat6:
    move.l  (%a0)+,(%a1)+
.litD_mat6:
    move.l  (%a0)+,(%a1)+
.litB_mat6:
    move.l  (%a0)+,(%a1)+
.lit9_mat6:
    move.l  (%a0)+,(%a1)+
.lit7_mat6:
    move.l  (%a0)+,(%a1)+
.lit5_mat6:
    move.l  (%a0)+,(%a1)+
.lit3_mat6:
    move.l  (%a0)+,(%a1)+
.lit1_mat6:
    move.w  (%a0)+,(%a1)+

    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litE_mat7:
    move.l  (%a0)+,(%a1)+
.litC_mat7:
    move.l  (%a0)+,(%a1)+
.litA_mat7:
    move.l  (%a0)+,(%a1)+
.lit8_mat7:
    move.l  (%a0)+,(%a1)+
.lit6_mat7:
    move.l  (%a0)+,(%a1)+
.lit4_mat7:
    move.l  (%a0)+,(%a1)+
.lit2_mat7:
    move.l  (%a0)+,(%a1)+
.lit0_mat7:
    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litF_mat7:
    move.l  (%a0)+,(%a1)+
.litD_mat7:
    move.l  (%a0)+,(%a1)+
.litB_mat7:
    move.l  (%a0)+,(%a1)+
.lit9_mat7:
    move.l  (%a0)+,(%a1)+
.lit7_mat7:
    move.l  (%a0)+,(%a1)+
.lit5_mat7:
    move.l  (%a0)+,(%a1)+
.lit3_mat7:
    move.l  (%a0)+,(%a1)+
.lit1_mat7:
    move.w  (%a0)+,(%a1)+

    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litE_mat8:
    move.l  (%a0)+,(%a1)+
.litC_mat8:
    move.l  (%a0)+,(%a1)+
.litA_mat8:
    move.l  (%a0)+,(%a1)+
.lit8_mat8:
    move.l  (%a0)+,(%a1)+
.lit6_mat8:
    move.l  (%a0)+,(%a1)+
.lit4_mat8:
    move.l  (%a0)+,(%a1)+
.lit2_mat8:
    move.l  (%a0)+,(%a1)+
.lit0_mat8:
    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litF_mat8:
    move.l  (%a0)+,(%a1)+
.litD_mat8:
    move.l  (%a0)+,(%a1)+
.litB_mat8:
    move.l  (%a0)+,(%a1)+
.lit9_mat8:
    move.l  (%a0)+,(%a1)+
.lit7_mat8:
    move.l  (%a0)+,(%a1)+
.lit5_mat8:
    move.l  (%a0)+,(%a1)+
.lit3_mat8:
    move.l  (%a0)+,(%a1)+
.lit1_mat8:
    move.w  (%a0)+,(%a1)+

    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litE_mat9:
    move.l  (%a0)+,(%a1)+
.litC_mat9:
    move.l  (%a0)+,(%a1)+
.litA_mat9:
    move.l  (%a0)+,(%a1)+
.lit8_mat9:
    move.l  (%a0)+,(%a1)+
.lit6_mat9:
    move.l  (%a0)+,(%a1)+
.lit4_mat9:
    move.l  (%a0)+,(%a1)+
.lit2_mat9:
    move.l  (%a0)+,(%a1)+
.lit0_mat9:
    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litF_mat9:
    move.l  (%a0)+,(%a1)+
.litD_mat9:
    move.l  (%a0)+,(%a1)+
.litB_mat9:
    move.l  (%a0)+,(%a1)+
.lit9_mat9:
    move.l  (%a0)+,(%a1)+
.lit7_mat9:
    move.l  (%a0)+,(%a1)+
.lit5_mat9:
    move.l  (%a0)+,(%a1)+
.lit3_mat9:
    move.l  (%a0)+,(%a1)+
.lit1_mat9:
    move.w  (%a0)+,(%a1)+

    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litE_matA:
    move.l  (%a0)+,(%a1)+
.litC_matA:
    move.l  (%a0)+,(%a1)+
.litA_matA:
    move.l  (%a0)+,(%a1)+
.lit8_matA:
    move.l  (%a0)+,(%a1)+
.lit6_matA:
    move.l  (%a0)+,(%a1)+
.lit4_matA:
    move.l  (%a0)+,(%a1)+
.lit2_matA:
    move.l  (%a0)+,(%a1)+
.lit0_matA:
    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litF_matA:
    move.l  (%a0)+,(%a1)+
.litD_matA:
    move.l  (%a0)+,(%a1)+
.litB_matA:
    move.l  (%a0)+,(%a1)+
.lit9_matA:
    move.l  (%a0)+,(%a1)+
.lit7_matA:
    move.l  (%a0)+,(%a1)+
.lit5_matA:
    move.l  (%a0)+,(%a1)+
.lit3_matA:
    move.l  (%a0)+,(%a1)+
.lit1_matA:
    move.w  (%a0)+,(%a1)+

    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litE_matB:
    move.l  (%a0)+,(%a1)+
.litC_matB:
    move.l  (%a0)+,(%a1)+
.litA_matB:
    move.l  (%a0)+,(%a1)+
.lit8_matB:
    move.l  (%a0)+,(%a1)+
.lit6_matB:
    move.l  (%a0)+,(%a1)+
.lit4_matB:
    move.l  (%a0)+,(%a1)+
.lit2_matB:
    move.l  (%a0)+,(%a1)+
.lit0_matB:
    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litF_matB:
    move.l  (%a0)+,(%a1)+
.litD_matB:
    move.l  (%a0)+,(%a1)+
.litB_matB:
    move.l  (%a0)+,(%a1)+
.lit9_matB:
    move.l  (%a0)+,(%a1)+
.lit7_matB:
    move.l  (%a0)+,(%a1)+
.lit5_matB:
    move.l  (%a0)+,(%a1)+
.lit3_matB:
    move.l  (%a0)+,(%a1)+
.lit1_matB:
    move.w  (%a0)+,(%a1)+

    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litE_matC:
    move.l  (%a0)+,(%a1)+
.litC_matC:
    move.l  (%a0)+,(%a1)+
.litA_matC:
    move.l  (%a0)+,(%a1)+
.lit8_matC:
    move.l  (%a0)+,(%a1)+
.lit6_matC:
    move.l  (%a0)+,(%a1)+
.lit4_matC:
    move.l  (%a0)+,(%a1)+
.lit2_matC:
    move.l  (%a0)+,(%a1)+
.lit0_matC:
    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litF_matC:
    move.l  (%a0)+,(%a1)+
.litD_matC:
    move.l  (%a0)+,(%a1)+
.litB_matC:
    move.l  (%a0)+,(%a1)+
.lit9_matC:
    move.l  (%a0)+,(%a1)+
.lit7_matC:
    move.l  (%a0)+,(%a1)+
.lit5_matC:
    move.l  (%a0)+,(%a1)+
.lit3_matC:
    move.l  (%a0)+,(%a1)+
.lit1_matC:
    move.w  (%a0)+,(%a1)+

    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litE_matD:
    move.l  (%a0)+,(%a1)+
.litC_matD:
    move.l  (%a0)+,(%a1)+
.litA_matD:
    move.l  (%a0)+,(%a1)+
.lit8_matD:
    move.l  (%a0)+,(%a1)+
.lit6_matD:
    move.l  (%a0)+,(%a1)+
.lit4_matD:
    move.l  (%a0)+,(%a1)+
.lit2_matD:
    move.l  (%a0)+,(%a1)+
.lit0_matD:
    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litF_matD:
    move.l  (%a0)+,(%a1)+
.litD_matD:
    move.l  (%a0)+,(%a1)+
.litB_matD:
    move.l  (%a0)+,(%a1)+
.lit9_matD:
    move.l  (%a0)+,(%a1)+
.lit7_matD:
    move.l  (%a0)+,(%a1)+
.lit5_matD:
    move.l  (%a0)+,(%a1)+
.lit3_matD:
    move.l  (%a0)+,(%a1)+
.lit1_matD:
    move.w  (%a0)+,(%a1)+

    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litE_matE:
    move.l  (%a0)+,(%a1)+
.litC_matE:
    move.l  (%a0)+,(%a1)+
.litA_matE:
    move.l  (%a0)+,(%a1)+
.lit8_matE:
    move.l  (%a0)+,(%a1)+
.lit6_matE:
    move.l  (%a0)+,(%a1)+
.lit4_matE:
    move.l  (%a0)+,(%a1)+
.lit2_matE:
    move.l  (%a0)+,(%a1)+
.lit0_matE:
    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litF_matE:
    move.l  (%a0)+,(%a1)+
.litD_matE:
    move.l  (%a0)+,(%a1)+
.litB_matE:
    move.l  (%a0)+,(%a1)+
.lit9_matE:
    move.l  (%a0)+,(%a1)+
.lit7_matE:
    move.l  (%a0)+,(%a1)+
.lit5_matE:
    move.l  (%a0)+,(%a1)+
.lit3_matE:
    move.l  (%a0)+,(%a1)+
.lit1_matE:
    move.w  (%a0)+,(%a1)+

    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litE_matF:
    move.l  (%a0)+,(%a1)+
.litC_matF:
    move.l  (%a0)+,(%a1)+
.litA_matF:
    move.l  (%a0)+,(%a1)+
.lit8_matF:
    move.l  (%a0)+,(%a1)+
.lit6_matF:
    move.l  (%a0)+,(%a1)+
.lit4_matF:
    move.l  (%a0)+,(%a1)+
.lit2_matF:
    move.l  (%a0)+,(%a1)+
.lit0_matF:
    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.litF_matF:
    move.l  (%a0)+,(%a1)+
.litD_matF:
    move.l  (%a0)+,(%a1)+
.litB_matF:
    move.l  (%a0)+,(%a1)+
.lit9_matF:
    move.l  (%a0)+,(%a1)+
.lit7_matF:
    move.l  (%a0)+,(%a1)+
.lit5_matF:
    move.l  (%a0)+,(%a1)+
.lit3_matF:
    move.l  (%a0)+,(%a1)+
.lit1_matF:
    move.w  (%a0)+,(%a1)+

    add.w   %d1,%d1
    neg.w   %d1
    lea     -2(%a1,%d1.w),%a2       | a2 = dst - ((match offset + 1) * 2)

    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    move.w  (%a2)+,(%a1)+
    moveq   #0,%d1
    jmp     (%a3)

.done:
    move.w  (%a0)+,%d0              | need to copy a last byte ?
    bpl.s   .no_byte

    move.b  %d0,(%a1)+              | copy last byte
.no_byte:

    move.l  %a1,%d0
    sub.l   20(%sp),%d0             | return op - dest

    movem.l (%sp)+,%a2-%a4
    rts
