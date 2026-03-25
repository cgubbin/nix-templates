{
  description = "My project templates";

  outputs = {self}: {
    templates = {
      python-app = {
        path = ./templates/python-app;
        description = "Python application template";
      };

      python-lib = {
        path = ./templates/python-lib;
        description = "Python library template";
      };

      rust = {
        path = ./templates/rust;
        description = "Rust template";
      };

      go = {
        path = ./templates/go;
        description = "Go template";
      };

      c = {
        path = ./templates/c;
        description = "C template";
      };

      shell = {
        path = ./templates/shell;
        description = "Shell scripting template";
      };

      latex = {
        path = ./templates/latex;
        description = "LaTeX template";
      };

      cpp = {
        path = ./templates/cpp;
        description = "C++ template";
      };

      quarto = {
        path = ./templates/quarto;
        description = "Quarto python template";
      };
    };
  };
}
