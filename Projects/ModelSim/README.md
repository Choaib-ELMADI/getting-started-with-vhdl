# Visualize Modules Using ModelSim

This guide explains how to visualize modules using ModelSim, a popular simulation tool for hardware description languages (HDL) such as VHDL and Verilog.

### 1. Create a Project in ModelSim

- Create a directory for the project.
- Open ModelSim.
- Navigate to: **File > New > Project**.
- Set **Project Name** and **Project Location**, then click **OK**.

### 2. Add Source Files

- Click **Create New File** or **Add Existing File**:
  - **For 'Create New File'**:
    - Add a file name.
    - Select the target language (VHDL or Verilog).
    - Click **OK**.
    - Click **Close**.
    - Double-click on the file to edit its content.
  - **For 'Add Existing File'**:
    - Browse for the target file.
    - Click **OK**.
    - Click **Close**.

### 3. Compile the Target File

- Select the target file and click the **Compile** icon.
  - OR right-click on the target file > **Compile > ...**

### 4. Run the Simulation

- Click **Simulation > Start Simulation**.
- Expand the **work** library.
- Select your module name.
- Click **OK**.

### 5. Visualize Signals in the Wave Window

- Select the target signal and press **Ctrl + W**.
  - OR right-click on the target signal > **Add Wave**.

### 6. Run the Simulation

- Click the **Run** icon to execute the simulation.
- If you make changes to the program, restart the simulation using the **Restart** icon.

### 7. Analyze the Results

- Observe signal behavior in the **Wave** window.

Happy designing!
