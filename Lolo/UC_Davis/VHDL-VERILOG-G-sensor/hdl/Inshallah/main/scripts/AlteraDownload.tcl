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
   set_global_assignment -name FMAX_REQUIREMENT "10 MHz "
   set_global_assignment -name RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
   set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"

    # Include all entities and gates


    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//Inshallah/main/vhdl/base/LogisimClockComponent_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//Inshallah/main/vhdl/base/logisimTickGenerator_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//Inshallah/main/vhdl/circuit/accel_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//Inshallah/main/vhdl/circuit/main_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//Inshallah/main/vhdl/toplevel/logisimTopLevelShell_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//Inshallah/main/vhdl/base/LogisimClockComponent_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//Inshallah/main/vhdl/base/logisimTickGenerator_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//Inshallah/main/vhdl/circuit/accel_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//Inshallah/main/vhdl/circuit/main_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/UC_Davis/VHDL-VERILOG-G-sensor/hdl//Inshallah/main/vhdl/toplevel/logisimTopLevelShell_behavior.vhd"

    # Map fpga_clk and ionets to fpga pins
    set_location_assignment PIN_N5 -to fpgaGlobalClock
            set_location_assignment PIN_C14 -to n_Output_bus_1_0
            set_location_assignment PIN_E15 -to n_Output_bus_1_1
            set_location_assignment PIN_C15 -to n_Output_bus_1_2
            set_location_assignment PIN_C16 -to n_Output_bus_1_3
            set_location_assignment PIN_E16 -to n_Output_bus_1_4
            set_location_assignment PIN_D17 -to n_Output_bus_1_5
            set_location_assignment PIN_C17 -to n_Output_bus_1_6
            set_location_assignment PIN_D15 -to n_Output_bus_1_7
            set_location_assignment PIN_B8 -to n_Input_bus_1_0
            set_location_assignment PIN_A7 -to n_Input_bus_1_1
    # Commit assignments
    export_assignments

    # Close project
    if {$need_to_close_project} {
        project_close
    }
}

