# 📡 UART Transmitter (FSM-Based) – Verilog

A finite state machine (FSM)-based **UART Transmitter** designed in Verilog. The module handles serial transmission of 8-bit data, including framing with start and stop bits, following the UART protocol.

---

## 🔧 Features

- **FSM-based** architecture (IDLE → START → DATA → STOP)
- Sends 1 start bit, 8 data bits (LSB first), 1 stop bit
- 1-bit `tx` serial output line
- `tx_start` signal to begin transmission
- `tx_busy` signal to indicate active transmission

---

## 🧠 FSM Description

| State  | Description                          |
|--------|--------------------------------------|
| IDLE   | Waiting for `tx_start` = 1           |
| START  | Sends start bit `0`                  |
| DATA   | Sends 8 data bits, LSB first         |
| STOP   | Sends stop bit `1`, then goes IDLE   |

---

## 🧬 Signal Descriptions

| Signal     | Direction | Width | Description                                  |
|------------|-----------|-------|----------------------------------------------|
| `clk`      | Input     | 1     | System clock                                 |
| `reset`    | Input     | 1     | Active-high synchronous reset                |
| `tx_start` | Input     | 1     | Pulse to trigger transmission                |
| `tx_data`  | Input     | 8     | Byte of data to transmit                     |
| `tx`       | Output    | 1     | Serial transmission output line              |
| `tx_busy`  | Output    | 1     | High while transmission is in progress       |

---

## ⌛ Timing and Baud Rate

- **Timing Counter** inside the FSM divides the system clock to simulate a slower **baud rate**.
- Example: If `clk = 100 MHz`, counter can divide to get **9600 baud**.

> You can customise `BAUD_DIV` constant in the Verilog code to match the required baud rate.

---

## 🧪 Testbench

The testbench:
- Applies `tx_data` values (e.g., `8'hA5`, `8'h3C`)
- Pulses `tx_start` to initiate transmission
- Monitors `tx` output and `tx_busy` status
- Waits between bytes until `tx_busy` goes low

---

## 📂 File Structure

```bash
UART_TX/
├── uart_tx.v         # FSM-based UART Transmitter
├── uart_tx_tb.v      # Testbench with realistic inputs
└── README.md         # This file
