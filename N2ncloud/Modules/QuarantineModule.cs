// N2ncloud Security Platform - Quarantine Module
// Isolated storage for detected threats
// Copyright © 2024 N2ncloud Security

namespace N2ncloud.Modules;

/// <summary>
/// Quarantine module for isolating and managing detected threats.
/// </summary>
public class QuarantineModule
{
    private readonly List<QuarantinedItem> _quarantinedItems;
    private readonly string _quarantinePath;

    public QuarantineModule()
    {
        _quarantinedItems = new List<QuarantinedItem>();
        _quarantinePath = Path.Combine(
            Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData),
            "N2ncloud",
            "Quarantine");
    }

    public void Initialize()
    {
        // Ensure quarantine directory exists
        if (!Directory.Exists(_quarantinePath))
        {
            try
            {
                Directory.CreateDirectory(_quarantinePath);
            }
            catch
            {
                // Unable to create quarantine directory
            }
        }
    }

    public bool QuarantineItem(string filePath, string threatName, string threatType)
    {
        try
        {
            var item = new QuarantinedItem
            {
                Id = Guid.NewGuid().ToString(),
                OriginalPath = filePath,
                FileName = Path.GetFileName(filePath),
                ThreatName = threatName,
                ThreatType = threatType,
                QuarantinedAt = DateTime.Now,
                Status = QuarantineStatus.Quarantined
            };

            _quarantinedItems.Add(item);
            return true;
        }
        catch
        {
            return false;
        }
    }

    public bool RestoreItem(string itemId)
    {
        var item = _quarantinedItems.FirstOrDefault(i => i.Id == itemId);
        if (item == null) return false;

        try
        {
            item.Status = QuarantineStatus.Restored;
            item.RestoredAt = DateTime.Now;
            return true;
        }
        catch
        {
            return false;
        }
    }

    public bool DeleteItem(string itemId)
    {
        var item = _quarantinedItems.FirstOrDefault(i => i.Id == itemId);
        if (item == null) return false;

        try
        {
            item.Status = QuarantineStatus.Deleted;
            item.DeletedAt = DateTime.Now;
            return true;
        }
        catch
        {
            return false;
        }
    }

    public IReadOnlyList<QuarantinedItem> GetQuarantinedItems()
    {
        return _quarantinedItems
            .Where(i => i.Status == QuarantineStatus.Quarantined)
            .ToList()
            .AsReadOnly();
    }

    public QuarantineStatistics GetStatistics()
    {
        return new QuarantineStatistics
        {
            TotalItems = _quarantinedItems.Count(i => i.Status == QuarantineStatus.Quarantined),
            RestoredItems = _quarantinedItems.Count(i => i.Status == QuarantineStatus.Restored),
            DeletedItems = _quarantinedItems.Count(i => i.Status == QuarantineStatus.Deleted),
            QuarantinePath = _quarantinePath
        };
    }

    public void ClearAll()
    {
        foreach (var item in _quarantinedItems.Where(i => i.Status == QuarantineStatus.Quarantined))
        {
            item.Status = QuarantineStatus.Deleted;
            item.DeletedAt = DateTime.Now;
        }
    }
}

public class QuarantinedItem
{
    public string Id { get; set; } = string.Empty;
    public string OriginalPath { get; set; } = string.Empty;
    public string FileName { get; set; } = string.Empty;
    public string ThreatName { get; set; } = string.Empty;
    public string ThreatType { get; set; } = string.Empty;
    public DateTime QuarantinedAt { get; set; }
    public DateTime? RestoredAt { get; set; }
    public DateTime? DeletedAt { get; set; }
    public QuarantineStatus Status { get; set; }
}

public class QuarantineStatistics
{
    public int TotalItems { get; set; }
    public int RestoredItems { get; set; }
    public int DeletedItems { get; set; }
    public string QuarantinePath { get; set; } = string.Empty;
}

public enum QuarantineStatus
{
    Quarantined,
    Restored,
    Deleted
}
