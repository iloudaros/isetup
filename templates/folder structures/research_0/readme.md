# Template for research folders


## Folder Structure
This template provides a structured approach to organizing research projects. It includes sections for exploration, experiments, and findings, allowing for a clear and systematic documentation of the research process.

The main folders are:
- **exploration**: This folder contains initial explorations and hypotheses.
- **experiments**: This folder is for detailed experiments and methodologies that test our proposed ideas. Every experiment has a readme file that explains it, as well as its own subfolders, which contain the experiment's code, results and plots. 
- **given**: This folder contains the given data and any other resources that are provided at the start of the research project.
- **scripts**: This folder contains scripts and automation tools that assist in the research process.
- **setup**: This folder contains everything we need to set up the research environment, including configuration files and installation instructions.
- **src**: This folder contains the source code for the research project.

Also, there are two important files at the root of the project:
- **readme.md**: This file provides an overview of the research project, its goals, and how to navigate the folder structure.
- **justfile**: This file contains commands for automating common tasks, such as running experiments or generating reports.

> Conceptually, we would start by populating the **given** folder with the data we have. Next, we would create our **setup**. Then, we would move to the **exploration** folder to explore the data and form hypotheses. After that, we would produce our proposal in the **src** folder, and then move to the **experiments** folder to test our hypotheses. 