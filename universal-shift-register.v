module usr_universal_shift_register(
    input clk,
    input rst,
    input [1:0] select,
    input [3:0] p_data,
    input s_in,
    output reg s_out,
    output reg [3:0] q_parallel);
always @(posedge clk or posedge rst) begin
if(rst) begin
q_parallel <= 4'b0000;
s_out <= 1'b0;
end 
else begin
case(select)
2'b00: q_parallel <= q_parallel;
2'b01:begin
s_out <= q_parallel[0];
q_parallel <= {s_in,q_parallel[3:1]};
end
2'b10:begin
s_out <= q_parallel[3];
q_parallel <= {q_parallel[2:0],s_in};
end
2'b11:begin
q_parallel <= p_data;
end
default: q_parallel <= q_parallel;
endcase
end
end
endmodule
