#  ------------------------------------------------------------------------------
#
#  uart_transmitter.sdc -- sample SDC file for uart_transmitter project
#
#  Copyright (C) 2020 Michael Gansler
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
#  ------------------------------------------------------------------------------
create_clock -name "clk_50M" -period 20.0ns [get_ports {clk_50M}]
derive_pll_clocks
derive_clock_uncertainty
