# Constraints for Clock
set_property PACKAGE_PIN H16 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -name external_clock -period 10.00 [get_ports clk] 

# Constraints for BTN3 for admin factory reset
set_property PACKAGE_PIN M14 [get_ports {rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst}]
# Constraints for BTN2 for changing the password
set_property PACKAGE_PIN P15 [get_ports {btn2}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn2}]
# Constraints for BTN1 for locking the safe
set_property PACKAGE_PIN W13 [get_ports {btn1}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn1}]
# Constraints for BTN0 for confirming an attempt
set_property PACKAGE_PIN W14 [get_ports {btn0}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn0}]

# Constraints for SW11
set_property PACKAGE_PIN T14 [get_ports {d1[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d1[2]}]
# Constraints for SW10
set_property PACKAGE_PIN T11 [get_ports {d1[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d1[1]}]
# Constraints for SW9
set_property PACKAGE_PIN T12 [get_ports {d1[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d1[0]}]
# Constraints for SW8
set_property PACKAGE_PIN T10 [get_ports {d2[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d2[2]}]
# Constraints for SW7
set_property PACKAGE_PIN M15 [get_ports {d2[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d2[1]}]
# Constraints for SW6
set_property PACKAGE_PIN L15 [get_ports {d2[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d2[0]}]
# Constraints for SW5
set_property PACKAGE_PIN P14 [get_ports {d3[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d3[2]}]
# Constraints for SW4
set_property PACKAGE_PIN R14 [get_ports {d3[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d3[1]}]
# Constraints for SW3
set_property PACKAGE_PIN N16 [get_ports {d3[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d3[0]}]
# Constraints for SW2
set_property PACKAGE_PIN R16 [get_ports {d4[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d4[2]}]
# Constraints for SW1
set_property PACKAGE_PIN U20 [get_ports {d4[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d4[1]}]
# Constraints for SW0
set_property PACKAGE_PIN R17 [get_ports {d4[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {d4[0]}]

# Constraints for LD3 to indicate that the user has entered 3 incorrect attempts and has to wait for the 3 mins to be over
set_property PACKAGE_PIN T20 [get_ports {wrong}]
set_property IOSTANDARD LVCMOS33 [get_ports {wrong}]
# Constraints for LD2 to indicate that the safe is in its factory setting
set_property PACKAGE_PIN R19 [get_ports {factory}]
set_property IOSTANDARD LVCMOS33 [get_ports {factory}]
# Constraints for LD1 to indicate that the user is changing the password
set_property PACKAGE_PIN P20 [get_ports {mode}]
set_property IOSTANDARD LVCMOS33 [get_ports {mode}]
# Constraints for LD0 to indicate that the safe is open
set_property PACKAGE_PIN N20 [get_ports {open}]
set_property IOSTANDARD LVCMOS33 [get_ports {open}]

# Constraints for CA
set_property PACKAGE_PIN K14 [get_ports {ca}]
set_property IOSTANDARD LVCMOS33 [get_ports {ca}]
# Constraints for CB
set_property PACKAGE_PIN H15 [get_ports {cb}]
set_property IOSTANDARD LVCMOS33 [get_ports {cb}]
# Constraints for CC
set_property PACKAGE_PIN J18 [get_ports {cc}]
set_property IOSTANDARD LVCMOS33 [get_ports {cc}]
# Constraints for CD
set_property PACKAGE_PIN J15 [get_ports {cd}]
set_property IOSTANDARD LVCMOS33 [get_ports {cd}]
# Constraints for CE
set_property PACKAGE_PIN M17 [get_ports {ce}]
set_property IOSTANDARD LVCMOS33 [get_ports {ce}]
# Constraints for CF
set_property PACKAGE_PIN J16 [get_ports {cf}]
set_property IOSTANDARD LVCMOS33 [get_ports {cf}]
# Constraints for CG
set_property PACKAGE_PIN H18 [get_ports {cg}]
set_property IOSTANDARD LVCMOS33 [get_ports {cg}]
# Constraints for DP
set_property PACKAGE_PIN K18 [get_ports {ch}]
set_property IOSTANDARD LVCMOS33 [get_ports {ch}]

# Constraints for AN0
set_property PACKAGE_PIN K19 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
# Constraints for AN1
set_property PACKAGE_PIN H17 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
# Constraints for AN2
set_property PACKAGE_PIN M18 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
# Constraints for AN3
set_property PACKAGE_PIN L16 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]