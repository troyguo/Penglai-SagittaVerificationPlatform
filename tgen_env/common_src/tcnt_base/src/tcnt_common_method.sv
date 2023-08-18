`ifndef TCNT_COMMON_METHOD__SV
`define TCNT_COMMON_METHOD__SV

import uvm_pkg::*;

package tcnt_common_method;

function bit[31:0] crc32_d32(input bit[31:0] data_q[$]);
    bit [31:0] crc;
    bit [31:0] d;
    bit [31:0] d_tmp;
    bit [31:0] c;
    bit [31:0] newcrc;
    bit [31:0] crc32;

    for(int i=0;i<data_q.size();i++) begin
        if(i==0) begin
            crc=32'h0;
        end
        d = data_q[i];
        //for(int j=0;j<32;j++) begin
        //    d[j] = data_q[i][31-j];
        //end
        //d_tmp = data_q[i][0:31];
        c = crc;
        //`uvm_info("COMMON_METHOD",$sformatf("CRC32_D32: i=%0d, c=0h%h d=0h%h ",i,c,d),UVM_FULL);
        newcrc[0]  = d[31] ^ d[30] ^ d[29] ^ d[28] ^ d[26] ^ d[25] ^ d[24] ^ d[16] ^ d[12] ^ d[10] ^ d[9] ^ d[6] ^ d[0] ^ c[0] ^ c[6] ^ c[9] ^ c[10] ^ c[12] ^ c[16] ^ c[24] ^ c[25] ^ c[26] ^ c[28] ^ c[29] ^ c[30] ^ c[31];
        newcrc[1]  = d[28] ^ d[27] ^ d[24] ^ d[17] ^ d[16] ^ d[13] ^ d[12] ^ d[11] ^ d[9] ^ d[7] ^ d[6] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[6] ^ c[7] ^ c[9] ^ c[11] ^ c[12] ^ c[13] ^ c[16] ^ c[17] ^ c[24] ^ c[27] ^ c[28];
        newcrc[2]  = d[31] ^ d[30] ^ d[26] ^ d[24] ^ d[18] ^ d[17] ^ d[16] ^ d[14] ^ d[13] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[2] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[2] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^ c[13] ^ c[14] ^ c[16] ^ c[17] ^ c[18] ^ c[24] ^ c[26] ^ c[30] ^ c[31];
        newcrc[3]  = d[31] ^ d[27] ^ d[25] ^ d[19] ^ d[18] ^ d[17] ^ d[15] ^ d[14] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[3] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[3] ^ c[7] ^ c[8] ^ c[9] ^ c[10] ^ c[14] ^ c[15] ^ c[17] ^ c[18] ^ c[19] ^ c[25] ^ c[27] ^ c[31];
        newcrc[4]  = d[31] ^ d[30] ^ d[29] ^ d[25] ^ d[24] ^ d[20] ^ d[19] ^ d[18] ^ d[15] ^ d[12] ^ d[11] ^ d[8] ^ d[6] ^ d[4] ^ d[3] ^ d[2] ^ d[0] ^ c[0] ^ c[2] ^ c[3] ^ c[4] ^ c[6] ^ c[8] ^ c[11] ^ c[12] ^ c[15] ^ c[18] ^ c[19] ^ c[20] ^ c[24] ^ c[25] ^ c[29] ^ c[30] ^ c[31];
        newcrc[5]  = d[29] ^ d[28] ^ d[24] ^ d[21] ^ d[20] ^ d[19] ^ d[13] ^ d[10] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ c[10] ^ c[13] ^ c[19] ^ c[20] ^ c[21] ^ c[24] ^ c[28] ^ c[29];
        newcrc[6]  = d[30] ^ d[29] ^ d[25] ^ d[22] ^ d[21] ^ d[20] ^ d[14] ^ d[11] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^ c[11] ^ c[14] ^ c[20] ^ c[21] ^ c[22] ^ c[25] ^ c[29] ^ c[30];
        newcrc[7]  = d[29] ^ d[28] ^ d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[21] ^ d[16] ^ d[15] ^ d[10] ^ d[8] ^ d[7] ^ d[5] ^ d[3] ^ d[2] ^ d[0] ^ c[0] ^ c[2] ^ c[3] ^ c[5] ^ c[7] ^ c[8] ^ c[10] ^ c[15] ^ c[16] ^ c[21] ^ c[22] ^ c[23] ^ c[24] ^ c[25] ^ c[28] ^ c[29];
        newcrc[8]  = d[31] ^ d[28] ^ d[23] ^ d[22] ^ d[17] ^ d[12] ^ d[11] ^ d[10] ^ d[8] ^ d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[3] ^ c[4] ^ c[8] ^ c[10] ^ c[11] ^ c[12] ^ c[17] ^ c[22] ^ c[23] ^ c[28] ^ c[31];
        newcrc[9]  = d[29] ^ d[24] ^ d[23] ^ d[18] ^ d[13] ^ d[12] ^ d[11] ^ d[9] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[4] ^ c[5] ^ c[9] ^ c[11] ^ c[12] ^ c[13] ^ c[18] ^ c[23] ^ c[24] ^ c[29];
        newcrc[10] = d[31] ^ d[29] ^ d[28] ^ d[26] ^ d[19] ^ d[16] ^ d[14] ^ d[13] ^ d[9] ^ d[5] ^ d[3] ^ d[2] ^ d[0] ^ c[0] ^ c[2] ^ c[3] ^ c[5] ^ c[9] ^ c[13] ^ c[14] ^ c[16] ^ c[19] ^ c[26] ^ c[28] ^ c[29] ^ c[31];
        newcrc[11] = d[31] ^ d[28] ^ d[27] ^ d[26] ^ d[25] ^ d[24] ^ d[20] ^ d[17] ^ d[16] ^ d[15] ^ d[14] ^ d[12] ^ d[9] ^ d[4] ^ d[3] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[3] ^ c[4] ^ c[9] ^ c[12] ^ c[14] ^ c[15] ^ c[16] ^ c[17] ^ c[20] ^ c[24] ^ c[25] ^ c[26] ^ c[27] ^ c[28] ^ c[31];
        newcrc[12] = d[31] ^ d[30] ^ d[27] ^ d[24] ^ d[21] ^ d[18] ^ d[17] ^ d[15] ^ d[13] ^ d[12] ^ d[9] ^ d[6] ^ d[5] ^ d[4] ^ d[2] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[2] ^ c[4] ^ c[5] ^ c[6] ^ c[9] ^ c[12] ^ c[13] ^ c[15] ^ c[17] ^ c[18] ^ c[21] ^ c[24] ^ c[27] ^ c[30] ^ c[31];
        newcrc[13] = d[31] ^ d[28] ^ d[25] ^ d[22] ^ d[19] ^ d[18] ^ d[16] ^ d[14] ^ d[13] ^ d[10] ^ d[7] ^ d[6] ^ d[5] ^ d[3] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[3] ^ c[5] ^ c[6] ^ c[7] ^ c[10] ^ c[13] ^ c[14] ^ c[16] ^ c[18] ^ c[19] ^ c[22] ^ c[25] ^ c[28] ^ c[31];
        newcrc[14] = d[29] ^ d[26] ^ d[23] ^ d[20] ^ d[19] ^ d[17] ^ d[15] ^ d[14] ^ d[11] ^ d[8] ^ d[7] ^ d[6] ^ d[4] ^ d[3] ^ d[2] ^ c[2] ^ c[3] ^ c[4] ^ c[6] ^ c[7] ^ c[8] ^ c[11] ^ c[14] ^ c[15] ^ c[17] ^ c[19] ^ c[20] ^ c[23] ^ c[26] ^ c[29];
        newcrc[15] = d[30] ^ d[27] ^ d[24] ^ d[21] ^ d[20] ^ d[18] ^ d[16] ^ d[15] ^ d[12] ^ d[9] ^ d[8] ^ d[7] ^ d[5] ^ d[4] ^ d[3] ^ c[3] ^ c[4] ^ c[5] ^ c[7] ^ c[8] ^ c[9] ^ c[12] ^ c[15] ^ c[16] ^ c[18] ^ c[20] ^ c[21] ^ c[24] ^ c[27] ^ c[30];
        newcrc[16] = d[30] ^ d[29] ^ d[26] ^ d[24] ^ d[22] ^ d[21] ^ d[19] ^ d[17] ^ d[13] ^ d[12] ^ d[8] ^ d[5] ^ d[4] ^ d[0] ^ c[0] ^ c[4] ^ c[5] ^ c[8] ^ c[12] ^ c[13] ^ c[17] ^ c[19] ^ c[21] ^ c[22] ^ c[24] ^ c[26] ^ c[29] ^ c[30];
        newcrc[17] = d[31] ^ d[30] ^ d[27] ^ d[25] ^ d[23] ^ d[22] ^ d[20] ^ d[18] ^ d[14] ^ d[13] ^ d[9] ^ d[6] ^ d[5] ^ d[1] ^ c[1] ^ c[5] ^ c[6] ^ c[9] ^ c[13] ^ c[14] ^ c[18] ^ c[20] ^ c[22] ^ c[23] ^ c[25] ^ c[27] ^ c[30] ^ c[31];
        newcrc[18] = d[31] ^ d[28] ^ d[26] ^ d[24] ^ d[23] ^ d[21] ^ d[19] ^ d[15] ^ d[14] ^ d[10] ^ d[7] ^ d[6] ^ d[2] ^ c[2] ^ c[6] ^ c[7] ^ c[10] ^ c[14] ^ c[15] ^ c[19] ^ c[21] ^ c[23] ^ c[24] ^ c[26] ^ c[28] ^ c[31];
        newcrc[19] = d[29] ^ d[27] ^ d[25] ^ d[24] ^ d[22] ^ d[20] ^ d[16] ^ d[15] ^ d[11] ^ d[8] ^ d[7] ^ d[3] ^ c[3] ^ c[7] ^ c[8] ^ c[11] ^ c[15] ^ c[16] ^ c[20] ^ c[22] ^ c[24] ^ c[25] ^ c[27] ^ c[29];
        newcrc[20] = d[30] ^ d[28] ^ d[26] ^ d[25] ^ d[23] ^ d[21] ^ d[17] ^ d[16] ^ d[12] ^ d[9] ^ d[8] ^ d[4] ^ c[4] ^ c[8] ^ c[9] ^ c[12] ^ c[16] ^ c[17] ^ c[21] ^ c[23] ^ c[25] ^ c[26] ^ c[28] ^ c[30];
        newcrc[21] = d[31] ^ d[29] ^ d[27] ^ d[26] ^ d[24] ^ d[22] ^ d[18] ^ d[17] ^ d[13] ^ d[10] ^ d[9] ^ d[5] ^ c[5] ^ c[9] ^ c[10] ^ c[13] ^ c[17] ^ c[18] ^ c[22] ^ c[24] ^ c[26] ^ c[27] ^ c[29] ^ c[31];
        newcrc[22] = d[31] ^ d[29] ^ d[27] ^ d[26] ^ d[24] ^ d[23] ^ d[19] ^ d[18] ^ d[16] ^ d[14] ^ d[12] ^ d[11] ^ d[9] ^ d[0] ^ c[0] ^ c[9] ^ c[11] ^ c[12] ^ c[14] ^ c[16] ^ c[18] ^ c[19] ^ c[23] ^ c[24] ^ c[26] ^ c[27] ^ c[29] ^ c[31];
        newcrc[23] = d[31] ^ d[29] ^ d[27] ^ d[26] ^ d[20] ^ d[19] ^ d[17] ^ d[16] ^ d[15] ^ d[13] ^ d[9] ^ d[6] ^ d[1] ^ d[0] ^ c[0] ^ c[1] ^ c[6] ^ c[9] ^ c[13] ^ c[15] ^ c[16] ^ c[17] ^ c[19] ^ c[20] ^ c[26] ^ c[27] ^ c[29] ^ c[31];
        newcrc[24] = d[30] ^ d[28] ^ d[27] ^ d[21] ^ d[20] ^ d[18] ^ d[17] ^ d[16] ^ d[14] ^ d[10] ^ d[7] ^ d[2] ^ d[1] ^ c[1] ^ c[2] ^ c[7] ^ c[10] ^ c[14] ^ c[16] ^ c[17] ^ c[18] ^ c[20] ^ c[21] ^ c[27] ^ c[28] ^ c[30];
        newcrc[25] = d[31] ^ d[29] ^ d[28] ^ d[22] ^ d[21] ^ d[19] ^ d[18] ^ d[17] ^ d[15] ^ d[11] ^ d[8] ^ d[3] ^ d[2] ^ c[2] ^ c[3] ^ c[8] ^ c[11] ^ c[15] ^ c[17] ^ c[18] ^ c[19] ^ c[21] ^ c[22] ^ c[28] ^ c[29] ^ c[31];
        newcrc[26] = d[31] ^ d[28] ^ d[26] ^ d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[20] ^ d[19] ^ d[18] ^ d[10] ^ d[6] ^ d[4] ^ d[3] ^ d[0] ^ c[0] ^ c[3] ^ c[4] ^ c[6] ^ c[10] ^ c[18] ^ c[19] ^ c[20] ^ c[22] ^ c[23] ^ c[24] ^ c[25] ^ c[26] ^ c[28] ^ c[31];
        newcrc[27] = d[29] ^ d[27] ^ d[26] ^ d[25] ^ d[24] ^ d[23] ^ d[21] ^ d[20] ^ d[19] ^ d[11] ^ d[7] ^ d[5] ^ d[4] ^ d[1] ^ c[1] ^ c[4] ^ c[5] ^ c[7] ^ c[11] ^ c[19] ^ c[20] ^ c[21] ^ c[23] ^ c[24] ^ c[25] ^ c[26] ^ c[27] ^ c[29];
        newcrc[28] = d[30] ^ d[28] ^ d[27] ^ d[26] ^ d[25] ^ d[24] ^ d[22] ^ d[21] ^ d[20] ^ d[12] ^ d[8] ^ d[6] ^ d[5] ^ d[2] ^ c[2] ^ c[5] ^ c[6] ^ c[8] ^ c[12] ^ c[20] ^ c[21] ^ c[22] ^ c[24] ^ c[25] ^ c[26] ^ c[27] ^ c[28] ^ c[30];
        newcrc[29] = d[31] ^ d[29] ^ d[28] ^ d[27] ^ d[26] ^ d[25] ^ d[23] ^ d[22] ^ d[21] ^ d[13] ^ d[9] ^ d[7] ^ d[6] ^ d[3] ^ c[3] ^ c[6] ^ c[7] ^ c[9] ^ c[13] ^ c[21] ^ c[22] ^ c[23] ^ c[25] ^ c[26] ^ c[27] ^ c[28] ^ c[29] ^ c[31];
        newcrc[30] = d[30] ^ d[29] ^ d[28] ^ d[27] ^ d[26] ^ d[24] ^ d[23] ^ d[22] ^ d[14] ^ d[10] ^ d[8] ^ d[7] ^ d[4] ^ c[4] ^ c[7] ^ c[8] ^ c[10] ^ c[14] ^ c[22] ^ c[23] ^ c[24] ^ c[26] ^ c[27] ^ c[28] ^ c[29] ^ c[30];
        newcrc[31] = d[31] ^ d[30] ^ d[29] ^ d[28] ^ d[27] ^ d[25] ^ d[24] ^ d[23] ^ d[15] ^ d[11] ^ d[9] ^ d[8] ^ d[5] ^ c[5] ^ c[8] ^ c[9] ^ c[11] ^ c[15] ^ c[23] ^ c[24] ^ c[25] ^ c[27] ^ c[28] ^ c[29] ^ c[30] ^ c[31];
        crc = newcrc;
    end
    crc32 = crc; //{crc[7:0],crc[15:8],crc[23:16],crc[31:24]};
    //`uvm_info("COMMON_METHOD",$sformatf("CRC32_D32 FINAL: crc32=0h%h",crc32),UVM_FULL);
    return crc32;
endfunction:crc32_d32

endpackage

import tcnt_common_method::*;

`endif
