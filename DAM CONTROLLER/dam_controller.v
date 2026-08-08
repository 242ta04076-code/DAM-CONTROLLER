module dam_controller (
    input  wire clk,
    input  wire reset,

    input  wire low_level,
    input  wire medium_level,
    input  wire high_level,

    output reg gate_open,
    output reg alarm
);

    // FSM states
    parameter CLOSED = 1'b0;
    parameter OPEN   = 1'b1;

    reg state;
    reg next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= CLOSED;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*) begin

        case (state)

            CLOSED: begin
                if (high_level)
                    next_state = OPEN;
                else
                    next_state = CLOSED;
            end

            OPEN: begin
                if (low_level)
                    next_state = CLOSED;
                else
                    next_state = OPEN;
            end

            default:
                next_state = CLOSED;

        endcase

    end

    // Output logic
    always @(*) begin

        gate_open = 1'b0;
        alarm     = 1'b0;

        case (state)

            CLOSED: begin
                gate_open = 1'b0;
                alarm     = 1'b0;
            end

            OPEN: begin
                gate_open = 1'b1;
                alarm     = 1'b1;
            end

            default: begin
                gate_open = 1'b0;
                alarm     = 1'b0;
            end

        endcase

    end

endmodule