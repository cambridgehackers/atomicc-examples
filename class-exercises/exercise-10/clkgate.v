////////////////////////////////////////////////////////////////////////////////
//
// Filename: 	clkgate.v
//
// Project:	A set of Yosys Formal Verification exercises
//
// Background:	This file contains an implementation of a clock gate.  The
//		clock should only tick if the enable line is high.
//
// Assume:
//	1. A single incoming clock
//
//	2. An enable line that is not synchronous to it
//
// To prove:
//
//	1. Glitches in the enable line will not create glitches in the clock
//
//	2. The latch can be successfully replaced with a flip flop
//
//
// Creator:	Dan Gisselquist, Ph.D.
//		Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2018, Gisselquist Technology, LLC
//
// This program is free software (firmware): you can redistribute it and/or
// modify it under the terms of the GNU General Public License as published
// by the Free Software Foundation, either version 3 of the License, or (at
// your option) any later version.
//
// This program is distributed in the hope that it will be useful, but WITHOUT
// ANY WARRANTY; without even the implied warranty of MERCHANTIBILITY or
// FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
// for more details.
//
// You should have received a copy of the GNU General Public License along
// with this program.  (It's in the $(ROOT)/doc directory.  Run make with no
// target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
//
// License:	GPL, v3, as defined and found on www.gnu.org,
//		http://www.gnu.org/licenses/gpl.html
//
//
////////////////////////////////////////////////////////////////////////////////
//
//
`default_nettype	none
//
//
module clkgate(i_clk, i_areset_n, i_en, o_clk);
	input	wire	i_clk, i_areset_n, i_en;
	output	wire	o_clk;

	reg	latch;

	always @(*)
	if (!i_areset_n)
		latch = 1'b0;
	else if (!i_clk)
		latch = i_en;

	assign	o_clk = (latch)&&(i_clk);

`ifdef	FORMAL
	(* gclk *) reg	sim_clk;
	reg	f_past_valid;

	initial	f_past_valid = 1'b0;
	always @(posedge sim_clk)
		f_past_valid <= 1'b1;

	//
	// Your logic goes here
	//
`endif
endmodule
