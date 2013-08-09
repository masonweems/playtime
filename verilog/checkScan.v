module checkScan ( clock1, asyncReset1, syncReset1, scanData, scanCommand, userHashIn, userHashOut );

input clock1;
input asyncReset1_b;
input syncReset1;
input [1023:0] scanData;
input scanCommand;
input [127:0] userHashIn;

output [127:0] userHashOut;
output validHashOut;

always @ (posedge clock1 or !asyncReset1_b) 
  if (!asyncReset1_b) begin
    userHashOut <=  128'b0;
    validHashOut <= 1'b0;
  end else if (syncReset1) begin
    userHashOut <= 128'b0;
    validHashOut <= 1'b0;
  end else begin 
    userHashOut <= userHashOutD;
    validHashOut <= validHashOutD;
  end


always @ (scanData or scanCommand) 
case (scanCommand) 
  0: userHashOutD = {64'b1, 64'b0}; // Testing only
  1: userHashOutD = {64'b0, 64'b1}; // Testing only
endcase

assign validHashOutD = 1'b1; // Testing only

endmodule