# 🚦 4-Way Traffic Light Controller (Moore FSM)

This Verilog design simulates a real-world **4-way traffic junction** using a **Moore finite state machine (FSM)**. Each road (North, East, South, West) is given time to go **green**, followed by **yellow**, while others remain **red**. This ensures safe and orderly traffic flow.

---

## 📁 File Structure

```
FSM/
├── traffic_controller_4way.v       # FSM logic for traffic light control
└── traffic_controller_4way_tb.v    # Testbench to verify functionality
```

---

## 🧠 How It Works (FSM Flow)

The FSM has **8 named states** and transitions through them cyclically:

| State              | Light ON    | Description                         |
|--------------------|-------------|-------------------------------------|
| `NORTH_GREEN`      | NS = Green  | North–South traffic moves           |
| `NORTH_YELLOW`     | NS = Yellow | NS prepares to stop                 |
| `EAST_GREEN`       | EW = Green  | East–West traffic moves             |
| `EAST_YELLOW`      | EW = Yellow | EW prepares to stop                 |
| `SOUTH_GREEN`      | SN = Green  | South–North traffic moves           |
| `SOUTH_YELLOW`     | SN = Yellow | SN prepares to stop                 |
| `WEST_GREEN`       | WE = Green  | West–East traffic moves             |
| `WEST_YELLOW`      | WE = Yellow | WE prepares to stop                 |

Each green signal stays on for **10 clock cycles**, yellow for **2 cycles**, controlled by a countdown timer.

---

## ⏲️ Timer-Based State Transitions

- A register `timer` is used to hold the **remaining ticks** in each state.
- Every state assigns a timer value:
  - Green states: `timer <= 10;`
  - Yellow states: `timer <= 2;`
- On every clock edge, the FSM:
  - Decrements the timer
  - If timer reaches zero: FSM moves to the next state

---

## 🔦 Output Encodings

Each light signal is 2-bit:

| Code | Light    |
|------|----------|
| `00` | Red      |
| `01` | Green    |
| `10` | Yellow   |

Four output signals represent lights for four roads:
- `NS_light` (North-South)
- `EW_light` (East-West)
- `SN_light` (South-North)
- `WE_light` (West-East)

Example:
- When `state == NORTH_GREEN`, `NS_light = 2'b01` (Green), others = `2'b00` (Red)

---

## ⚙️ Code Overview

```verilog
// FSM states are defined using enum-style localparam
localparam NORTH_GREEN  = 3'd0;
localparam NORTH_YELLOW = 3'd1;
...

// FSM state and timer registers
reg [2:0] state, next_state;
reg [3:0] timer;  // 4-bit counter for 0–15

// On reset: state = NORTH_GREEN, timer = 10
always @(posedge clk or posedge reset) begin
    if (reset) begin
        state <= NORTH_GREEN;
        timer <= 10;
    end else begin
        if (timer == 0) begin
            state <= next_state;
            timer <= (next_state is green ? 10 : 2);
        end else begin
            timer <= timer - 1;
        end
    end
end

// Output logic based on current state
always @(*) begin
    case (state)
        NORTH_GREEN:  NS_light = GREEN; others = RED;
        NORTH_YELLOW: NS_light = YELLOW; others = RED;
        ...
    endcase
end
```

---

## 🧪 Testbench Description

The testbench:
- Generates a 10ns period clock
- Asserts reset for the first 10ns
- Runs simulation for enough time to cycle through multiple FSM states
- Uses `$monitor` to observe:
  - Current simulation time
  - State of reset
  - Output values of each direction

```verilog
$monitor("Time=%0t | NS=%b EW=%b SN=%b WE=%b", $time, NS_light, EW_light, SN_light, WE_light);
```

---

## ✅ Concepts Practiced

- Moore FSM design
- Clocked synchronous logic
- Timer-based state holding
- Multi-output logic block
- Clean modular style with `always @(*)` and `always @(posedge clk)`

---

## 🛠️ How to Simulate

```sh
# Compile
iverilog -o traffic_test traffic_controller_4way.v traffic_controller_4way_tb.v

# Run
vvp traffic_test
```

---

## 🔁 Extending the Design

Want to build on this? Here are ideas:
- Add input sensors (car presence)
- Add pedestrian walk signals
- Add emergency override input (like an ambulance signal)
- Make durations (`10`, `2`) dynamic using parameters or inputs

---

## 📎 GitHub

[🔗 Click here to view on GitHub](https://github.com/AVM-27/RTL-for-Kids/tree/main/Verilog/FSM)

---

**Author**: Adarsh Venugopal  
**Created On**: 2025-08-02

---
