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


    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//accelerometer_v2/freq_test/vhdl/base/LogisimClockComponent_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//accelerometer_v2/freq_test/vhdl/base/logisimTickGenerator_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//accelerometer_v2/freq_test/vhdl/circuit/freq_test_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//accelerometer_v2/freq_test/vhdl/toplevel/logisimTopLevelShell_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//accelerometer_v2/freq_test/vhdl/base/LogisimClockComponent_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//accelerometer_v2/freq_test/vhdl/base/logisimTickGenerator_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//accelerometer_v2/freq_test/vhdl/circuit/freq_test_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//accelerometer_v2/freq_test/vhdl/toplevel/logisimTopLevelShell_behavior.vhd"

    # Map fpga_clk and ionets to fpga pins
    set_location_assignment PIN_N5 -to fpgaGlobalClock
            set_location_assignment PIN_A8 -to led_0
    # Commit assignments
    export_assignments

    # Close project
    if {$need_to_close_project} {
        project_close
    }
}

