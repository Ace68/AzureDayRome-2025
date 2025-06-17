namespace ChangeEventStreaming.SqlStreaming;

public record EventHubOptions(
    string UserId,
    string ConnectionString,
    string EventHubName,
    string BlobStorageConnectionString,
    string BlobStorageContainerName);