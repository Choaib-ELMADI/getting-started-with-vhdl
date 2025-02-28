# Visualize Modules Using Quartus

This guide explains how to visualize modules using Quartus, a popular FPGA design software for hardware description languages (HDL) such as VHDL and Verilog.

### 1. Create a Project in Quartus

- Navigate to: **File > New Project Wizard...**
- Choose the working directory and set the **Project Name**.
- Click **Next**.
- In **Project Type**, leave it as **Empty Project**.
- Click **Next**.
- Add existing files if there are any.
- Click **Next**.
- For **Family, Device & Board Settings**:
  - In the **Device** tab:
    - Search for **"10M50DAF484C6GES"** in the **Name filter** (or any other board number you have).
    - Select the found board.
  - In the **Board** tab:
    - Check the **"Create top-level design file."** checkbox.
- Click **Next**.
- Click **Next** again.
- Click **Finish**.

### 2. Compile the Project

- In **Project Navigator**, double-click the module name to view its content.
- In **Tasks**, select **Compilation** and double-click **Compile Design** to compile the HDL code.

### 3. Visualize the Generated Circuit

- Navigate to: **Tools > Netlist Viewers > RTL Viewer** (or any other viewer).

Happy designing!
