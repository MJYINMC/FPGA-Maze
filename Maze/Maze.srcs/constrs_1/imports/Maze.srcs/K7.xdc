# VGA PART
set_property IOSTANDARD LVCMOS33 [get_ports HSync]
set_property IOSTANDARD LVCMOS33 [get_ports VSync]
set_property IOSTANDARD LVCMOS18 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaBlue[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaGreen[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {vgaRed[0]}]

# KEYBOARD PART
set_property IOSTANDARD LVCMOS33 [get_ports ps2k_clk]
set_property IOSTANDARD LVCMOS33 [get_ports ps2k_data]

# SSeg PART
set_property IOSTANDARD LVCMOS33 [get_ports seg_clk]
set_property IOSTANDARD LVCMOS33 [get_ports seg_clrn]
set_property IOSTANDARD LVCMOS33 [get_ports seg_sout]
set_property IOSTANDARD LVCMOS33 [get_ports SEG_PEN]

# Audio PART
set_property IOSTANDARD LVCMOS33 [get_ports AUD_PWM]
set_property IOSTANDARD LVCMOS33 [get_ports AUD_SD]

# BUTTON PART
set_property IOSTANDARD LVCMOS18 [get_ports BTN_X]
set_property IOSTANDARD LVCMOS18 [get_ports {BTN_Y[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {BTN_Y[1]}]

# SW PART
set_property IOSTANDARD LVCMOS15 [get_ports {SW[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {SW[2]}]

# BUZZER PART
# set_property IOSTANDARD LVCMOS33 [get_ports BUZZER]
# set_property IOSTANDARD LVCMOS33 [get_ports HIGH]

set_property PACKAGE_PIN AC18 [get_ports clk]
set_property PACKAGE_PIN N18 [get_ports ps2k_clk]
set_property PACKAGE_PIN M19 [get_ports ps2k_data]
set_property PACKAGE_PIN M22 [get_ports HSync]
set_property PACKAGE_PIN M21 [get_ports VSync]
set_property PACKAGE_PIN T23 [get_ports {vgaBlue[3]}]
set_property PACKAGE_PIN T22 [get_ports {vgaBlue[2]}]
set_property PACKAGE_PIN R20 [get_ports {vgaBlue[1]}]
set_property PACKAGE_PIN T20 [get_ports {vgaBlue[0]}]
set_property PACKAGE_PIN T25 [get_ports {vgaGreen[3]}]
set_property PACKAGE_PIN T24 [get_ports {vgaGreen[2]}]
set_property PACKAGE_PIN R23 [get_ports {vgaGreen[1]}]
set_property PACKAGE_PIN R22 [get_ports {vgaGreen[0]}]
set_property PACKAGE_PIN P21 [get_ports {vgaRed[3]}]
set_property PACKAGE_PIN R21 [get_ports {vgaRed[2]}]
set_property PACKAGE_PIN N22 [get_ports {vgaRed[1]}]
set_property PACKAGE_PIN N21 [get_ports {vgaRed[0]}]

set_property PACKAGE_PIN M24 [get_ports seg_clk]
set_property PACKAGE_PIN M20 [get_ports seg_clrn]
set_property PACKAGE_PIN L24 [get_ports seg_sout]
set_property PACKAGE_PIN R18 [get_ports SEG_PEN]

set_property PACKAGE_PIN P26 [get_ports AUD_PWM]
set_property PACKAGE_PIN M25 [get_ports AUD_SD]

set_property PACKAGE_PIN W16 [get_ports BTN_X]
set_property PACKAGE_PIN V18 [get_ports {BTN_Y[0]}]
set_property PACKAGE_PIN V19 [get_ports {BTN_Y[1]}]

set_property PACKAGE_PIN AA10 [get_ports SW[0]]
set_property PACKAGE_PIN AB10 [get_ports SW[1]]
set_property PACKAGE_PIN AA13 [get_ports SW[2]]

# set_property PACKAGE_PIN P26 [get_ports BUZZER]
# set_property PACKAGE_PIN M25 [get_ports HIGH]