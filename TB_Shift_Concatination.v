module TB_Shift_Concatination();

    // Define parameters
    parameter PERIOD = 10; // Time period for clock
    parameter MAX_SIM_TIME = 1000; // Maximum simulation time

    // Declare signals
    reg [25:0] Jump_Offset_in;
    reg [31:0] PC_Counter_Output_in;
    wire [31:0] Data_Out;

    // Instantiate the module
    Shift_Concatinate dut (
        .Data_Out(Data_Out),
        .Jump_Offset_in(Jump_Offset_in),
        .PC_Counter_Output_in(PC_Counter_Output_in)
    );

    // Clock generation
    reg clk = 0;
    always #((PERIOD / 2)) clk = ~clk;

    // Stimulus generation
    initial begin
        // Initialize inputs
        Jump_Offset_in = 26'h4; // Example value for Jump_Offset_in
        PC_Counter_Output_in = 32'h5; // Example value for PC_Counter_Output_in

        // Apply inputs and observe outputs
        #20; // Wait a bit before applying inputs
        repeat (MAX_SIM_TIME) begin
            // Apply inputs
            Jump_Offset_in = Jump_Offset_in + 1; // Increment Jump_Offset_in
            PC_Counter_Output_in = PC_Counter_Output_in + 1; // Increment PC_Counter_Output_in

            // Display inputs and outputs
            $display("Time=%0t: Jump_Offset_in=%h, PC_Counter_Output_in=%h, Data_Out=%h", $time, Jump_Offset_in, PC_Counter_Output_in, Data_Out);

            // Terminate simulation if needed
            if ($time > MAX_SIM_TIME) begin
                $display("Simulation finished.");
                $finish;
            end

            // Wait for next clock cycle
            #PERIOD;
        end
    end

endmodule
