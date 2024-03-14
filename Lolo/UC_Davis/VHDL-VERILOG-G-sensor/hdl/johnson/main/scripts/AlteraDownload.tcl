# Load Quartus II Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
    if {[string compare $quartus(project) "logisimTopLevelShell"]} {
        puts "Project logisimTopLevelShell is not open"
        set make_assignments 0
    }
} else {
    # Only open if not already open
    if {[project_exists logisimTopLevelShell]} {
        project_open -revision logisimTopLevelShell logisimTopLevelShell
    } else {
        project_new -revision logisimTopLevelShell logisimTopLevelShell
    }
    set need_to_close_project 1
}
# Make assignments
if {$make_assignments} {

   set_global_assignment -name FAMILY "MAX 10"
   set_global_assignment -name DEVICE 10M50DAF484C7G
   set_global_assignment -name DEVICE_FILTER_PACKAGE FBGA
   set_global_assignment -name DEVICE_FILTER_PIN_COUNT 484
   set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"
   set_global_assignment -name FMAX_REQUIREMENT "100 MHz "
   set_global_assignment -name RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
   set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"

    # Include all entities and gates


    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/base/LogisimClockComponent_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/base/logisimTickGenerator_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/circuit/accel_driver_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/circuit/clock_div_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/circuit/main_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/circuit/spi_accelerometer_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/circuit/spi_master_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/toplevel/logisimTopLevelShell_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/base/LogisimClockComponent_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/base/logisimTickGenerator_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/circuit/accel_driver_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/circuit/clock_div_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/circuit/main_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/circuit/spi_accelerometer_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/circuit/spi_master_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//johnson/main/vhdl/toplevel/logisimTopLevelShell_behavior.vhd"

    # Map fpga_clk and ionets to fpga pins
    set_location_assignment PIN_N14 -to fpgaGlobalClock
            set_location_assignment PIN_Y14 -to int1_0
            set_location_assignment PIN_AB16 -to cs_0
            set_location_assignment PIN_B14 -to rst_0
            set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to rst_0
            set_location_assignment PIN_F15 -to intbypass_0
            set_instance_assignment -name WEAK_PULL_UP_RESISTOR ON -to intbypass_0
            set_location_assignment PIN_V12 -to miso_0
            set_location_assignment PIN_V11 -to mosi_0
            set_location_assignment PIN_AB15 -to sclk_0
    # Commit assignments
    export_assignments

    # Close project
    if {$need_to_close_project} {
        project_close
    }
}

