// N2ncloud Security Platform
// Revolutionary AntiMalware Security Application
// Copyright © 2024 N2ncloud Security

namespace N2ncloud;

/// <summary>
/// Main entry point for the N2ncloud Security Platform application.
/// </summary>
internal static class Program
{
    /// <summary>
    /// The main entry point for the application.
    /// </summary>
    [STAThread]
    static void Main()
    {
        ApplicationConfiguration.Initialize();
        Application.Run(new MainForm());
    }
}
