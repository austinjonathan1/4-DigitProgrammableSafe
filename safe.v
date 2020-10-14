`timescale 1ns / 1ps
module safe(
    input wire clk, rst, btn2, btn1, btn0, // clock, factory reset, password change, lock safe, confirm attempt
    input wire [2:0] d1, d2, d3, d4, // user switch inputs
    output wire ch, // digit segment (Decimal Point)
    output reg ca, cb, cc, cd, ce, cf, cg, // Digit Segments
    output reg [3:0] an, // digit selection (Anode Activate)
    output reg wrong, factory, mode, open // incorrect password, factory setting: password = "0000", password change setting, open
);
assign ch = 1'b1; // Not Used
reg [34:0] delay;
reg [19:0] clk_count; // First 18-bit counter for creating 2.6ms digit period
reg [7:0] ds1, ds2, ds3, ds4; // Digit Display
reg [3:0] t1, t2, t3, t4, p1, p2, p3, p4, a1, a2, a3, a4;
reg [1:0] count;
reg toggle;
wire [1:0] led_count; // 2-bit counter for creating 4 LED-activating signals)
wire program, lock, confirm;
pulse(clk, rst, btn2, btn1, btn0, program, lock, confirm);

initial
begin
    {p1, p2, p3, p4} = {4'b0000, 4'b0000, 4'b0000, 4'b0000};
    {wrong, factory, mode, open} = 4'b0101;
    count = 2'b00;
end
always @ (posedge clk)
begin
    if (program)
    begin
        toggle = mode;
        mode = ~(toggle);
        if (toggle == 1'b1 && mode == 1'b0) {p1, p2, p3, p4} = {t1, t2, t3, t4};
    end
    else if (rst) {p1, p2, p3, p4} = {4'b0000, 4'b0000, 4'b0000, 4'b0000};
end

always @ (posedge clk)
begin
    if (({a1, a2, a3, a4} == {p1, p2, p3, p4}) && wrong == 1'b0 && confirm) open = 1'b1;
    else if (lock) open = 1'b0;
    else if (confirm && wrong == 1'b0)
    begin
        count = count + 2'b01;
        if (count == 2'b11) {wrong, count} = {1'b1, 2'b00};
    end
    else if (wrong && rst == 1'b0)
    begin
        delay = delay + 1'b1;
        if (delay > 35'b10001000000000000000000000000000000) {wrong, delay} = {1'b0, 35'b00000000000000000000000000000000000};
    end
    else if (rst) {wrong, open, delay} = {1'b0, 1'b1, 35'b00000000000000000000000000000000000};
end

always @ (posedge clk)
begin
    if ({p1, p2, p3, p4} == {4'b0000, 4'b0000, 4'b0000, 4'b0000}) factory = 1'b1;
    else factory = 1'b0;
end

always @(*) // Hexadecimal (4-bit User Input) to (Active-Low) Seven-Segment Display Conversion 
begin
    case (d1) // Switches 9 - 11
        3'h0:
        begin
            ds1 = 7'b0000001;
            if (mode) t1 = 4'b0000;
            else a1 = 4'b0000;
        end
        3'h1:
        begin
            ds1 = 7'b1001111;
            if (mode) t1 = 4'b0001;
            else a1 = 4'b0001;
        end
        3'h2:
        begin
            ds1 = 7'b0010010;
            if (mode) t1 = 4'b0010;
            else a1 = 4'b0010;
        end
        3'h3:
        begin
            ds1 = 7'b0000110;
            if (mode) t1 = 4'b0011;
            else a1 = 4'b0011;
        end
        3'h4:
        begin
            ds1 = 7'b1001100;
            if (mode) t1 = 4'b0100;
            else a1 = 4'b0100;
        end
        3'h5:
        begin
            ds1 = 7'b0100100;
            if (mode) t1 = 4'b0101;
            else a1 = 4'b0101;
        end
        3'h6:
        begin
            ds1 = 7'b0100000;
            if (mode) t1 = 4'b0110;
            else a1 = 4'b0110;
        end
        3'h7:
        begin
            ds1 = 7'b0001111;
            if (mode) t1 = 4'b0111;
            else a1 = 4'b0111;
        end
        default: ds1 = 7'b0000000;
    endcase
    case (d2) // Switches 6 - 8
        3'h0:
        begin
            ds2 = 7'b0000001;
            if (mode) t2 = 4'b0000;
            else a2 = 4'b0000;
        end
        3'h1:
        begin
            ds2 = 7'b1001111;
            if (mode) t2 = 4'b0001;
            else a2 = 4'b0001;
        end
        3'h2:
        begin
            ds2 = 7'b0010010;
            if (mode) t2 = 4'b0010;
            else a2 = 4'b0010;
        end
        3'h3:
        begin
            ds2 = 7'b0000110;
            if (mode) t2 = 4'b0011;
            else a2 = 4'b0011;
        end
        3'h4:
        begin
            ds2 = 7'b1001100;
            if (mode) t2 = 4'b0100;
            else a2 = 4'b0100;
        end
        3'h5:
        begin
            ds2 = 7'b0100100;
            if (mode) t2 = 4'b0101;
            else a2 = 4'b0101;
        end
        3'h6:
        begin
            ds2 = 7'b0100000;
            if (mode) t2 = 4'b0110;
            else a2 = 4'b0110;
        end
        3'h7:
        begin
            ds2 = 7'b0001111;
            if (mode) t2 = 4'b0111;
            else a2 = 4'b0111;
        end
        default: ds2 = 7'b0000000;
    endcase
    case (d3) // Switches 3 - 5
        3'h0:
        begin
            ds3 = 7'b0000001;
            if (mode) t3 = 4'b0000;
            else a3 = 4'b0000;
        end
        3'h1:
        begin
            ds3 = 7'b1001111;
            if (mode) t3 = 4'b0001;
            else a3 = 4'b0001;
        end
        3'h2:
        begin
            ds3 = 7'b0010010;
            if (mode) t3 = 4'b0010;
            else a3 = 4'b0010;
        end
        3'h3:
        begin
            ds3 = 7'b0000110;
            if (mode) t3 = 4'b0011;
            else a3 = 4'b0011;
        end
        3'h4:
        begin
            ds3 = 7'b1001100;
            if (mode) t3 = 4'b0100;
            else a3 = 4'b0100;
        end
        3'h5:
        begin
            ds3 = 7'b0100100;
            if (mode) t3 = 4'b0101;
            else a3 = 4'b0101;
        end
        3'h6:
        begin
            ds3 = 7'b0100000;
            if (mode) t3 = 4'b0110;
            else a3 = 4'b0110;
        end
        3'h7:
        begin
            ds3 = 7'b0001111;
            if (mode) t3 = 4'b0111;
            else a3 = 4'b0111;
        end
        default: ds3 = 7'b0000000;
    endcase
    case (d4) // Switches 0 - 2
        3'h0:
        begin
            ds4 = 7'b0000001;
            if (mode) t4 = 4'b0000;
            else a4 = 4'b0000;
        end
        3'h1:
        begin
            ds4 = 7'b1001111;
            if (mode) t4 = 4'b0001;
            else a4 = 4'b0001;
        end
        3'h2:
        begin
            ds4 = 7'b0010010;
            if (mode) t4 = 4'b0010;
            else a4 = 4'b0010;
        end
        3'h3:
        begin
            ds4 = 7'b0000110;
            if (mode) t4 = 4'b0011;
            else a4 = 4'b0011;
        end
        3'h4:
        begin
            ds4 = 7'b1001100;
            if (mode) t4 = 4'b0100;
            else a4 = 4'b0100;
        end
        3'h5:
        begin
            ds4 = 7'b0100100;
            if (mode) t4 = 4'b0101;
            else a4 = 4'b0101;
        end
        3'h6:
        begin
            ds4 = 7'b0100000;
            if (mode) t4 = 4'b0110;
            else a4 = 4'b0110;
        end
        3'h7:
        begin
            ds4 = 7'b0001111;
            if (mode) t4 = 4'b0111;
            else a4 = 4'b0111;
        end
        default: ds4 = 7'b0000000;
    endcase
end

always @(posedge clk) 
begin
    clk_count = clk_count + 1; // Increment count by one
end
assign led_count = clk_count[19:18]; // Take the most significant (the last) 2-bits

always @(led_count)
begin
    case(led_count) // Delays the clock frequency for proper display
        2'b00:
        begin
            an = 4'b1110; // Enable the first digit
            {ca, cb, cc, cd, ce, cf, cg} = ds4; // Diplay SW(0 - 2)
        end
        2'b01:
        begin
            an = 4'b1101; // Enable the second digit
            {ca, cb, cc, cd, ce, cf, cg} = ds3; // Diplay SW(3 - 5)
        end  
        2'b10:  
        begin
            an = 4'b1011; // Enable the third digit
            {ca, cb, cc, cd, ce, cf, cg} = ds2; // Diplay SW(6 - 8)
        end 
        2'b11:  
        begin
            an = 4'b0111; // Enable the fourth digit
            {ca, cb, cc, cd, ce, cf, cg} = ds1; // Diplay SW(9 - 11)
        end
        default: an = 4'b0000;
    endcase
end
endmodule

module pulse(
    input wire clk, rst, btn2, btn1, btn0,
    output wire program, lock, confirm
    );
reg p_pro, s_pro, p_lock, s_lock, p_con, s_con; // Pulses and Current States
// program
always @ (posedge clk or posedge rst)
begin
    if (rst || p_pro) p_pro <= 1'b0;
    else if (~btn2 && s_pro) s_pro <= 1'b0;
    else if (btn2 && ~p_pro && ~s_pro)
    begin
        p_pro <= 1'b1;
        s_pro <= 1'b1;
    end
end
// lock
always @ (posedge clk or posedge rst)
begin
    if (rst || p_lock) p_lock <= 1'b0;
    else if (~btn1 && s_lock) s_lock <= 1'b0;
    else if (btn1 && ~p_lock && ~s_lock)
    begin
        p_lock <= 1'b1;
        s_lock <= 1'b1;
    end
end
// confirm
always @ (posedge clk or posedge rst)
begin
    if (rst || p_con) p_con <= 1'b0;
    else if (~btn0 && s_con) s_con <= 1'b0;
    else if (btn0 && ~p_con && ~s_con)
    begin
        p_con <= 1'b1;
        s_con <= 1'b1;
    end
end
assign program = p_pro;
assign lock = p_lock;
assign confirm = p_con;
endmodule