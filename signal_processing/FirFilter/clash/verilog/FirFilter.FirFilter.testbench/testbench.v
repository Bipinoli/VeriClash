/* AUTOMATICALLY GENERATED VERILOG-2001 SOURCE CODE.
** GENERATED BY CLASH 1.6.4. DO NOT MODIFY.
*/
`timescale 100fs/100fs
module testbench
    ( // No inputs

      // Outputs
      output wire  done
    );
  wire [4:0] c$ds_app_arg;
  wire signed [15:0] c$ds_app_arg_0;
  reg [4:0] s = 5'd0;
  // FirFilter.hs:21:5-7
  wire  \FirFilter.FirFilter.testbench_clk ;
  wire [4:0] z;
  wire [3:0] result;
  wire signed [15:0] c$ds_app_arg_1;
  wire  c$result_rec;
  reg [3:0] s_0 = 4'd0;
  wire  f1;
  reg  \f'  = 1'b0;
  wire signed [15:0] result_0;
  reg [2:0] ignoreFor3_counter = 3'd0;
  wire [3:0] z_0;
  wire [2:0] result_1;
  // FirFilter.hs:19:1-9
  wire signed [15:0] \c$FirFilter.FirFilter.testbench_app_arg ;
  // FirFilter.hs:19:1-9
  wire  \c$FirFilter.FirFilter.testbench_app_arg_0 ;
  wire [271:0] c$vecFlat;
  wire [191:0] c$vecFlat_0;
  wire  arg_0;
  wire  arg_1;
  wire  arg_2;
  wire signed [15:0] arg_3;
  wire signed [15:0] result_5;

  assign c$ds_app_arg = (s < 5'd16) ? (s + 5'd1) : s;

  assign c$vecFlat = {16'sd0,   16'sd5,
                      16'sd10,   16'sd5,   16'sd0,   -16'sd5,
                      -16'sd10,   -16'sd5,   16'sd0,   16'sd5,
                      16'sd10,   16'sd5,   16'sd0,   -16'sd5,
                      -16'sd10,   -16'sd5,   16'sd0};

  // index begin
  wire signed [15:0] vecArray [0:17-1];
  genvar i;
  generate
  for (i=0; i < 17; i=i+1) begin : mk_array
    assign vecArray[(17-1)-i] = c$vecFlat[i*16+:16];
  end
  endgenerate
  assign c$ds_app_arg_0 = vecArray[($unsigned({{(64-5) {1'b0}},s}))];
  // index end

  // register begin
  always @(posedge \FirFilter.FirFilter.testbench_clk  or  posedge  \c$FirFilter.FirFilter.testbench_app_arg_0 ) begin : s_register
    if ( \c$FirFilter.FirFilter.testbench_app_arg_0 ) begin
      s <= 5'd0;
    end else begin
      s <= c$ds_app_arg;
    end
  end
  // register end

  // tbClockGen begin
  // pragma translate_off
  reg  clk;
  // 1 = 0.1ps
  localparam half_period = (100000 / 2);
  always begin
    // Delay of 1 mitigates race conditions (https://github.com/steveicarus/iverilog/issues/160)
    #1 clk =  0 ;
    `ifndef VERILATOR
    #100000 forever begin
      if (~ (~ c$result_rec)) begin
        $finish;
      end
      clk = ~ clk;
      #half_period;
      clk = ~ clk;
      #half_period;
    end
    `else
    clk = $c("this->tb_clock_gen(",half_period,",true,",(~ (~ c$result_rec)),")");
    `endif
  end

  `ifdef VERILATOR
    `systemc_interface
    CData tb_clock_gen(vluint32_t half_period, bool active_rising, bool result_rec) {
      static vluint32_t init_wait = 100000;
      static vluint32_t to_wait = 0;
      static CData clock = active_rising ? 0 : 1;

      if(init_wait == 0) {
        if(result_rec) {
          std::exit(0);
        }
        else {
          if(to_wait == 0) {
            to_wait = half_period - 1;
            clock = clock == 0 ? 1 : 0;
          }
          else {
            to_wait = to_wait - 1;
          }
        }
      }
      else {
        init_wait = init_wait - 1;
      }

      return clock;
    }
    `verilog
  `endif

  assign \FirFilter.FirFilter.testbench_clk  = clk;
  // pragma translate_on
  // tbClockGen end

  assign z = s_0 + 4'd1;

  assign result = (z > 5'd11) ? 4'd11 : (z[0+:4]);

  assign c$vecFlat_0 = {16'sd0,   16'sd0,
                        16'sd0,   16'sd0,   16'sd0,   16'sd30,
                        16'sd0,   -16'sd30,   -16'sd40,   -16'sd30,
                        16'sd0,   16'sd30};

  // index begin
  wire signed [15:0] vecArray_0 [0:12-1];
  genvar i_0;
  generate
  for (i_0=0; i_0 < 12; i_0=i_0+1) begin : mk_array_0
    assign vecArray_0[(12-1)-i_0] = c$vecFlat_0[i_0*16+:16];
  end
  endgenerate
  assign c$ds_app_arg_1 = vecArray_0[($unsigned({{(64-4) {1'b0}},s_0}))];
  // index end

  assign c$result_rec = \f'  ? \f'  : f1;

  // register begin
  always @(posedge \FirFilter.FirFilter.testbench_clk  or  posedge  \c$FirFilter.FirFilter.testbench_app_arg_0 ) begin : s_0_register
    if ( \c$FirFilter.FirFilter.testbench_app_arg_0 ) begin
      s_0 <= 4'd0;
    end else begin
      s_0 <= result;
    end
  end
  // register end

  // assert begin
  // pragma translate_off
  always @(posedge \FirFilter.FirFilter.testbench_clk ) begin
    if (result_0 !== c$ds_app_arg_1) begin
      $display("@%0tns: %s, expected: %b, actual: %b", $time, ("outputVerifier"), c$ds_app_arg_1, result_0);
      $finish;
    end
  end
  // pragma translate_on
  assign f1 = \f' ;
  // assert end

  // register begin
  always @(posedge \FirFilter.FirFilter.testbench_clk  or  posedge  \c$FirFilter.FirFilter.testbench_app_arg_0 ) begin : f_register
    if ( \c$FirFilter.FirFilter.testbench_app_arg_0 ) begin
      \f'  <= 1'b0;
    end else begin
      \f'  <= (s_0 == 4'd11);
    end
  end
  // register end

  assign result_0 = (ignoreFor3_counter == 3'd5) ? \c$FirFilter.FirFilter.testbench_app_arg  : 16'sd0;

  // register begin
  always @(posedge \FirFilter.FirFilter.testbench_clk  or  posedge  \c$FirFilter.FirFilter.testbench_app_arg_0 ) begin : ignoreFor3_counter_register
    if ( \c$FirFilter.FirFilter.testbench_app_arg_0 ) begin
      ignoreFor3_counter <= 3'd0;
    end else begin
      ignoreFor3_counter <= result_1;
    end
  end
  // register end

  assign z_0 = ignoreFor3_counter + 3'd1;

  assign result_1 = (z_0 > 4'd5) ? 3'd5 : (z_0[0+:3]);

  assign arg_0 = \FirFilter.FirFilter.testbench_clk ;

  assign arg_1 = \c$FirFilter.FirFilter.testbench_app_arg_0 ;

  assign arg_2 = 1'b1;

  assign arg_3 = c$ds_app_arg_0;

  topEntity topEntity_c$FirFilterFirFiltertestbench_app_arg
    (arg_0, arg_1, arg_2, arg_3, result_5);

  assign \c$FirFilter.FirFilter.testbench_app_arg  = result_5;

  // resetGen begin
  // pragma translate_off
  reg  rst;
  localparam reset_period = 100000 - 10 + (1 * 100000);
  `ifndef VERILATOR
  initial begin
    #1 rst =  1 ;
    #reset_period rst =  0 ;
  end
  `else
  always begin
    // The redundant (rst | ~ rst) is needed to ensure that this is
    // calculated in every cycle by verilator. Without it, the reset will stop
    // being updated and will be stuck as asserted forever.
    rst = $c("this->reset_gen(",reset_period,",true)") & (rst | ~ rst);
  end
  `systemc_interface
  CData reset_gen(vluint32_t reset_period, bool active_high) {
    static vluint32_t to_wait = reset_period;
    static CData reset = active_high ? 1 : 0;
    static bool finished = false;

    if(!finished) {
      if(to_wait == 0) {
        reset = reset == 0 ? 1 : 0;
        finished = true;
      }
      else {
        to_wait = to_wait - 1;
      }
    }

    return reset;
  }
  `verilog
  `endif
  assign \c$FirFilter.FirFilter.testbench_app_arg_0  = rst;
  // pragma translate_on
  // resetGen end

  assign done = c$result_rec;


endmodule

