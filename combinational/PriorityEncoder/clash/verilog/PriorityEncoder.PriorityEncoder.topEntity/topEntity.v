/* AUTOMATICALLY GENERATED VERILOG-2001 SOURCE CODE.
** GENERATED BY CLASH 1.6.4. DO NOT MODIFY.
*/
`timescale 100fs/100fs
module topEntity
    ( // Inputs
      input  c$arg_0
    , input [7:0] c$arg_1

      // Outputs
    , output reg [2:0] c$case_alt
    );
  // PriorityEncoder.hs:11:1-15
  wire  enable;
  // PriorityEncoder.hs:11:1-15
  wire [7:0] channels;
  wire [2:0] c$case_alt_1;
  wire [2:0] c$case_alt_2;
  wire [2:0] c$case_alt_3;
  wire [2:0] c$case_alt_4;
  wire [2:0] c$case_alt_5;
  wire [2:0] c$case_alt_6;
  wire [2:0] c$case_alt_7;
  wire [2:0] c$case_alt_8;
  wire [8:0] c$arg;
  wire [0:0] c$case_alt_selection_res;

  assign c$arg = {c$arg_0,   c$arg_1};

  assign enable = c$arg[8:8];

  assign channels = c$arg[7:0];

  assign c$case_alt_selection_res = (enable);

  always @(*) begin
    case(c$case_alt_selection_res)
      1'b1 : c$case_alt = c$case_alt_1;
      default : c$case_alt = {3 {1'bx}};
    endcase
  end

  assign c$case_alt_1 = ((channels & 8'b10000000) != 8'b00000000) ? 3'd7 : c$case_alt_2;

  assign c$case_alt_2 = ((channels & 8'b01000000) != 8'b00000000) ? 3'd6 : c$case_alt_3;

  assign c$case_alt_3 = ((channels & 8'b00100000) != 8'b00000000) ? 3'd5 : c$case_alt_4;

  assign c$case_alt_4 = ((channels & 8'b00010000) != 8'b00000000) ? 3'd4 : c$case_alt_5;

  assign c$case_alt_5 = ((channels & 8'b00001000) != 8'b00000000) ? 3'd3 : c$case_alt_6;

  assign c$case_alt_6 = ((channels & 8'b00000100) != 8'b00000000) ? 3'd2 : c$case_alt_7;

  assign c$case_alt_7 = ((channels & 8'b00000010) != 8'b00000000) ? 3'd1 : c$case_alt_8;

  assign c$case_alt_8 = ((channels & 8'b00000001) != 8'b00000000) ? 3'd0 : ({3 {1'bx}});


endmodule

