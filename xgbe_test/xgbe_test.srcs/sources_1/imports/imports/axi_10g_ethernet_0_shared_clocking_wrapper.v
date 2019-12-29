// ----------------------------------------------------------------------------
// (c) Copyright 2014 Xilinx, Inc. All rights reserved.
//
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
//
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
//
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
//
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// ----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Title      : Support clocking wrapper level for 10G Gigabit Ethernet
// Project    : 10G Gigabit Ethernet
//-----------------------------------------------------------------------------
// File       : axi_10g_ethernet_0_shared_clocking_wrapper.v
// Author     : Xilinx Inc.
//-----------------------------------------------------------------------------
// Description: This is the Shared clocking wrapper level code for the 10G
//              Gigabit Ethernet Core.  It contains the shareable clocking,
//              reset circuitry and the gt common block.
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

module axi_10g_ethernet_0_shared_clocking_wrapper  (
   input          reset,
   input          refclk_p,
   input          refclk_n,
   input          dclk,
   input    [1:0] txoutclk,
   output         coreclk,
   output wire areset_coreclk,
   output         gttxreset,
   output         gtrxreset,
   output   [1:0] txuserrdy,
   output   [1:0] txusrclk,
   output   [1:0] txusrclk2,
   output         reset_counter_done,
   output   [1:0] qplllock_out,
   output   [1:0] qplloutclk,
   output   [1:0] qplloutrefclk
   );

/*-------------------------------------------------------------------------*/

  // Signal declarations
  wire [1:0] qplllock;
  wire   refclk;
  wire   counter_done;
  wire   qpllreset;

  assign qplllock_out           = qplllock;
  assign reset_counter_done     = counter_done;


  //---------------------------------------------------------------------------
  // Instantiate the 10GBASER/KR GT Common blocks
  //---------------------------------------------------------------------------
  genvar j;
  generate
    for (j = 0; j < 2; j = j + 1)
    begin
      axi_10g_ethernet_0_gt_common # (
          .WRAPPER_SIM_GTRESET_SPEEDUP("TRUE") ) //Does not affect hardware
      gt_common_block_i
        (
         .refclk                (refclk),
         .qpllreset             (qpllreset),
         .qplllock              (qplllock[j]),
         .qplloutclk            (qplloutclk[j]),
         .qplloutrefclk         (qplloutrefclk[j])
        );
    end
  endgenerate
  //---------------------------------------------------------------------------
  // Instantiate the 10GBASER/KR shared clock/reset block
  //---------------------------------------------------------------------------

  axi_10g_ethernet_0_shared_clock_and_reset ethernet_shared_clock_reset_block_i
    (
     .areset                (reset),
     .coreclk               (coreclk),
     .refclk_p              (refclk_p),
     .refclk_n              (refclk_n),
     .refclk                (refclk),
     .txoutclk              (txoutclk),
     .qplllock              (qplllock),
     .areset_coreclk        (areset_coreclk),
     .gttxreset             (gttxreset),
     .gtrxreset             (gtrxreset),
     .txuserrdy             (txuserrdy),
     .txusrclk              (txusrclk),
     .txusrclk2             (txusrclk2),
     .qpllreset             (qpllreset),
     .reset_counter_done    (counter_done)
    );

endmodule
