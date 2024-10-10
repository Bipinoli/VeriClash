/* AUTOMATICALLY GENERATED VERILOG-2001 SOURCE CODE.
** GENERATED BY CLASH 1.6.4. DO NOT MODIFY.
*/
`timescale 100fs/100fs
module topEntity
    ( // Inputs
      input  eta // clock
    , input  eta1 // reset
    , input  eta2 // enable
    , input [8:0] c$arg

      // Outputs
    , output wire signed [7:0] result
    );
  // RingBuffer.hs:25:1-80
  reg [87:0] c$ds_app_arg = {{8'sd0,   8'sd0,   8'sd0,   8'sd0,   8'sd0,   8'sd0,   8'sd0,   8'sd0,
  8'sd0,   8'sd0},   4'd0,   4'd0};
  wire [3:0] \c$rem#Out ;
  wire [3:0] \c$rem#Out_app_arg ;
  // RingBuffer.hs:17:1-12
  wire [79:0] c$ds1_app_arg;
  // RingBuffer.hs:17:1-12
  wire signed [7:0] c$ds1_app_arg_0;
  wire [95:0] result_1;
  wire [95:0] result_2;
  // RingBuffer.hs:17:1-12
  wire [79:0] memory;
  // RingBuffer.hs:17:1-12
  wire [3:0] head;
  // RingBuffer.hs:17:1-12
  wire [3:0] tail;
  // RingBuffer.hs:17:1-12
  wire signed [7:0] val;

  // register begin
  always @(posedge eta or  posedge  eta1) begin : c$ds_app_arg_register
    if ( eta1) begin
      c$ds_app_arg <= {{8'sd0,   8'sd0,   8'sd0,   8'sd0,   8'sd0,   8'sd0,   8'sd0,   8'sd0,
    8'sd0,   8'sd0},   4'd0,   4'd0};
    end else if (eta2) begin
      c$ds_app_arg <= result_2[95:8];
    end
  end
  // register end

  assign result = $signed(result_2[7:0]);

  assign \c$rem#Out  = \c$rem#Out_app_arg  % 4'd10;

  assign \c$rem#Out_app_arg  = c$arg[8:8] ? (tail + 4'd1) : (head + 4'd1);

  // vector replace begin
  genvar i;
  generate
  for (i=0;i<10;i=i+1) begin : vector_replace
    assign c$ds1_app_arg[(9-i)*8+:8] = ($unsigned({{(64-4) {1'b0}},head})) == i ? val : memory[(9-i)*8+:8];
  end
  endgenerate
  // vector replace end

  // index begin
  wire signed [7:0] vecArray [0:10-1];
  genvar i_0;
  generate
  for (i_0=0; i_0 < 10; i_0=i_0+1) begin : mk_array
    assign vecArray[(10-1)-i_0] = memory[i_0*8+:8];
  end
  endgenerate
  assign c$ds1_app_arg_0 = vecArray[($unsigned({{(64-4) {1'b0}},tail}))];
  // index end

  assign result_1 = c$arg[8:8] ? {memory,   head,
                                  \c$rem#Out ,
                                  c$ds1_app_arg_0} : {c$ds1_app_arg,
                                                      \c$rem#Out ,   tail,   8'sd0};

  assign result_2 = {{result_1[95:16],
                      result_1[15:12],   result_1[11:8]},
                     $signed(result_1[7:0])};

  assign memory = c$ds_app_arg[87:8];

  assign head = c$ds_app_arg[7:4];

  assign tail = c$ds_app_arg[3:0];

  assign val = $signed(c$arg[7:0]);


endmodule

