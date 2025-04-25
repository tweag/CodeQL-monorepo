#!/bin/bash

####################################################################################################
# INITIAL CONFIGURATION
####################################################################################################

# I did these steps in order to configure the project...

# 1) Used "VS Code Dev Containers" in order to execute the dot-net environment.
# --> https://code.visualstudio.com/docs/devcontainers/containers#_getting-started
# --> https://code.visualstudio.com/docs/devcontainers/tutorial

# 2) Installed "VS Code Extension - C# Dev Kit" in order to have the C# commands/supports.

# 3) Initialized the project with the following command:
# --> "Cmd + Shift + P" -> ".NET: New Project" -> "Console App"
# --> Name it as "ConsoleHelloWorldSanti"
# --> Select default values for the rest of the options
# >> This should create the "ConsoleHelloWorldSanti" folder, and the "ConsoleHelloWorldSanti.sln" files.

####################################################################################################
# BUILD AND RUN
####################################################################################################

# 1) Build the project
dotnet build

# >> will generate the "bin" folder with the compiled files and an output similar to:
# $ Determining projects to restore...
# $ All projects are up-to-date for restore.
# $ ConsoleHelloWorldSanti -> /workspaces/dot-net-hello-world/ConsoleHelloWorldSanti/bin/Debug/net8.0/ConsoleHelloWorldSanti.dll
# $ Build succeeded.
# $   0 Warning(s)
# $   0 Error(s)

# 2) Run the project
dotnet run --project ConsoleHelloWorldSanti
