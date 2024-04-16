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


    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/base/LogisimClockComponent_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/base/logisimTickGenerator_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/circuit/hex_to_decimal_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/circuit/lowpass_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/circuit/lowpass_tb_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/circuit/sevenseg_accel_logic_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/circuit/sevenseg_accel_output_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/circuit/sign_hex_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/circuit/sign_hex_out_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/gates/AND_GATE_3_INPUTS_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/gates/AND_GATE_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/gates/OR_GATE_4_INPUTS_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/gates/OR_GATE_5_INPUTS_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/gates/OR_GATE_6_INPUTS_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/memory/REGISTER_FLIP_FLOP_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/toplevel/logisimTopLevelShell_entity.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/base/LogisimClockComponent_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/base/logisimTickGenerator_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/circuit/hex_to_decimal_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/circuit/lowpass_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/circuit/lowpass_tb_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/circuit/sevenseg_accel_logic_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/circuit/sevenseg_accel_output_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/circuit/sign_hex_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/circuit/sign_hex_out_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/gates/AND_GATE_3_INPUTS_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/gates/AND_GATE_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/gates/OR_GATE_4_INPUTS_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/gates/OR_GATE_5_INPUTS_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/gates/OR_GATE_6_INPUTS_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/memory/REGISTER_FLIP_FLOP_behavior.vhd"
    set_global_assignment -name VHDL_FILE "C:/Users/lolon/OneDrive/EPFL/Semester_Project/Shared_Folder/Lolo/Johnson_SPI//print_ADXL345_values/lowpass_tb/vhdl/toplevel/logisimTopLevelShell_behavior.vhd"

    # Map fpga_clk and ionets to fpga pins
    set_location_assignment PIN_N14 -to fpgaGlobalClock
            set_location_assignment PIN_C14 -to n_HEX1_L_7_Segment_Display_1_Segment_A
            set_location_assignment PIN_E15 -to n_HEX1_L_7_Segment_Display_1_Segment_B
            set_location_assignment PIN_C15 -to n_HEX1_L_7_Segment_Display_1_Segment_C
            set_location_assignment PIN_C16 -to n_HEX1_L_7_Segment_Display_1_Segment_D
            set_location_assignment PIN_E16 -to n_HEX1_L_7_Segment_Display_1_Segment_E
            set_location_assignment PIN_D17 -to n_HEX1_L_7_Segment_Display_1_Segment_F
            set_location_assignment PIN_C17 -to n_HEX1_L_7_Segment_Display_1_Segment_G
            set_location_assignment PIN_D15 -to n_HEX1_L_7_Segment_Display_1_DecimalPoint
            set_location_assignment PIN_C18 -to n_HEX2_L_7_Segment_Display_1_Segment_A
            set_location_assignment PIN_D18 -to n_HEX2_L_7_Segment_Display_1_Segment_B
            set_location_assignment PIN_E18 -to n_HEX2_L_7_Segment_Display_1_Segment_C
            set_location_assignment PIN_B16 -to n_HEX2_L_7_Segment_Display_1_Segment_D
            set_location_assignment PIN_A17 -to n_HEX2_L_7_Segment_Display_1_Segment_E
            set_location_assignment PIN_A18 -to n_HEX2_L_7_Segment_Display_1_Segment_F
            set_location_assignment PIN_B17 -to n_HEX2_L_7_Segment_Display_1_Segment_G
            set_location_assignment PIN_A16 -to n_HEX2_L_7_Segment_Display_1_DecimalPoint
            set_location_assignment PIN_B20 -to n_HEX3_L_7_Segment_Display_1_Segment_A
            set_location_assignment PIN_A20 -to n_HEX3_L_7_Segment_Display_1_Segment_B
            set_location_assignment PIN_B19 -to n_HEX3_L_7_Segment_Display_1_Segment_C
            set_location_assignment PIN_A21 -to n_HEX3_L_7_Segment_Display_1_Segment_D
            set_location_assignment PIN_B21 -to n_HEX3_L_7_Segment_Display_1_Segment_E
            set_location_assignment PIN_C22 -to n_HEX3_L_7_Segment_Display_1_Segment_F
            set_location_assignment PIN_B22 -to n_HEX3_L_7_Segment_Display_1_Segment_G
            set_location_assignment PIN_A19 -to n_HEX3_L_7_Segment_Display_1_DecimalPoint
            set_location_assignment PIN_F21 -to n_HEX4_L_7_Segment_Display_1_Segment_A
            set_location_assignment PIN_E22 -to n_HEX4_L_7_Segment_Display_1_Segment_B
            set_location_assignment PIN_E21 -to n_HEX4_L_7_Segment_Display_1_Segment_C
            set_location_assignment PIN_C19 -to n_HEX4_L_7_Segment_Display_1_Segment_D
            set_location_assignment PIN_C20 -to n_HEX4_L_7_Segment_Display_1_Segment_E
            set_location_assignment PIN_D19 -to n_HEX4_L_7_Segment_Display_1_Segment_F
            set_location_assignment PIN_E17 -to n_HEX4_L_7_Segment_Display_1_Segment_G
            set_location_assignment PIN_D22 -to n_HEX4_L_7_Segment_Display_1_DecimalPoint
    # Commit assignments
    export_assignments

    # Close project
    if {$need_to_close_project} {
        project_close
    }
}

