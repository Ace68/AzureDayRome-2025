using System.Text.Json;

namespace ChangeEventStreaming.Models;

public class OriginalMessage
{
    public string SpecVersion { get; set; } = "1.0";
    public string Type { get; set; } = "com.microsoft.SQL.CES.DML.V1";
    public string Source { get; set; } = "/";
    public string Id { get; set; } = string.Empty;
    public string LogicalId { get; set; } = string.Empty;
    public DateTime Timestamp { get; set; }
    public string DataContentType { get; set; } = "application/avro-json";
    public string Operation { get; set; } = "INS";
    public int SplitIndex { get; set; } = 0;
    public int SplitTotalCnt { get; set; } = 0;
    public JsonElement Data { get; set; }
}