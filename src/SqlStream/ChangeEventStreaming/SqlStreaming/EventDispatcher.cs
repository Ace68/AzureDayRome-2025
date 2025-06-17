using System.Text;
using System.Text.Json;
using Azure.Messaging.EventHubs;
using Azure.Messaging.EventHubs.Processor;
using ChangeEventStreaming.Models;
using Microsoft.Extensions.Hosting;

namespace ChangeEventStreaming.SqlStreaming;

public class EventDispatcher(EventProcessorClient eventProcessorClient) : IHostedService
{
    public async Task StartAsync(CancellationToken cancellationToken)
    {
        cancellationToken.ThrowIfCancellationRequested();
        
        eventProcessorClient.ProcessEventAsync += EventProcessorClientOnProcessEventAsync;
        eventProcessorClient.ProcessErrorAsync += EventProcessorClientOnProcessErrorAsync;
        
        await eventProcessorClient.StartProcessingAsync(cancellationToken);
    }

    public Task StopAsync(CancellationToken cancellationToken)
    {
        cancellationToken.ThrowIfCancellationRequested();
        
        return Task.CompletedTask;
    }
    
    private Task EventProcessorClientOnProcessEventAsync(ProcessEventArgs eventArgs)
    {
        try
        {
            if (eventArgs.Data == null || eventArgs.Data.Body.IsEmpty)
            {
                Console.WriteLine("Received empty message body");
                return Task.CompletedTask;
            }

            var messageBody = eventArgs.Data.Body.ToArray();
            var jsonContent = Encoding.UTF8.GetString(messageBody);
            Console.WriteLine($"Raw JSON: {jsonContent}");

            var options = new JsonSerializerOptions
            {
                PropertyNameCaseInsensitive = true
            };

            var eventHubMessage = JsonSerializer.Deserialize<OriginalMessage>(jsonContent, options);
            if (eventHubMessage != null)
            {
                Console.WriteLine($"Received message Type: {eventHubMessage.Operation}");
            
                // For the inner data, deserialize from the data property
                // Convert the Data to a JsonElement first, then to the target type
                if (eventHubMessage.Data is JsonElement dataElement)
                {
                    var dataJson = dataElement.GetRawText();
                    Console.WriteLine($"Received Data      : {dataJson}");
                    
                }
            }
            else
            {
                Console.WriteLine("Failed to deserialize the message");
            }

            eventArgs.UpdateCheckpointAsync(eventArgs.CancellationToken);
        }
        catch (JsonException jsonEx)
        {
            Console.WriteLine($"JSON deserialization error: {jsonEx.Message}");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error processing event data: {ex.Message}");
        }

        return Task.CompletedTask;
    }
    
    private Task EventProcessorClientOnProcessErrorAsync(ProcessErrorEventArgs arg)
    {
        Console.WriteLine($"EventProcessorClientOnProcessErrorAsync: {arg.Exception}");
        
        return Task.CompletedTask;
    }
}