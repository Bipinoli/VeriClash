/* AUTOMATICALLY GENERATED VERILOG-2001 SOURCE CODE.
** GENERATED BY CLASH 1.6.4. DO NOT MODIFY.
*/
`timescale 100fs/100fs
module topEntity
    ( // Inputs
      input  eta // clock
    , input  eta1 // reset
    , input  eta2 // enable

      // Outputs
    , output wire [3:0] result
    );
  reg [3:0] result_1 = 4'd0;

  // register begin
  always @(posedge eta or  posedge  eta1) begin : result_1_register
    if ( eta1) begin
      result_1 <= 4'd0;
    end else if (eta2) begin
      result_1 <= (result_1 + 4'd1);
    end
  end
  // register end

  assign result = result_1;


endmodule

