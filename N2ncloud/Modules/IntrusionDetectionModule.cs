// N2ncloud Security Platform - Intrusion Detection Module
// Real-time monitoring for unauthorized access attempts
// Copyright © 2024 N2ncloud Security

namespace N2ncloud.Modules;

/// <summary>
/// Intrusion Detection System (IDS) for monitoring and alerting on suspicious activities.
/// </summary>
public class IntrusionDetectionModule
{
    private bool _isEnabled;
    private IntrusionDetectionLevel _level;
    private readonly List<IntrusionAlert> _alerts;
    private readonly List<IntrusionRule> _rules;

    public IntrusionDetectionModule()
    {
        _isEnabled = true;
        _level = IntrusionDetectionLevel.Medium;
        _alerts = new List<IntrusionAlert>();
        _rules = new List<IntrusionRule>();
        
        InitializeDefaultRules();
    }

    public void Initialize()
    {
        _isEnabled = true;
    }

    private void InitializeDefaultRules()
    {
        _rules.Add(new IntrusionRule
        {
            Name = "Port Scan Detection",
            Description = "Detects network port scanning attempts",
            Category = IntrusionCategory.NetworkScan,
            IsEnabled = true,
            Severity = AlertSeverity.Medium
        });

        _rules.Add(new IntrusionRule
        {
            Name = "Brute Force Detection",
            Description = "Detects multiple failed login attempts",
            Category = IntrusionCategory.BruteForce,
            IsEnabled = true,
            Severity = AlertSeverity.High
        });

        _rules.Add(new IntrusionRule
        {
            Name = "SQL Injection Detection",
            Description = "Detects SQL injection attempts",
            Category = IntrusionCategory.Injection,
            IsEnabled = true,
            Severity = AlertSeverity.Critical
        });

        _rules.Add(new IntrusionRule
        {
            Name = "Buffer Overflow Detection",
            Description = "Detects buffer overflow attempts",
            Category = IntrusionCategory.Exploitation,
            IsEnabled = true,
            Severity = AlertSeverity.Critical
        });

        _rules.Add(new IntrusionRule
        {
            Name = "Privilege Escalation Detection",
            Description = "Detects unauthorized privilege escalation",
            Category = IntrusionCategory.PrivilegeEscalation,
            IsEnabled = true,
            Severity = AlertSeverity.Critical
        });
    }

    public bool Enable()
    {
        _isEnabled = true;
        return true;
    }

    public bool Disable()
    {
        _isEnabled = false;
        return true;
    }

    public bool IsEnabled => _isEnabled;

    public IntrusionDetectionLevel Level
    {
        get => _level;
        set => _level = value;
    }

    public void AddAlert(IntrusionAlert alert)
    {
        _alerts.Add(alert);
    }

    public bool DismissAlert(string alertId)
    {
        var alert = _alerts.FirstOrDefault(a => a.Id == alertId);
        if (alert != null)
        {
            alert.Status = AlertStatus.Dismissed;
            return true;
        }
        return false;
    }

    public IReadOnlyList<IntrusionAlert> GetAlerts() => _alerts.AsReadOnly();

    public IReadOnlyList<IntrusionRule> GetRules() => _rules.AsReadOnly();

    public IntrusionStatistics GetStatistics()
    {
        return new IntrusionStatistics
        {
            TotalAlerts = _alerts.Count,
            CriticalAlerts = _alerts.Count(a => a.Severity == AlertSeverity.Critical),
            HighAlerts = _alerts.Count(a => a.Severity == AlertSeverity.High),
            ActiveRules = _rules.Count(r => r.IsEnabled),
            IsEnabled = _isEnabled
        };
    }
}

public class IntrusionAlert
{
    public string Id { get; set; } = Guid.NewGuid().ToString();
    public DateTime Timestamp { get; set; }
    public string Source { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public IntrusionCategory Category { get; set; }
    public AlertSeverity Severity { get; set; }
    public AlertStatus Status { get; set; }
}

public class IntrusionRule
{
    public string Name { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
    public IntrusionCategory Category { get; set; }
    public bool IsEnabled { get; set; }
    public AlertSeverity Severity { get; set; }
}

public class IntrusionStatistics
{
    public int TotalAlerts { get; set; }
    public int CriticalAlerts { get; set; }
    public int HighAlerts { get; set; }
    public int ActiveRules { get; set; }
    public bool IsEnabled { get; set; }
}

public enum IntrusionDetectionLevel
{
    Low,
    Medium,
    High,
    Maximum
}

public enum IntrusionCategory
{
    NetworkScan,
    BruteForce,
    Injection,
    Exploitation,
    PrivilegeEscalation,
    Malware,
    DataExfiltration,
    Other
}

public enum AlertSeverity
{
    Low,
    Medium,
    High,
    Critical
}

public enum AlertStatus
{
    New,
    Acknowledged,
    Investigating,
    Resolved,
    Dismissed
}
