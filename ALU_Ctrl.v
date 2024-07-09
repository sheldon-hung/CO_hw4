module ALU_Ctrl( funct_i, ALUOp_i, ALU_operation_o, FURslt_o );

//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALU_operation_o;  
output     [2-1:0] FURslt_o;
     
//Internal Signals
wire		[4-1:0] ALU_operation_o;
wire		[2-1:0] FURslt_o;

//Main function
/*your code here*/

reg [4-1:0] ALU_operation_r;
reg [2-1:0] FURslt_r;
always@(ALUOp_i, funct_i) begin
    if(ALUOp_i == 3'b010) begin // R-type
        case(funct_i) 
            6'b010010 : begin //add
                ALU_operation_r = 4'b0010;
                FURslt_r = 2'b00;
            end
            6'b010000 : begin //sub
                ALU_operation_r = 4'b0110;
                FURslt_r = 2'b00;
            end
            6'b010100 : begin //and
                ALU_operation_r = 4'b0000;
                FURslt_r = 2'b00;
            end
            6'b010110 : begin //or
                ALU_operation_r = 4'b0001;
                FURslt_r = 2'b00;
            end
            6'b010101 : begin //nor
                ALU_operation_r = 4'b1100;
                FURslt_r = 2'b00;
            end
            6'b100000 : begin //slt
                ALU_operation_r = 4'b0111;
                FURslt_r = 2'b00;
            end
            6'b000000 : begin //sll
                ALU_operation_r = 4'b0001;
                FURslt_r = 2'b01;
            end
            6'b000010 : begin //srl
                ALU_operation_r = 4'b0000;
                FURslt_r = 2'b01;
            end
        endcase
    end
    else if(ALUOp_i == 3'b011) begin // addi
        ALU_operation_r = 4'b0010;
        FURslt_r = 2'b00;
    end
    else if(ALUOp_i == 3'b000) begin// lw, sw
        ALU_operation_r = 4'b0010;
        FURslt_r = 2'b00;
    end
    else if(ALUOp_i == 3'b001) begin // beq
        ALU_operation_r = 4'b0110;
        FURslt_r = 2'bxx;
    end
    else if(ALUOp_i == 3'b110) begin //bne
        ALU_operation_r = 4'b0110;
        FURslt_r = 2'bxx;
    end
    else begin // j
        ALU_operation_r = 4'bxxxx;
        FURslt_r = 2'bxx;
    end

end

assign ALU_operation_o = ALU_operation_r;
assign FURslt_o = FURslt_r;

endmodule     
