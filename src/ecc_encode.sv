// Copyright 2020 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
// Author: Florian Zaruba <zarubaf@iis.ee.ethz.ch>
// ECC Encoder
//
// Implements SECDED (Single Error Correction, Double Error Detection) Hamming Code
// with extended parity bit [1].
// The module receives a data word and encodes it using above mentioned error
// detection and correction code. The corresponding decode module
// can be found in `ecc_decode.sv`
// [1] https://en.wikipedia.org/wiki/Hamming_code

// Author: Florian Zaruba <zarubaf@iis.ee.ethz.ch>
module ecc_encode #(
  parameter  int unsigned DataWidth   = 64,
  // Do not change
  parameter int unsigned ParityWidth   = ecc_pkg::get_parity_width(DataWidth),
  parameter int unsigned CodeWordWidth = ecc_pkg::get_cw_width(DataWidth)
) (
  input  logic [DataWidth-1:0]   data_i,
  output logic [CodeWordWidth:0] data_o
);

logic [ParityWidth-1:0]   parity_codeword;
logic [CodeWordWidth-1:0] data;
logic [CodeWordWidth-1:0] codeword;
logic                     parity;

// Expand incoming data to codeword width
always_comb begin : expand_data
  automatic int unsigned idx;
  data = '0;
  idx = 0;
  for (int unsigned i = 1; i < CodeWordWidth + 1; i++) begin
    // if it is not a power of two word it is a normal data index
    if (unsigned'(2**$clog2(i)) != i) begin
      data[i - 1] = data_i[idx];
      idx++;
    end
  end
end

// calculate codeword
always_comb begin : calculate_syndrome
  parity_codeword = 0;
  for (int unsigned i = 0; i < ParityWidth; i++) begin
    for (int unsigned j = 1; j < CodeWordWidth + 1; j++) begin
      if (|(unsigned'(2**i) & j)) parity_codeword[i] = parity_codeword[i] ^ data[j - 1];
    end
  end
end

// fuse the final codeword
always_comb begin : generate_codeword
    codeword = data;
    for (int unsigned i = 0; i < ParityWidth; i++) begin
      codeword[2**i-1] = parity_codeword[i];
    end
end

assign parity = ^codeword;
// output the final codeword
assign data_o = {parity, codeword};

endmodule