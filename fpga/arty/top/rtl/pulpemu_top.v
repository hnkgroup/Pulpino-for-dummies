// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

module pulpemu_top(
   input          CLK_100, // 100MHz reference clock
   input          RST_N, 
 
   input    [3:0] SW,   // switch
   input    [3:0] BTN,  // button
   output   [3:0] LED,

   output   [7:0] GPIO,

   // JTAG
   input          TCK,
   input          TRSTN,
   input          TDI,
   input          TMS,
   output         TDO,
  
   // UART
   input          UART_RX,
   output         UART_TX
   
  );

wire        pulp_clk;
wire        pulp_rstn;
assign pulp_rstn = RST_N;  // (kle) revisit...add debouncer

wire [31:0] gpio_dir;                // output
wire [31:0] gpio_in;                 // input
wire [31:0] gpio_out;                // output


///////////////////////////////////////////////
// MMCM, 100MHz -> 50MHz clock generator
///////////////////////////////////////////////
clk_wiz_0 clk_gen_u(
   .clk_out1   (pulp_clk),
   .reset      (~pulp_rstn),
   .locked     (),
   .clk_in1    (CLK_100)
);

///////////////////////////////////////////////
// BLINKING LED
///////////////////////////////////////////////
reg   [31:0]   cntr;
reg            led;
always @(posedge pulp_clk, negedge pulp_rstn)
begin
   if (~pulp_rstn) begin
      led <= 1'b0;
      cntr <= 32'b0;   
   end
   else begin
      if (cntr < 32'h17D7840)
         cntr <= cntr + 1;
      else begin
         led <= ~led;
         cntr <= 32'b0;
      end   
   end 
end 
assign LED[0] = led;
assign LED[3:1] = 3'b0;

///////////////////////////////////////////////
// GPIO
///////////////////////////////////////////////
assign gpio_in[3:0]   = SW;
assign gpio_in[7:4]   = 4'b0;
assign gpio_in[15:8]  = 8'b0;
assign gpio_in[20:16] = BTN;
assign gpio_in[31:21] = 11'b0;

assign GPIO = gpio_out[15:8];

///////////////////////////////////////////////
// PULPino SoC
///////////////////////////////////////////////
pulpino  pulpino_wrap_i (
  .clk               ( pulp_clk  ),
  .rst_n             ( pulp_rstn ),

  .fetch_enable_i    ( 1'b1      ), // pulpino enable
// (kle)
//  .fetch_enable_i    ( fetch_en       ),

  .tck_i             ( TCK            ),
  .trstn_i           ( TRSTN          ),
  .tms_i             ( TMS            ),
  .tdi_i             ( TDI            ),
  .tdo_o             ( TDO            ),
// (kle)
//  .tck_i             ( tck_i          ),
//  .trstn_i           ( trst_ni        ),
//  .tms_i             ( tms_i          ),
//  .tdi_i             ( td_i           ),
//  .tdo_o             ( td_o           ),

  .spi_clk_i         ( 1'b0           ),
  .spi_cs_i          ( 1'b0           ),
  .spi_mode_o        (                ),
  .spi_sdi0_i        ( 1'b0           ),
  .spi_sdi1_i        ( 1'b0           ),
  .spi_sdi2_i        ( 1'b0           ),
  .spi_sdi3_i        ( 1'b0           ),
  .spi_sdo0_o        (                ),
  .spi_sdo1_o        (                ),
  .spi_sdo2_o        (                ),
  .spi_sdo3_o        (                ),
// (kle)
//  .spi_clk_i         ( spi_sck        ),
//  .spi_cs_i          ( spi_cs         ),
//  .spi_mode_o        (                ),
//  .spi_sdi0_i        ( spi_mosi       ),
//  .spi_sdi1_i        ( 1'b0           ),
//  .spi_sdi2_i        ( 1'b0           ),
//  .spi_sdi3_i        ( 1'b0           ),
//  .spi_sdo0_o        ( spi_miso       ),
//  .spi_sdo1_o        (                ),
//  .spi_sdo2_o        (                ),
//  .spi_sdo3_o        (                ),

  .spi_master_clk_o  (                ),
  .spi_master_csn0_o (                ),
  .spi_master_csn1_o (                ),
  .spi_master_csn2_o (                ),
  .spi_master_csn3_o (                ),
  .spi_master_mode_o (                ),
  .spi_master_sdi0_i ( 1'b0           ),
  .spi_master_sdi1_i ( 1'b0           ),
  .spi_master_sdi2_i ( 1'b0           ),
  .spi_master_sdi3_i ( 1'b0           ),
  .spi_master_sdo0_o (                ),
  .spi_master_sdo1_o (                ),
  .spi_master_sdo2_o (                ),
  .spi_master_sdo3_o (                ),

  .scl_i             ( 1'b0           ),
  .scl_o             (                ),
  .scl_oen_o         (                ),
  .sda_i             ( 1'b0           ),
  .sda_o             (                ),
  .sda_oen_o         (                ),
// (kle)
//  .scl_i             ( scl_in         ),
//  .scl_o             ( scl_out        ),
//  .scl_oen_o         ( scl_oen        ),
//  .sda_i             ( sda_in         ),
//  .sda_o             ( sda_out        ),
//  .sda_oen_o         ( sda_oen        ),

  .gpio_in           ( gpio_in        ),
  .gpio_out          ( gpio_out       ),
  .gpio_dir          ( gpio_dir       ),

  .uart_tx           ( UART_TX        ), // output
  .uart_rx           ( UART_RX        ), // input
  .uart_rts          (                ), // output
  .uart_dtr          (                ), // output
  .uart_cts          ( 1'b0           ), // input
  .uart_dsr          ( 1'b0           )  // input
);

endmodule
