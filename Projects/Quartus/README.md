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

### 3. Visualize Signals in the Simulation Waveform Editor

- Ensure the correct path to **modelsim.exe** is set by navigating to: **Tools > Options... > EDA Tool Options > ModelSim**.
- Click **File > New...**, then under **Verification/Debugging Files**, select **University Program VWF**.
- Click **Edit** and set both the **Set End Time...** and **Grid Size...**.
- Click **Edit > Insert > Insert Node or Bus...**.
- Click **Node Finder**.
- Click **List**.
- Add the target nodes and buses.
- Click **OK**.
- Click **OK** again.
- Set the initial values for the input signals using the icons in the toolbar.
- Run simulation:
  - **For Functional Simulation**:
    - Click **Simulation > Simulation Settings**.
    - Remove the term **"-novopt"** from the ModelSim Script to avoid errors.
    - Click **Save**.
    - Click **Run Functional Simulation** icon.

### 4. Analyze the Results

- Observe signal behavior in the **Simulation Waveform Editor** window.

### 5. Visualize the Generated Circuit

- Navigate to: **Tools > Netlist Viewers > RTL Viewer** (or any other viewer).

Happy designing!
