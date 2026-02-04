// N2ncloud Security Platform - Firewall Module
// Advanced network traffic filtering and protection
// Copyright © 2024 N2ncloud Security

namespace N2ncloud.Modules;

/// <summary>
/// Firewall module for network protection and traffic filtering.
/// </summary>
public class FirewallModule
{
    private bool _isEnabled;
    private FirewallLevel _level;
    private readonly List<FirewallRule> _rules;
    private readonly List<BlockedConnection> _blockedConnections;

    public FirewallModule()
    {
        _isEnabled = true;
        _level = FirewallLevel.Medium;
        _rules = new List<FirewallRule>();
        _blockedConnections = new List<BlockedConnection>();
        
        InitializeDefaultRules();
    }

    public void Initialize()
    {
        // Initialize firewall with default settings
        _isEnabled = true;
        _level = FirewallLevel.Medium;
    }

    private void InitializeDefaultRules()
    {
        // Add default security rules
        _rules.Add(new FirewallRule
        {
            Name = "Block Incoming Unknown",
            Direction = FirewallDirection.Inbound,
            Action = FirewallAction.Block,
            Protocol = "TCP",
            IsEnabled = true
        });

        _rules.Add(new FirewallRule
        {
            Name = "Allow HTTP/HTTPS",
            Direction = FirewallDirection.Outbound,
            Action = FirewallAction.Allow,
            Protocol = "TCP",
            Ports = new[] { 80, 443 },
            IsEnabled = true
        });

        _rules.Add(new FirewallRule
        {
            Name = "Block Suspicious Ports",
            Direction = FirewallDirection.Both,
            Action = FirewallAction.Block,
            Protocol = "TCP",
            Ports = new[] { 4444, 5555, 6666, 7777 }, // Common malware ports
            IsEnabled = true
        });

        _rules.Add(new FirewallRule
        {
            Name = "Allow DNS",
            Direction = FirewallDirection.Outbound,
            Action = FirewallAction.Allow,
            Protocol = "UDP",
            Ports = new[] { 53 },
            IsEnabled = true
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

    public FirewallLevel Level
    {
        get => _level;
        set => _level = value;
    }

    public void AddRule(FirewallRule rule)
    {
        _rules.Add(rule);
    }

    public bool RemoveRule(string ruleName)
    {
        var rule = _rules.FirstOrDefault(r => r.Name == ruleName);
        if (rule != null)
        {
            _rules.Remove(rule);
            return true;
        }
        return false;
    }

    public IReadOnlyList<FirewallRule> GetRules() => _rules.AsReadOnly();

    public IReadOnlyList<BlockedConnection> GetBlockedConnections() => _blockedConnections.AsReadOnly();

    public void BlockConnection(string ipAddress, string reason)
    {
        _blockedConnections.Add(new BlockedConnection
        {
            IpAddress = ipAddress,
            Reason = reason,
            BlockedAt = DateTime.Now
        });
    }

    public FirewallStatistics GetStatistics()
    {
        return new FirewallStatistics
        {
            TotalRules = _rules.Count,
            ActiveRules = _rules.Count(r => r.IsEnabled),
            BlockedConnections = _blockedConnections.Count,
            IsEnabled = _isEnabled,
            Level = _level
        };
    }
}

public class FirewallRule
{
    public string Name { get; set; } = string.Empty;
    public FirewallDirection Direction { get; set; }
    public FirewallAction Action { get; set; }
    public string Protocol { get; set; } = "TCP";
    public int[]? Ports { get; set; }
    public string? IpAddress { get; set; }
    public bool IsEnabled { get; set; }
}

public class BlockedConnection
{
    public string IpAddress { get; set; } = string.Empty;
    public string Reason { get; set; } = string.Empty;
    public DateTime BlockedAt { get; set; }
}

public class FirewallStatistics
{
    public int TotalRules { get; set; }
    public int ActiveRules { get; set; }
    public int BlockedConnections { get; set; }
    public bool IsEnabled { get; set; }
    public FirewallLevel Level { get; set; }
}

public enum FirewallLevel
{
    Low,
    Medium,
    High,
    Maximum
}

public enum FirewallDirection
{
    Inbound,
    Outbound,
    Both
}

public enum FirewallAction
{
    Allow,
    Block,
    Log
}
