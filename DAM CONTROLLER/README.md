# Dam Controller using Verilog HDL

## 📌 Project Overview

This project implements an **Automatic Dam Controller** using Verilog HDL.

The controller monitors the water level in a dam and automatically controls the dam gate.

The design uses a simple **Finite State Machine (FSM)** to control the gate based on water-level sensor inputs.

### Water Levels

- LOW
- MEDIUM
- HIGH

### Controller Actions

- LOW → Gate Closed
- MEDIUM → Gate Closed
- HIGH → Gate Open

---

## 🎯 Objective

The main objective is to automatically control the dam gate according to the water level and prevent excessive water accumulation.

---

## Block Diagram

```text
       Water Level Sensors
              │
              ▼
       +---------------+
       | Dam Controller|
       |     FSM       |
       +---------------+
              │
              ▼
        Gate Controller
              │
       ┌──────┴──────┐
       ▼             ▼
   Gate Closed    Gate Open
```

---

## Inputs

| Signal | Description |
|---|---|
| clk | System clock |
| reset | Controller reset |
| low_level | Low water-level sensor |
| medium_level | Medium water-level sensor |
| high_level | High water-level sensor |

---

## Outputs

| Signal | Description |
|---|---|
| gate_open | Opens the dam gate |
| alarm | High-water warning |

---

## Control Logic

| Water Level | Gate | Alarm |
|---|---|---|
| LOW | Closed | 0 |
| MEDIUM | Closed | 0 |
| HIGH | Open | 1 |

---

## FSM States

| State | Description |
|---|---|
| CLOSED | Dam gate is closed |
| OPEN | Dam gate is open |

### State Transition

```text
                 HIGH
        +--------------------+
        |                    |
        ▼                    |
     +-------+           +-------+
     | CLOSED|           | OPEN  |
     +-------+           +-------+
        ▲                    |
        |                    |
        +------ LOW ---------+
```

---

## Features

- Automatic dam gate control
- Water-level monitoring
- FSM-based design
- High-water alarm
- Reset functionality
- Complete Verilog testbench
- Simulation waveform generation
- FPGA compatible

---

## Project Files

- `dam_controller.v` - Main Verilog design
- `dam_controller_tb.v` - Testbench
- `waveform.vcd` - Simulation waveform
- `simulation.png` - Waveform screenshot

---

## Software Used

- Verilog HDL
- ModelSim
- Vivado Simulator
- Icarus Verilog
- GTKWave

---

## Author

Harshitha Gangireddy