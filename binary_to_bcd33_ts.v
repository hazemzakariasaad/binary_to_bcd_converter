module BCDConvertTB;

  reg clk;
  reg en;
  reg [11:0] bin_d_in;
  wire [15:0] bcd_d_out;
  wire rdy;

  BCDConvert ziad (
    .clk (clk),
    .en (en),
    .bin_d_in (bin_d_in),
    .bcd_d_out (bcd_d_out),
    .rdy (rdy)
  );

  initial begin
    clk = 0;
    en = 1;
   bin_d_in = 12'b011000;

  end
  
  always begin
  #5 clk = ~clk;
  end 

  
    always @(posedge clk) 
    begin
    if (rdy) 
    begin
        // Test Case : Binary input with a single digit (No = ??)
        if (bcd_d_out == 16'b00100100) 
        begin
            $display("Test Case success");
        end
        else 
        begin
            $display("Test Case fail");
        end
        
           $finish;
        
        end
     
       end
    
endmodule
